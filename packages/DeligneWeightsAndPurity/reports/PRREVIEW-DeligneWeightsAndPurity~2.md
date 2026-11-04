# Review of DeligneWeightsAndPurity (pull request #929 at 87323d1)

**Verdict:** needs changes

## R01 (P2) — Import the curve Weil bound that SchemeAndStackFoundations §5.11 already owns

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:980` (§1.6): “`|#C(𝔽_{q^m}) − q^m − 1| ≤ 2g·q^{m/2}`”; the Scope section (lines 22–69) and the supplier contracts (lines 96–512) never name SchemeAndStackFoundations §5.11.

**Claim:** The numerical Weil bound for a smooth projective geometrically connected curve over a finite field is already a target of a roadmap on main, with a Lean statement, and the main roadmap explicitly reserves the cohomological route as a downstream comparison. §1.6 schedules the same object again (through the Jacobian), without citing the owner or saying in one clause how its variant differs. This is the same defect class as the degree-refined Chebotarev duplication repaired after the previous review: a theorem that an earlier roadmap supplies is restated as a target here.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7273` on main (c994070), “§5.11 The Weil bound via surfaces”, proves `|#C(𝔽_q) − (q+1)| ≤ 2g√q` and states that the curve-cohomological route is a downstream comparison; `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:2598` declares `weil_bound` on a smooth proper geometrically integral curve with `X.genus k`. ArithmeticGaloisRepresentations §5.13, which this roadmap imports, already takes the all-degrees bound from §5.11 by base change.

**Repair:** In Scope, list the curve point-count bound as supplied by SchemeAndStackFoundations §5.11, and add a supplier subsection “SchemeAndStackFoundations §5.11 (the Weil bound via surfaces)” naming `weil_bound` and the base-change extension to every `𝔽_{q^m}`. Rewrite §1.6 as the Jacobian variant that §5.11 does not state: the reciprocal roots `a_i` of `P_{π_J}` are Weil `q`-numbers of weight `1`, `#C(𝔽_{q^m}) = 1 − Σ a_i^m + q^m`, and `Z(C,t) = P^{rev}(t)/((1−t)(1−qt))`; say in one clause that the numerical bound is §5.11’s and that the two agree (for `g = 1`, trace `1`, `q = 2`: both give `|2 − 3| ≤ 2√2`). Update the module docstring of `Suggested.lean`, which says the curve estimate needs rational adic cohomology: the numerical bound is stated by SchemeAndStackFoundations, and only the Jacobian-root clause needs the Tate-module carrier.

## R02 (P3) — Cite the pinned Hasse bound instead of a roadmap layer

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1000` (§1.8): “This is the Hasse bound that Tau Ceti EllipticCurves Layer `3` proves independently”; supplier contract at line 452, “EllipticCurves, Layer 3 (Hasse bound)”.

**Claim:** The Hasse bound exists at the pinned Tau Ceti as a proved declaration; a supplier contract cites what exists at the pin by name and file, not as a roadmap target.

**Witness:** `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:52` `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card` (`a_q² ≤ 4q`) and line 65 `WeierstrassCurve.hasse_bound` (`(#E(𝔽_q) − (q+1))² ≤ 4q`), both sorry-free at Tau Ceti `a91d3aa`.

**Repair:** Move the Hasse contract to “From Mathlib and Tau Ceti”, naming both declarations and their file, and let §1.8 compare §1.4’s root-modulus estimate with `frobeniusTrace_sq_le_four_mul_card` (the trace form `a = q + 1 − #E(𝔽_q)` is `W.frobeniusTrace`). For `y² = x³ − x` over `𝔽₃`: `a = 0`, `0 ≤ 12`, agreeing with the roots `±i√3`.

## R03 (P3) — Remove the citation of a roadmap that exists nowhere

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:29` (Scope): “StandardConjectures Layers `0`–`1` consume this core”; line 3040 (§9.7): “the common-core export to StandardConjectures §§0.1–0.4”.

**Claim:** A cross-roadmap citation must resolve to a roadmap on main or at an open head; this one resolves to nothing, so a reader cannot check the claimed interface.

**Witness:** The worker’s citation check and my rerun of `roadmaps resolve` both report “StandardConjectures §§0.1: no roadmap StandardConjectures on main or in an open pull request” (432 open roadmap pull requests indexed, main at c994070).

**Repair:** Describe the consumer without the name (“a characteristic-zero Lefschetz-structure consumer packages this core with its `sl₂` triple and grade projectors”), or cite EtaleDualityAndPerverseSheaves, which does exist at an open head and names §9.7 as its vector-space primitive core.

## R04 (P3) — Fix the broken relative link into a folder that is not on main

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:299`: “[the weight-facing acceptance suite](../AutomorphicLFunctionsAndLocalFactors/README.md#weight-facing-acceptance-suite)”.

**Claim:** The target folder is not on main, and the fragment does not match the heading at the open head, so the link is dead in both places.

**Witness:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors` is absent from main (c994070); at the open head the heading is “### AL.3.11 The weight-facing acceptance suite”, whose fragment is not `weight-facing-acceptance-suite`.

**Repair:** Replace the link by the prose citation “AutomorphicLFunctionsAndLocalFactors §AL.3.11” (roadmap name and section, no file link), as the house style requires for roadmaps still in pull requests.

## R05 (P3) — Give the ℤ[1/ℓ] purity definition its Checks

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2518` (§8.13): “Call `K ∈ D^b_c(X)` pure of weight `w` when `K` is mixed of weights `≤ w` … and `D′K` is mixed of weights `≤ −w`.”

**Claim:** This is a definition (a new purity predicate with the dualizing complex over `ℤ[1/ℓ]`), and it carries no API bullets and no Checks, while every other definition in the roadmap has at least three.

**Witness:** §8.13 has no `Checks` list; compare §8.2, whose finite-field purity has four Checks. The two definitions differ by the twist `K′_X = K_X(−1)[−2]`, which is exactly what a Check should pin.

**Repair:** Add at least three Checks: at a closed point `Spec 𝔽_p` of `Spec ℤ[1/ℓ]`, `D′ℚ̄_ℓ = ℚ̄_ℓ(−1)[−2]` has `ℋ²` of weight `2 = −0 + 2`, so `ℚ̄_ℓ` is pure of weight `0`; on `ℙ¹_{𝔽_q}` the complex `j_!ℚ̄_ℓ` of §8.20’s Check is mixed of weights `≤ 0` but not pure (its `H¹` has weight `0`); the zero complex is pure of every weight; and over `𝔽_p` the predicate agrees with §8.2 because `D′ = D(−1)[−2]`.

## R06 (P3) — Delete the unused reference

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:3276`: “**[Sch]** Olivier Schiffmann, Indecomposable vector bundles and stable Higgs bundles …”.

**Claim:** No target cites [Sch]; a reference list entry that nothing uses is dead weight for the sources manifest.

**Witness:** `grep -n '\[Sch\]'` on the README returns only line 3276.

**Repair:** Remove the entry, or cite it where it is actually used.

## Verified sound

### The previous review’s findings

| Finding | Passage at 87323d1 | Status |
| --- | --- | --- |
| R01 twist phase | §5.4 line 1518: “the constant Weil line `L_c` whose degree-one Frobenius scalar `c` satisfies `ι(c)=q^β`” and the Check “Phase matters … `T²−(1+i)T+i`” | repaired; recomputed below (5.4) |
| R02 Chebotarev duplicate | §3.7 line 1255: “The degree refinement is imported from ArithmeticGaloisRepresentations §5.13” and the supplier contract at line 313 | repaired; §5.13 resolved at head 2194655 (“Chebotarev for function fields”, count `(#B/#H_geom) q^n/n + O(q^{n/2}/n)`) |
| R03 abelian point-count headline | `Suggested.lean:79` `abelianPointCountBound` on `TauCeti.AlgebraicGeometry.AbelianVariety` | repaired; elaborates, values recomputed below (1.5) |
| R04 raw anchors | no `<a id=` lines; gate `residue=0` | repaired |
| R05 namespace and form | `namespace TauCetiRoadmap.DeligneWeightsAndPurity`, title “target signatures”, layer comments | repaired |
| R06 undeclared identifiers | the only backticked names of this roadmap’s own are the ten declarations of `Suggested.lean`; gate `readme-ids-missing=0` | repaired |

### Gate, dependency check and diff

Worker’s gate at this head: `gate DeligneWeightsAndPurity: … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. My rerun of the dependency check printed `depcheck: 201 roadmaps, 1320 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

### Seeded source sample

All fifteen targets checked against legally fetched text (Numdam for WI, WII, Lef; author page for AV; arXiv for Yu, BFP, Sun). Printed pages; line numbers are those of the sources cache extraction.

| Target | Locator opened | Supports the statement as written |
| --- | --- | --- |
| 0.13 | WII line 704–706, (1.2.5)(ii) p.154 | yes: tensor weights add, lisse dual negates; the `Hom` and `⊗k` clauses are the elementary consequences |
| 0.18 | WI line 159–169, proof (1.7)⇒(1.6) p.277 | yes: distinct-weight factors coprime, weight partition Galois-stable |
| 2.1 | WI line 414–416, (3.1) pp.283–284 | yes: weight `β` of a lisse sheaf on an open of `ℙ¹` via closed-point stalks |
| 2.3 | WI line 453–464, (3.7) p.285 | yes: `ψ_P` for pair partitions, Zariski density, subset `𝒫′` depending on `dim`, `(⊗^{2k})_{Sp} ≅ ℚ_ℓ(−kβ)^N` |
| 2.6 | WI line 436–441, Lemme (3.4) p.284 | yes |
| 2.11 | WI line 514–532, (3.9) pp.286–287 | yes: `q^{(β+1)/2−1/2} ≤ |α| ≤ q^{(β+1)/2+1/2}`, i.e. `q^{β/2}` and `q^{β/2+1}` |
| 3.1 | WI line 819–832, (6.1) pp.294–295 | yes: `ℰ₀` defined over `𝔽_q`, alternating `ψ` into `ℚ_ℓ(−n)`, perfect on `ℰ₀/(ℰ₀∩ℰ₀^⊥)`; `d = n` odd |
| 3.4 | WI line 887–896, Lemme (6.7) p.297 | yes; the proof allows `n_{ij} = 0`, matching “nonnegative integers ≠ 1” |
| 3.6 | WI line 935–942, Lemme (6.12) p.298 | yes: closed, null per degree fibre, Fubini |
| 5.4 | WII line 781–793, (1.2.12)–(1.2.14) pp.155–156 | yes; (1.2.14) asserts existence of a real envelope, the README now prescribes `ι(c) = q^β` |
| 5.11 | WII line 1334–1355 and 1528–1546, (1.7.2)–(1.7.3), (1.8.4) pp.170–176; (1.8.8) line 1566–1570 | yes: `Gr^M_i` pure of weight `β+i`; invariants of weight `≤ β` |
| 7.1 | WII line 681–725, (1.2.1)–(1.2.6) pp.153–154; line 309–311, (0.1) p.144 | yes: separated noetherian with `ℓ` invertible; integer purity, `ι`-weights, mixedness |
| 9.8 | Lef line 58–71, (1.5)–(1.6) p.108; WII line 3097–3102, (4.1.5) p.218 | yes: `⊕u^k` and `⊕u^{i+k}` isomorphisms; parity from the alternating form |
| 10.5 | WII line 2814–2851, (3.5.1)–(3.5.3) pp.210–211 | yes: `z^{−n}` translate of `q^{−(nd+i)N} Σ δ[(ιF_x)_ss]` converges to Haar on the degree-`i` fibre |
| 10.6 | WII line 2852–2884, (3.5.4)–(3.5.7) pp.211–212, and the rendered printed page 212 | yes, with the two printed misprints the README corrects (see Source issues) |

Further locators opened: WI (1.5.3)–(1.5.4), (1.14)–(1.15) line 121–260; WII (1.3.1)–(1.3.15) line 806–1016, (1.5.1)–(1.5.3) line 1085–1127, (1.6.1) line 1129–1138, (1.8.1)–(1.8.2) line 1500–1523, (1.8.9)–(1.8.13) line 1615–1641, (1.10.5)–(1.11.5) line 1816–1939, (2.1.1)–(2.2.10) line 1944–2304, (3.1.1)–(3.2.15) line 2339–2569, (3.3.1)–(3.4.14) line 2571–2812, (4.1.1)–(4.1.6) line 3049–3109, (4.3.9)–(4.3.10) line 3381–3397, (6.1.2)–(6.2.13) line 4007–4272; AV II Thm 1.1, Lemmas 1.2–1.3, Rem 1.4, Cor 1.5, Rem 1.6 line 3105–3232 (printed 75–78), III Thm 11.1, Cor 11.4, Rem 11.5 line 4808–4871 (printed 118–119); Yu §1 line 70–135, Prop 6.1.1 line 2253–2295, §7.1 line 3730–3770; BFP Prop 4.2 line 282–317; Sun Prop 7.3.2 line 2615–2634. Each supports the clause it is cited for; Milne’s bound at AV line 3111 is exactly the §1.5 inequality.

### Adversarial computations

Each row gives the instance and the values on both sides. “Pass” means the instance agrees with the statement and conventions; it is not a proof of the general theorem. Fields exclude the zero ring; `q > 1` is retained everywhere.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 0.1 | `q=2`, `T²−T+2`; `1+√2`; `q⁻¹`; `0` | roots `(1±i√7)/2`, `|·|²=2`; conjugate product `−1` forces `n=0` but `|1+√2|≈2.414≠1`; `q⁻¹` weight `−2` non-integral; `0` has root `0` | pass |
| 0.2 | `α=2,β=1/2` at `q=2`; `α=(1+i√7)/2` | `αβ=1` weight `0=2−2`; `α+2/α=1` real; integral unit `−1` is a root of unity | pass |
| 0.3 | `q=2,α=−√2,r=2`; `r=0` | `α²=2`, `4^{1/2}=2`; converse `α=±√2` both weight `1`; `r=0` gives `1` for all `α` | pass |
| 0.4 | `q=2`: `2`, `1/2`, `1+√2`, `ζ` | weights `2`, `−2`, `±2log₂(1+√2)≈±2.543`, `0` | pass |
| 0.5 | `ℚ̄` vs `ℂ`; `ℚ(t)`, `t↦z,2z` | `ℵ₀<𝔠` so no isomorphism; both extensions exist | pass |
| 0.6 | `E=ℚ(t)`, `α=t` | `ι(t)=z` arbitrary transcendental, moduli differ, (b) fails, not Weil | pass |
| 0.7 | `[[q,1],[0,q]]`; `[[0,−q],[1,0]]`; `diag(1,q)`; `V=0`; `F=0` | roots `q,q`; `±i√q` modulus `q^{1/2}`; weights `{0,2}`; none; root `0` rejected | pass |
| 0.8 | `[[1,1],[0,2]]`, `W=⟨e₁⟩` | `(T−1)(T−2)`; `det=2=1·2` | pass |
| 0.9 | `J₂(1)`, `W=⟨e₁⟩` | both subquotients weight `0`, extension non-split | pass |
| 0.10 | `diag(1,2)`; `I₂` over `𝔽₂` | `D=1−3t+2t²`, `−tD′/D=3t+5t²+9t³+…`, traces `3,5,9`; over `𝔽₂` traces `0` but `D=1+t²` | pass |
| 0.11 | `diag(1,−1)`, `P=T²`; `F⁻¹` | `P(F)=I`, roots `{1,1}`; inverse roots `{1,−1}` | pass |
| 0.12 | `diag(√2,−√2)`, `q=2`, `r=2` | `F²=2I`, `2=4^{1/2}`, weight `1` both ways, roots merged | pass |
| 0.13 | `F=[2],G=[4],q=2` | `8`→`6`; `1/2`→`−2`; `4/2=2`→`2=4−2` | pass |
| 0.14 | `diag(2,3)` | `∧⁰{1}`,`∧¹{2,3}`,`∧²{6}`,`∧³=0` | pass |
| 0.15 | `F=[2]`, `q=2` | `V(1)` scalar `1` weight `0`; half twists `±√2` weight `1`, non-isomorphic | pass |
| 0.16 | `ℚ`, `B=xy`, `F=2,F′=3,c=6` | `B(Fx,F′y)=6xy`; `{3}={6/2}`; `{2}` not `α↦6/α`-stable; `(−T)·det(6/T−2)/2=T−3` | pass |
| 0.17 | `q=2`, `F=1,G=2`; `G=1` | `u=2u⇒u=0`; `u=1` survives | pass |
| 0.18 | `diag(1,2)`, `q=2`; `J₂(2)` | `P₀=T−1,P₂=T−2`, `V₀⊕V₂`; one non-semisimple summand | pass |
| 0.19 | `q=2`, `Sp(2)` `F=diag(1,1/2)`, `Ne₀=e₁`; `q=1` | `NF=qFN` on both basis vectors; `M_{−2}=0,M_{−1}=M₀=Ee₁,M₁=V`; `gr_{−1}` weight `−2=w−1`, `gr₁` weight `0=w+1`, `w=−1`; at `q=1` supplier predicate true, adapter false | pass |
| 1.1 | elliptic `E/𝔽_q`; `Spec 𝔽_q`; `A×B` | degrees `q`, `1`, `q^{g+h}` | pass |
| 1.2 | elliptic `π` | `π†π=[q]`, `deg π=q` | pass |
| 1.3 | `α=1+2i`, `†=conj` | `α†α=5`, `|1±2i|²=5` | pass |
| 1.4 | `E/𝔽₂`, `a=1` | `T²−T+2`, `|a_i|=√2`; on `V_ℓ`, `π⁻¹` eigenvalues modulus `2^{−1/2}`, weight `−1` | pass |
| 1.5 (Lean headline) | `g=1,q=2,a=1,m=1,2`; `g=0` | `N₁=2`: `0≤2√2+1`; `N₂=1+4+3=8`: `4≤2·2+1=5`; `g=0`: `0≤0`; term count `2^{2g}−2g−1` includes the empty product `1≤q^{m(g−1)}` | pass |
| 1.6 | `ℙ¹/𝔽₂`; genus one trace `1` | `N_m=2^m+1`, `P=1`; `N₁=2=1−1+2`, bound `2√2`; `Z(ℙ¹)=1/((1−t)(1−2t))` | pass; owner on main, R01 |
| 1.7 | `ℙ¹`; `Spec 𝔽_{q²}` | roots `1`,`−`,`q` weights `0`,`−`,`2`; `H⁰` roots `±1` weight `0` | pass |
| 1.8 | `y²=x³−x` over `𝔽₃` | `4` points, `a=0`, `T²+3`, roots `±i√3`, `0≤2√3`; pinned `hasse_bound` says `(4−4)²≤12` | pass; R02 |
| 1.9 | same curve, `m=2` | `π²` roots `−3,−3`, `N₂=(1+3)²=16=1+9+6` | pass |
| 1.10 (Lean headline) | `Spec 𝔽_q`; `Spec 𝔽_{q²}`; `𝔾_m`; `∅` | `Z=1/(1−t)`; `1/(1−t²)`; `(1−t)/(1−qt)`; `1`; Hankel `2×2` minors of `(1,1,1,…)` vanish | pass |
| 2.1 | constant rank-2 system on `𝔾_m` | image `{I}` has dimension `0<3=dim Sp₂`, hypothesis (ii) fails | pass |
| 2.2 | `Sp₂(ℚ_ℓ)=SL₂`, congruence subgroup; `O₂` | Lie algebra dimension `3` forces closure `SL₂`; `SO₂` open in `O₂` misses the reflection component | pass |
| 2.3 | `dim V=2`, `k=1,2` | `N=1`; `k=2`: trivial multiplicity in `(1⊕3)⊗(1⊕3)` is `2`, so three pairings with one relation | pass |
| 2.4 | `k=0`, `ℚ_ℓ` on `𝔾_m` | `H⁰_c=0`, `H¹_c` root `1`, `H²_c` root `q`; `Z=(1−t)/(1−qt)` | pass |
| 2.5 | rational trace `−1` | tensor-square trace `1≥0`; `n`-th coefficient `(Tr F_x^n)²≥0` | pass |
| 2.6 | scalar `1` | `(1−t)^{−1}` coefficients `1`; `exp(Σt^n/n)` | pass |
| 2.7 | `f₁=1/(1−t)`, `f₂=1/(1−2t)` | `f=1+3t+7t²+…`, `(1,1,1)≤(1,3,7)`; radii `1≥1/2` | pass |
| 2.8 | same; `g=1−2t` | nearest poles `1`, `1/2` vs product `1/2`; cancellation needs the negative coefficient `−2` | pass |
| 2.9 | `β=1`, degree-one factor `T²−T+2` | both roots modulus `√2=q_x^{1/2}` | pass |
| 2.10 | `β=1,q=2` | `q^{β/2+1}=2^{3/2}=q^{(β+1)/2+1/2}` | pass |
| 2.11 | `β=1,q=2`; zero system | window `[√2, 2√2]`; no roots | pass |
| 3.1 | `d=1`, `J=[[0,1],[−1,0]]` | `diag(1,2)^T J diag(1,2)=2J`; degree-`e` multiplier `q^e` | pass |
| 3.2 | constant `J₂(1)` | geometric action `I`; degree-`e` action `[[1,e],[0,1]]`; units `{1,1}` | pass |
| 3.3 | smooth `ℙ¹` fibre, zero quotient | `Z=1/((1−t)(1−2t))`, variable factor `1`; exponent `(−1)^{d+1}=+1` for odd `d` | pass |
| 3.4 | singletons with `δ²=ε²,δ³=ε³`; even `n` only | ratio `r`: `r²=r³=1⇒r=1`; even powers alone admit `r=−1` | pass |
| 3.5 | `d=1`, `e=1,2`, `q=2` | multipliers `2,4`; `a=−e` gives `q^{−da}=2,4` | pass |
| 3.6 | `diag(a,a⁻¹)∈Sp₂`; zero quotient | `det(g−I)=2−a−a⁻¹`, `=−1/2` at `a=2`, so a proper closed null set; `Z_δ=∅` | pass |
| 3.7 | constant `C₂`-cover | degree-`n` proportion `1` (even) / `0` (odd), density `1/2`; imported count `q^n/n` in the allowed class | pass |
| 3.8 | `γ=(1),δ=(2)`, quotient factor `1−t+2t²` | lowest-terms denominator `1−2t` unless `2^{deg x}` is a quotient eigenvalue | pass |
| 3.9 | `S=1−2t`, `R=1−t` | `1−2t∤(1−t)(1−t+2t²)` (roots `1/2` vs `1,(1±i√7)/4`), hypothesis fails and `S∤R` | pass |
| 3.10 | rank-two quotient trace `1`, det `2`; zero | `1−t+2t²∈ℚ[t]`; `1` | pass |
| 3.11 | `d=1,q=2` | `[2^{1/2},2^{3/2}]∋2` | pass |
| 4.1 | `ℙ²` | `H²` root `2`, `2^{1/2}≤2≤2^{3/2}` | pass |
| 4.2 | `(ℙ²)^m` | root `q^m`, bounds `q^{1∓1/(2m)}→q` | pass |
| 4.3 | `ℙ²`; `∅` | roots `1,2,4` in degrees `0,2,4`; nothing | pass |
| 4.4 (Lean headline) | `ℙ¹`, `E_a=ℚ,ℚ₃`; opposite-parity weight-0 lines; `b=(3+4i)/5` | `R=(1/q)/((X−1)(X−1/q))`, `num(0)=denom(0)=1/q`; `Π₀=1−t,Π₁=1,Π₂=1−qt`, roots `1,q` integral; `R=1` loses the lines (excluded by purity in degree `1`); `1−(6/5)t+t²` rational non-integral | pass |
| 5.1 | `Spec 𝔽_q`; `𝔽_{q²}` | `W=ℤ`; geometric Frobenius degree `+1`, WI coordinate `−1`; subgroup `2ℤ` | pass |
| 5.2 | scalar `ℓ`; `q⁻¹`; nodal loop `ℓ` | non-unit, no descent; unit; lattice `ℓ^a𝒪` moved to `ℓ^{a+1}𝒪` | pass |
| 5.3 | `ℚ̄_ℓ(1)`; `diag(1,2)` at `q=2`; `|ιb|=2^{1/4}` | `−2`; `{0,2}` not pure; `ι`-weight `1/2` | pass |
| 5.4 | `b=(3+4i)/5`; twist `i` at `q=2,β=0`; `c=1`; `∛2` | `T²−(6/5)T+1`; `(T−1)(T−i)=T²−(1+i)T+i` non-real; `(T−1)²`; `T³−2` has nonreal conjugates | pass |
| 5.5 | order-3 Kummer character; scalar `2` at `q=2` | finite geometric image; weight `2` | pass |
| 5.6 | `ℚ̄_ℓ(r)`; rank-2 pure weight `1`; `ℚ̄_ℓ⊕ℚ̄_ℓ(−1)` | `−2r`; det weight `2`, determinantal `1`; multiset `{0,2}` | pass |
| 5.7 | `SL₂×ℤ`; `𝔾_m×ℤ`; `SL₃⋊ℤ`; normalizers | kernel `μ₂`; kernel `𝔾_m` infinite; image `2ℤ`; `N(SL₂(ℤ_ℓ))` compact, `N(1)=SL₂(ℚ_ℓ)`, `N(𝒪_E^×)=E^×` | pass |
| 5.8 | lines `2,4`; eigenvalues `±i`; line `i` | tensor weight `6`; `⊗²` factor `(1−t²)^{−2}` nonnegative; `(1+t)^{−1}` has `−1` | pass |
| 5.9 | line scalar `2` at `q=2`; finite character | determinantal `=` punctual `2`; `0` | pass |
| 5.10 | `𝔾_m⊂ℙ¹`, `β=0` | boundary stalk weight `0≤0`; `H¹_c` weight `0≤2` | pass |
| 5.11 | `F=diag(1,2)`, `Ne₂=e₁`, `q=2` | `N(Fe₂)=2e₁=qF(Ne₂)`; `gr_{−1}` weight `0=β−1`, `gr₁` weight `2=β+1`, `β=1`; `ker N` weight `0≤1` | pass |
| 5.12 | trivial / quadratic tame inertia; `ℚ_ℓ` on `𝔸¹` | invariant ranks `1`,`0`; pure on dense open ⇒ pure | pass |
| 5.13 | `diag(1,q)`; `diag(1,q²)` over `𝔽_{q²}` | vertices `(0,0),(1,0),(2,1)`; same slopes `0,1` | pass |
| 5.14 | slopes in `[0,1]`; `[0,0]` | `N²=0` with `N≠0` allowed; `N=0` | pass |
| 5.15 | constant system; `y²−y=1/t` over `𝔽₂`; `(t,1)` vs `(t,t−1)` | image `1`; image `ℤ/2`, wild at `0`; misses vs hits both `ℤ^{(p′)}(1)` summands | pass |
| 5.16 | constant `C₂`-cover | `ζ_{X₀′}=ζ_{X₀}·L(ε)`, simple pole forces `L(ε,1)≠0` | pass |
| 5.17 | `SL₂(ℂ)×ℤ`; `J=[[1,1],[0,1]]`; `ω₁=q^{−deg}` | `G_R=SU(2)×ℤ`; `G_ℂ=G_R=ℤ`, matrix part `I`, Weil class `(1,e)`; `Re(ω₁)=1`, Tate weight `−2=−2Re`; `SU(2)×ℤ` acting by `q^{n/2}g` has `Re=−1/2`, weight `1` | pass; source sign misprint confirmed |
| 5.18 | `ℚ_ℓ` on `𝔾_m` | `H¹_c` weight `0<2`; ordinary `H¹` weight `2` is outside the statement | pass |
| 5.19 | trivial `G⁰`, curve | `q^{−(nd+i)}#X₀(𝔽_{q^{nd+i}})→1` = Haar mass | pass |
| 6.1 | node outside `D`; tangency; branch swap | `ℱ_x(−1)⊗ε(B)` vs `Gr ℱ_x⊗ε(B)`; sign `−1` | pass |
| 6.2 | `T²−T+2` | real coefficients, nonreal roots | pass |
| 6.3 | `|α|=√2` at `q=2` | `α²` modulus `2`; `w(α²)≤2+2^{−k}⇒w(α)≤1+2^{−(k+1)}` | pass |
| 6.4 | elliptic curve; `𝔾_m` | parabolic `H¹` roots modulus `√q`, weight `1`; `0` | pass |
| 6.5 | `𝔾_m/𝔽₂`, `β=0` | `H¹_c` `0≤1`, `H²_c` `2≤2`, boundary part `0≤0` | pass |
| 7.1 | Tate line | `q⁻¹`, weight `−2`, as in 0.15 and 5.3; (0.1) hypotheses retained | pass |
| 7.2 | `q`; `q⁻¹`; `(3+4i)/5`; `[[q,1],[0,q]]`; `t∈𝔽_p(t)` | integral; not; weight `0` not integral; `(T−q)²` integral; `t` not integral over `ℤ` | pass |
| 7.3 | two points; short exact sequence | `f_!` roots `{1,1}`; long exact sequence bounds | pass |
| 7.4 | Frobenius on `𝔸¹` | universal homeomorphism, `H²_c` root `q` unchanged | pass |
| 7.5 | `t=s³` in characteristic `2` | tame degree `3`, trace∘adjunction `=3` invertible | pass |
| 7.6 | `ℙ¹→pt`, `D=∅` | `R²=ℚ_ℓ(−1)` weight `2` | pass |
| 7.7 | `ℙ¹/𝔽₂`, weight `0` | `R⁰` `0≤0`, `R¹=0`, `R²` `2≤2` | pass |
| 7.8 | `𝔸¹→pt` | `H²_c` root `q`, `2=0+2` | pass |
| 7.9 | `𝔸¹`, line of `ι`-weight `1/2`; `𝔸ⁿ→𝔸¹` | `H²_c` weight `5/2=β+2`, class `β mod ℤ`; fibres `𝔸^{n−1}`, constant map fails | pass |
| 7.10 | `𝔸¹`, `i=2,d=1`; point | `q/q^{1}=1` integral; `1` | pass |
| 7.11 | `𝔸¹`, `i=2>d=1` | `[2(2−1),0+2]=[2,2]`, actual `2` | pass |
| 7.12 | `𝔾_m` | `H¹_c` `0≤1`, `H¹` `2≥1`, image `0` | pass |
| 7.13 | `q=5,α=1+2i`; `α=q⁻¹`; `q=0` junk | couples `(1,0)`,`(0,1)` sum `1`; `(−1,−1)`; `(0,0)≠(0,∞)` | pass |
| 7.14 | `𝔾_m`, `i=d=1` | `H¹_c` root `1`: `(0,0)`, `0≤1`, `≥0`; `H¹` root `q`: `(1,1)`, `2≥1`, `≤1` | pass |
| 7.15 | `ℙ¹`; `[ℙ¹/C₂]` | factors `1−t,1−qt` integral; `Ra^!ℚ_ℓ=ℚ_ℓ(1)[2]` | pass |
| 8.1 | `ℚ̄_ℓ[−1]`; `ℚ̄_ℓ(1)[2]` | `0≤w+1⇒w≥−1`; `−2≤w−2⇒w≥0` | pass |
| 8.2 | `ℚ̄_ℓ` on smooth `d`-fold; nodal cubic; `j_!ℚ̄_ℓ` | `D=ℚ̄_ℓ(d)[2d]` weight `0`; `H¹` weight `0≠1`; `H¹_c(𝔾_m)` weight `0≠1` | pass |
| 8.3 | identity on `Spec ℤ[1/ℓ]` | `R⁰` weight `0`, `U` whole base | pass |
| 8.4 | `𝔸¹→pt` ordinary | `R⁰=ℚ̄_ℓ`, `Rⁱ=0` | pass |
| 8.5 | lines weights `0,−2` | `⊗` `−2`; `RHom` `2`; `D` `2` | pass |
| 8.6 | Tate curve; quadratic character | graded `0,2`; trait extension degree `2` | pass |
| 8.7 | smooth trait; node | `RΨ=ℚ̄_ℓ`; `R¹Ψ=ℚ̄_ℓ(−1)` weight `2` | pass |
| 8.8 | `𝔸¹→pt`, `w=0` | `ℋ²(Rf_!)` weight `2≤0+2` | pass |
| 8.9 | `ℚ̄_ℓ(1)[2]` on `𝔸¹`; `ℚ̄_ℓ[1]` on a point | `−2=w−2⇒w=0`; `0=w−1⇒w=1` | pass |
| 8.10 | `j:𝔾_m→𝔸¹` | underived `j_*ℚ̄_ℓ=ℚ̄_ℓ` pure `0`; `R¹j_*` stalk weight `2` excluded | pass |
| 8.11 | `a=2,b=−2` | `⊗≤0`; `RHom≥−4`; directions as stated | pass |
| 8.12 | `ℙ¹→pt` | `ℚ̄_ℓ⊕ℚ̄_ℓ(−1)[−2]`, both pure `0` | pass |
| 8.13 | closed point of `Spec ℤ[1/ℓ]` | `D′ℚ̄_ℓ=ℚ̄_ℓ(−1)[−2]`, `ℋ²` weight `2=−0+2`; `D′=D(−1)[−2]` | pass; no Checks, R05 |
| 8.14 | `[[1,1],[0,1]]` on a point; Kummer `ℒ` | geometric group trivial; nonzero geometric class | pass |
| 8.15 | trivial lines; scalars `1,2` | `F−1=0`, coinvariants dimension `1`, Jordan block; `F−1=1` invertible, `Ext¹=0` | pass |
| 8.16 | `β=γ=0`; `β=0,γ=2` | `Ext¹≠0` allowed (`β≥γ`); `Hom` weight `2`, `F−1` invertible, `0` | pass |
| 8.17 | `ℚ̄_ℓ⊕ℚ̄_ℓ^{(q^{1/4})}`; `ℚ̄_ℓ⊕ℚ̄_ℓ(1)`; `1+√2` | classes `0,1/2`; class `0` only; class depends on `ι(√2)` | pass |
| 8.18 | Kummer `ℒ`; `J₂(q)` | `W_{−3}=0,W_{−2}=W_{−1}=ℚ̄_ℓ(1),W₀=ℒ`; `W₁=0,W₂=V` | pass |
| 8.19 | constant `J₂(1)` | geometrically semisimple, arithmetically not; conclusion is geometric | pass |
| 8.20 | `j_!ℚ̄_ℓ` on `ℙ¹`; `ℙⁿ_ℚ̄`; `ℙⁿ_𝔽̄_p`; `i_{(p)*}ℚ̄_ℓ` | `H¹` weight `0≠1`, not pure; `δ=n`; `δ=n−1`, both weight `0`; `ℚ̄`-fibre `0`, `p`-fibre `≠0` | pass |
| 8.21 | `ℙ¹×S→S` | fibre weights `0,2` in `R⁰,R²` | pass |
| 8.22 | constant line; Kummer over `ℂ` | semisimple; not potentially pure | pass |
| 8.23 | `ℙ¹×S→S` over `k̄` | `R⁰,R²` rank-one constant | pass |
| 8.24 | `ℙ¹⊃{0,∞}`; `BC₂`; `[ℙ¹/C₂]` | `E₁^{0,0}=ℚ_ℓ,E₁^{1,0}=ℚ_ℓ²,E₁^{0,2}=ℚ_ℓ(−1)`, `d₁:1↦(1,1)`, `E₂^{1,0}=ℚ_ℓ=Gr^W_0H¹_c(𝔾_m)`; sign system `H⁰=0`, constant `ℚ_ℓ`, averaging by `1/2∈ℚ₂`; `H⁰,H²=ℚ_ℓ(−1)` | pass |
| 9.1 | `ℙⁿ`; `𝒪_X`; degree-`0` bundle; `n=0`; curve degree `e` | `Tr(ηⁿ)=1`; `η=0`; `c₁=0`; `P⁰=H⁰`; `ψ₁=e·xy`, `ψ₀` alternating of dimension `2g` | pass |
| 9.2 | `S₃` on `ℚ³`, dot product; `C₂` on `𝔽₂²` | invariants `⟨(1,1,1)⟩`, form `[3]`; `(1,1)·(1,1)=0` but the module is not semisimple | pass |
| 9.3 | `ℙ¹⊂ℙ²` | `i_*i^*1=η`; form `[1]`; weak Lefschetz degrees `<1` | pass |
| 9.4 | `ℙ¹,𝒪(1)` over `ℤ[1/ℓ]` | Betti `1,0,1`, `λ=[1]` on every fibre | pass |
| 9.5 | lines through a point of `ℙ²` | `H¹(X)=H¹(Y)=0`, monodromy trivial; `B` weights `≤i`, `C` weights `≥i+1` disjoint | pass |
| 9.6 | `ℙ²`; `𝒪_X` | `r=0` identity, `r=1` zero spaces, `r=2` `1↦η²`; fails for `r>0` with `η=0` | pass |
| 9.7 (Lean headlines) | chain `e₀→e₂→e₄`, `n=2`, `K=ℚ,𝔽₂`; `n=0` | `P⁰=Ke₀,P²=0`; `λ⁰P²⊕λP⁰=Ke₂=𝒱(2)`; `λ²P⁰=Ke₄=𝒱(4)`; `dim P⁰=1−0`, `dim P²=1−1`; `n=0`: `P⁰=V` | pass |
| 9.8 | same chain, `B(e_i,e_j)=[i+j=4]` | `ψ₂(e₀,e₀)=B(e₄,e₀)=1`; `ψ₀(e₂,e₂)=1`; symmetry sign `(−1)^{n−r}` from `B(y,λ^rx)=(−1)^{n−r}B(λ^rx,y)` | pass |
| 9.9 | elliptic curve; `ℙ²`; `𝔽₂` | `b₁=2`; `0`; alternating (`B(x,x)=0`) nondegenerate forces even dimension | pass |
| 9.10 | `ℙ¹`, `K=ℚ_ℓ[1]` | support conditions force `n=0`; `η⁰:H¹→H¹`, `η¹:H⁰→H²(1)` isomorphisms; `n≠dim X` | pass |
| 9.11 | `ℙ¹`, constant rank `r` | `Dℱ[−2]=ℱ^∨(1)`; `η=I_r`; `r=0` trivial | pass |
| 9.12 | `ℙ¹⊂ℙ²` | `H¹(Y)=0=0⊕0`, `E∩E^⊥=0` | pass |
| 10.1 | `N=0`; §0.19 pair | ordinary `=` WD; `{0,−2}` vs `−1` | pass |
| 10.2 | `Spec 𝔽_q`; `Spec 𝔽_{q²}`; `ℙ¹_{𝔽_{q²}}`; genus `g` | `1`; `c_n∈{2,0}`; `2(1+qⁿ)` or `0`; `2g q^{n/2}` | pass |
| 10.3 | split / nonsplit node | graph `±1` weight `0`; `H₁(Γ)(−1)` `±q` weight `2` | pass |
| 10.4 | node | slopes `0,1`, `N²=0`, graded `0,2`; couple of `q` is `(1,1)` | pass |
| 10.5 | `𝔸¹/𝔽₂`, trivial `G⁰` | `2^{−m}·2^m=1`; `2^{−2m}` normalization would give `0` | pass |
| 10.6 | `E/𝔽₂`, `a=1` | `cosθ=1/(2√2)`, count `1+2−1=2`; `∫₀^π(2/π)sin²θ dθ=1`, with `1/(2π)` the mass is `1/4`; second moment of `2cosθ` is `1` | pass; source misprints |
| Lean `IsWeilNumber` | `q=2,α=1/2`; `q=1`; `α=0`; transcendental | weight `−2`; `1<q` fails; root `0≠q^{n/2}`; `IsAlgebraic` fails (zero minimal polynomial has no roots, so algebraicity is essential) | pass |
| Lean `IsPure` | `V=0`; `F=0` on `K`; `J₂(1)` | vacuous; root `0` fails; roots `1,1` weight `0` | pass |
| Lean `finiteFieldPointCount` | `Spec 𝔽₂`; `Spec 𝔽₂[ε]/ε²`; `∅` | `1`; `1` (field-valued points kill `ε`); `0` | pass |
| Lean `finiteFieldZeta` | point | log coefficients `0,1,1/2,…`, `exp=1/(1−t)`; `E 0` unused | pass |
| Lean `finiteFieldZetaRationality` | `𝔾_m`; `Spec 𝔽_{q²}` | `Q=1−qt,P=1−t`; `Q=1−t²,P=1` | pass |
| Lean `degreeFactorExtraction` | `ℙ¹`, `d=2`; `d=0` | as in row 4.4; `d=0` gives `R=1/P₀` | pass |
| Lean `primitivePiece` | `n=0,λ=0`, `r=0,1` | `V`; `𝒱(−1)=⊥`; no finite-dimension hypothesis needed | pass |
| Lean `lefschetzDecomposition`, `lefschetzPairings` | chain as in 9.7–9.8; `r+2>n` | `𝒱(n−r−2)=⊥`, dimension difference nonnegative; `B` pairs `𝒱a` with `𝒱(2n−a)` perfectly from nondegeneracy and `hdeg` | pass |

### Lean acceptance test

`Suggested.lean` is 190 lines: `import Mathlib` and `import TauCeti.AlgebraicGeometry.AbelianVariety.Basic` (exists at the pin), no `set_option`, no `lemma`, no sorried data, no admitted `example`, roadmap namespace, layer comments in README order, docstrings on all ten declarations. A scratch copy with `#check @name` for all ten declarations elaborated with `lake env lean`: zero errors, five `sorry` warnings. The elaborated types match the README statements; the one dropped binder (`[FiniteDimensional K V]` on `primitivePiece`) is correct, an intersection with a kernel needs no finite dimension, and both Lefschetz theorems carry it explicitly. One-tactic probes on scratch copies replacing each `sorry` by `simp`, `simp_all` and `aesop` left all five theorems open (unsolved goals or no progress), so nothing is padding. The headlines statable at the pins are stated: the abelian point-count bound, zeta rationality, degree-factor extraction and both graded Lefschetz theorems; the docstring names the cohomological headlines that are not statable and what they lack. The one headline-level statement that is statable but belongs elsewhere is the curve bound of R01.

### Library declarations opened at the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`)

`Mathlib/Algebra/Order/Ring/Basic.lean:81` `Even.pow_nonneg`; `Mathlib/Algebra/Group/Submonoid/Operations.lean:642,657` `MonoidHom.mrange`, `mem_mrange`; `Mathlib/RingTheory/NoetherNormalization.lean:287` `exists_finite_inj_algHom_of_fg`; `Mathlib/Algebra/Group/TypeTags/Basic.lean:387` `Multiplicative.toAdd_inv`; `Mathlib/RepresentationTheory/Semisimple.lean:37` `isSemisimpleRepresentation_iff_isSemisimpleModule_asModule`; `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:309` `IsAlt.even_finrank`; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95,97,118` `AbelianVariety`, `toOver`, `dim` (topological Krull dimension); `TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean:327` `isSemisimpleRepresentation_comp_subtype`; `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:52,65` (R02); `TauCeti/FieldTheory/FunctionField/RiemannRoch/Genus.lean:189` `genus`. Through `#check`: `PowerSeries.subst`, `PowerSeries.exp`, `RatFunc.num`, `RatFunc.denom`, `Polynomial.reverse`, `LinearMap.BilinForm.restrict`, `Set.BijOn`, `iSupIndep`. The 46 declarations the previous review listed are at the same pins and were not reopened individually.

### Cross-roadmap citations resolved

On main (c994070): SchemeAndStackFoundations §§0.7, 0.9, 0.11, 0.20, 0.21, 0.29 (`qPowerFrobenius`), 1.19, 1.20, 1.23, 3.6 and §5.11 (R01); EtaleCohomologyFoundations §§F.0.1–F.0.4, F.0.A1–F.0.A2, F.1–F.8, F.3a, F.4.0 (`exists_stable_lattice_iff`), F.10.1 (`frobeniusFixedPoints`), F.10.2–F.10.5, F.4.5 (`rationalAdicRealization`); NewtonPolygons §§0.6–0.7; ReductiveGroups and ReductiveGroupsPartII §RG2.0.2 (“smooth-group-analytic-charts”); RepresentationTheory/CompactGroups Layers 0, 5, 6 and the `SU(2)` engine case; LieGroups Layer 7; SchurWeyl Layer 9; AlgebraicCurves Layer 12; EllipticCurves Layer 3; JacobianChallenge Layer F; ModularCurves §§0E, 5B; Completed/ArithmeticDirichletSeries Layer 8; Completed/ProfiniteProPGroups Layer 3. At open heads: ArithmeticGaloisRepresentations (2194655) §§1.1–1.6, 2.6 (`monodromyFiltration`, `IsWeilNumber` with `q ≥ 2`, `IsPureEnd`), 5.13, 6.1–6.2; AbelianSchemesAndArithmeticModuli (e77dd51) §§A2.5, A3.1, A3.9, A4.1, A4.4 (`exteriorCohomology`), A6.1, A6.10–A6.14, A6.21 (`frobeniusSemisimple`); LefschetzPencilsAndVanishingCycles (dbf5ba2) §§0.2–0.8, 1.1–1.6, 2.4–2.8, 3.1–3.6, 4.1–4.5, 5.1–5.3, 5.7–5.8, 7a.1–7a.5, 7b.1–7b.11; InverseGaloisAndArithmeticFundamentalGroups (a5186ac) §§IG.0.T1–T4, IG.0.3, IG.1.2–IG.1.3, IG.5.7 (dense-open surjectivity inside it); ArithmeticGaloisDuality (c47fce6) §§R02.2.1–R02.2.2, R02.3.2; ModularCurvesPartII (82d96e2) §§3.1–3.2, 4.11 (`fixedPairingIntegralComponents`), 4.12 (`agreementWithKatzMazurSchemes`). Consumers: AutomorphicLFunctionsAndLocalFactors (68712cd) §AL.3.11 (R04); EtaleDualityAndPerverseSheaves (d1fab8f) names §9.7 as its vector-space primitive core; StandardConjectures resolves nowhere (R03).

### Ownership against open work

Searched by object in the sibling checkouts named in the brief. AbelianVarietiesOverFiniteFields (#1720) and CurvesOverFiniteFields (#1729) cite this roadmap’s DWP.1 and §0.1 as their suppliers; CurvesOverFiniteFields plans its own curve `zeta_rationality` and FunctionFieldArithmetic (#1474) calls §1.6 a theorem of its own layer, both later in the order and in their own namespaces, so no fully qualified name collides with the ten declarations here. EllAdicHomotopyTypesAndWeights declares three gaps against §§7.12, 8.20–8.24 (a consumer). No earlier owner was found for the Weil II purity, direct-image, mixed-complex, semisimplicity and absolute Lefschetz targets, nor for the arbitrary-field graded Lefschetz core; the only object with an earlier owner is the curve bound (R01). Ownership against pull requests whose files the brief did not provide was not checked.

### Shape

All 136 numbered subsections read. Definitions carry API lists and at least three discriminating Checks except §8.13 (R05). Every target has a locator; every layer ends with Examples and Dependencies; `*Needs:*` lines name their inputs item by item. Mathematics is in Unicode code spans; no LaTeX delimiters, process words, round labels or local paths. The supply direction is single: all `*Needs:*` and supplier citations point to main or to pull requests earlier in the merge order.

## Not verifiable

- [Int] SGA 7 II, Exposé XXI §5 (Lemma 5.2.1, Théorème 5.2.2, pp. 384–387), cited by §§7.9–7.10: the sources service resolves it only to a paywalled publisher (`uncertified`), and no local copy exists on this worker. The locator is cited as stated; the statement is confirmed indirectly by WII (3.3.2)–(3.3.3), lines 2622–2633, which quote the integrality of `R^if_!ℱ` and `R^if_!ℱ(i−d)` from that exposé.
- The finite computations above are not proofs of the general targets; the pencil, openness and specialization theorems were assessed through their source and supplier statements.

## Source issues

- **Misprint** in WII at Proposition (2.2.8)(i), printed p. 195 (line 2248), repeated in (3.5.1), printed p. 211 (line 2822): the source says the sheaf of an irreducible representation is pure of weight twice the real part; it should be minus twice the real part, since `ω₁ = q^{−deg}` corresponds to the Tate line of weight `−2` and has real part `1`; affects a stated result.
- **Misprint** in WII at (3.5.6) and Proposition (3.5.7), printed p. 212 (lines 2875–2884, confirmed on the rendered page): the source says the pushforward of Haar on `SU(2)` is `sin²θ dθ` with coefficient `1/(2π)`; it should be `2/π`, so that the total mass is one; affects a stated result.
- **Misprint** in WII at (3.5.6), printed p. 212 (line 2879, rendered page): the source says the elliptic curve over `𝔽_{q^n}` has `1 + 2cos θ(x)·q^{n/2} + q^n` points; it should be `1 + q^n − 2cos θ(x)·q^{n/2}`, the trace entering with a minus sign; affects a stated result.
- **Gap** in BFP at the proof of Proposition 4.2, printed p. 7 (line 306–308): the source writes the `E₁` page of the weight spectral sequence as the plain cohomology of the normalized strata; it should carry the orientation local system (the determinant of the edge-set permutation representation of `Aut(G)`); affects nothing (the vanishing and eigenvalue conclusions are unchanged).
