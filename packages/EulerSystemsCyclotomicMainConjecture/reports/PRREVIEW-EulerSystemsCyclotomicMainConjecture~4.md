# Review of EulerSystemsCyclotomicMainConjecture (pull request #1311 at c386732)

**Verdict:** accepted

This is an incremental re-review of the 78 lines changed since 4408ed4: 76 in `README.md` and 2 in `Suggested.lean`. It covers those lines and every passage that cites them or that they cite. No finding remains, and the gate passes with the targeted build.

## Previous findings

- R01 — repaired: `Suggested.lean:1–3` now reads “`module`”, then a blank line, then “`import Mathlib`”. The targeted build emits only the five `sorry` warnings, and the gate reports `build=0`.
- R02 — repaired: README line 223 now cites “IntegralIwasawaTheory §4.2, at every prime `p`, `p=2` included … (`algebraicLog_kernel`) … (`bakerBrumer_algebraicNumbers`)”. Step 7 (line 3103) and the *Needs* of §4.18 (line 3147) cite only §4.2. No `§4.1e` or `expDisc` remains.
- R03 — repaired: line 522 reads “twist `c↦c^χ` (§2.5)”; line 642 “`ind_O(c)=sup{a : …}`”; line 741 “`J_m={x∈ℤ[G_m] : xθ⁰_m∈ℤ[G_m]}` (the denominator ideal)”; line 759 “`…=s_(m,b)−((b−1)/2)N_m`”.
- R04 — repaired: line 1404 reads “Define `M^χ = ⨅δ, Module.End.eigenspace (ρ δ) (χ δ)`”. Lines 1407–1409 call §0.2's `cyclotomicClassEigenspace p r i` the special case (odd `p`, `Δ_r`, `ω^i`) and do not attribute the general case to it.
- R05 — repaired: line 221 reads “`s_(m,b)=(b−[b])θ⁰_m` for the unshifted Stickelberger element `θ⁰_m` of §F.9”.
- R06 — repaired: line 2650 reads “For every prime `p`, including 2, `1+p∈ℤ_p^×=Γ′`, and under step 3 `[1]−[1+p]` maps to `(1−X)−(1−X)^(1+p)=pX−(p(p+1)/2)X²+…`”.

## Verified sound

### Gate, dependency direction and elaboration

The gate, rerun on this head with the targeted build:

```text
gate EulerSystemsCyclotomicMainConjecture: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The prescribed dependency check (`--movable`, against the content checkout):

```text
depcheck: 240 roadmaps, 2435 edges, 0 problem(s)
```

It has no UPWARD, CYCLE or `moved:` line. Against `origin/main` (`eaf17b1`), the pull request changes nothing outside the folder.

- **Elaboration:** `lake env lean` on `Suggested.lean` gives exactly five `sorry` warnings (lines 126, 151, 166, 182, 199) and no other message.
- **Binder check:** a scratch copy with `#check @name` for all 14 declarations gives the same types as the worker's signatures file, up to universe names. That file's fifteenth entry, “`-group`”, comes from misparsing docstring line 14 and is not a declaration. `globalUnitImage` keeps only `[Field K]`, which is all `𝓞 K` needs; the headlines impose `NumberField`. Nothing to change.
- **Padding probe:** in a scratch copy, each `sorry` was replaced by `first | (rfl; done) | (simp_all; done) | (infer_instance; done) | (norm_num; done) | (decide; done) | (aesop; done)`. All five theorems fail with unsolved goals, and `aesop` reports that its exhaustive search failed. None is padding.
- **Headlines:**
  - The diff changes no statement.
  - The five statable headlines are still stated: §1.6, §§4.20–4.21, both branches of §4.22, and §5.1.
  - The module docstring still names, with the carriers each one lacks, the headlines that cannot be stated at the pins: §§0.17, 0.28, 0.30–0.31, 2.4, 3.4–3.5, 4.3–4.8, 4.12–4.14, 4.18–4.19, 4.23–4.27, 5.2 and 5.3.

### Changed passages and the citations they make

All 41 added and 37 removed lines were read. So was every passage that cites §0.18, §0.29, §4.6, §4.18, F.2, F.5, F.7–F.10 or IntegralIwasawaTheory §4.2. Supplier citations were resolved at the suppliers' current heads, using their own README line numbers.

- **IntegralIwasawaTheory**, head `539ca66` (it was `78ec69e` last round):
  - The Conventions fix an arbitrary prime `p` (line 21).
  - §4.2 starts at line 556. `algebraicLog_kernel` (line 558) moves an algebraic `α` into the disc by a power, using Tau Ceti's deep-unit exponential and logarithm. `bakerBrumer_algebraicNumbers` (line 560) applies that roadmap's own supplier, LinearFormsInLogarithms §8.10. Line 562 works the case `p=2`, `α=−1`.
  - So both new claims hold: “every prime, 2 included” and “takes the disc form of Baker–Brumer from its own supplier”.
  - All 29 IntegralIwasawaTheory sections cited elsewhere in the README exist at this head: §§0.1–0.3, 1.1, 1.3, 1.5, 1.7–1.8, 2.2–2.4, 2.6–2.8, 3.1–3.3, 3.5, 4.2–4.4, 5.0, 5.3, 5.6, 6.3, 7.1–7.3 and 10.4. So do the nine names checked (`abelianLeopoldt`, `unitRepresentation_augmentation`, `bernoulliStickelberger_dictionary`, `arithmeticCharacter_eulerQuotient`, `greitherRayDictionary`, `circularLog_image`, `uniformCapitulationBound` and the two §4.2 names).
- **EulerSystemsAndKolyvaginSystems**, head `ccd7e7a`:
  - §2.5 (line 1683): `c ↦ c^χ` (line 1701) and `(c^χ)_F=Cor_{FL/F}(c_{FL}⊗ξ_χ)` with conductor `𝔣N` (line 1702).
  - §2.6 (line 1723): the explicit `O`-linear change-of-factors map.
  - §4.3: `ind_O(c)=sup{n : c_K∈𝔭^nH¹(K,T)+H¹(K,T)_tors}` (line 2844).
  - §8.2 (line 4601): `Hyp(K∞,T)` and `Hyp(K∞,V)`.
  - §8.3 (line 4647): `X∞`, with the contragredient action.
  - §8.6 (lines 4776–4778): `Hyp(K∞/K)`, with exactly the totally-real-Leopoldt or imaginary-quadratic alternative that F.8 restates.
- **SelmerIwasawaCohomology**, head `ebadda3`:
  - §2.7 (lines 489–491): `H¹_ur=ker(H¹(G_v,B)→H¹(I_v,B))`.
  - §2.8 (lines 518–520): `L^Gr_v=ker(H¹(G_v,M)→H¹(I_v,M/F⁺M))`.
- **CyclotomicClassGroupsAndStickelberger**, head `10bc9eb`:
  - Line 27: `Δ_r` has order `p−1`, for odd `p`.
  - §0.2 (lines 141, 145): `cyclotomicClassEigenspace p r i` for odd `p` and `r≥1`, and the kernel intersection for `ρ` and `ω^i`.
  - §2.2 (lines 419, 428): `J_m`.
  - §2.3 (lines 461, 468): `s_(m,b)=…=(b−[b])θ_m`, where the supplier's `θ_m` is unshifted.
- **Mathlib**, pin `1b1ccf4`:
  - `Module.End.eigenspace` is an `abbrev` at `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:423`, under the variables `[CommRing R] [AddCommGroup M] [Module R M]` (line 64).
  - `Module.End.eigenspace_def` (line 426) gives `LinearMap.ker (f − μ • 1)`, and `Module.End.mem_eigenspace_iff` is at line 467.
  - `Submodule.mem_iInf` is at `Mathlib/Algebra/Module/Submodule/Lattice.lean:238`.
  - None of these assumes finiteness, a field or invertibility, as the new contract bullet at line 159 says.

That makes 22 supplier and library citations resolved this round, plus the 29 section headings. A grep of the README finds no `4.1e`, `expDisc`, `§§4.1–4.2`, `LinearFormsInLogarithms`, or any of the eleven retired adapter spellings: `EulerSystem.twist`, `twistEulerSystem`, `unramifiedCondition`, `greenbergCondition`, `rubinIwasawaHypT`, `rubinTowerHyp`, `restrictedSelmerDual`, `indexOfDivisibility`, `denominatorIdeal`, `smoothedStickelberger` and `bakerBrumer_expDisc_linearIndependent`.

**Ownership.** Only one object changed status: the general character eigensubmodule of §0.18, which is now defined here instead of being attributed to CyclotomicClassGroupsAndStickelberger. It is a one-line infimum of Mathlib eigenspaces, so this roadmap is a proper owner.

- `roadmaps grep` over main and the 468 open pull requests finds no other general owner. CyclotomicClassGroupsAndStickelberger §0.2 states only the tame class-group case; the other hits are Hecke, central-character or newspace eigenspaces.
- Tau Ceti at `2fd255d` has no group-character eigensubmodule; its eigenspaces are Lie-module and comodule ones.
- PadicMeasuresIwasawaAlgebras §4.6 owns only the projector range, for invertible group order.
- `overlaps.md` reports no other open pull request changing this roadmap and no dropped ids, and both were confirmed.

### Seeded sample

Of the 15 sampled targets, only §4.18 lies in the changed passages. §4.2 was also checked, because the text was already open, and so were 0.10, 0.14 and 3.1, which no earlier round's sample table covers. All works were read in legal copies fetched through the sources service: GREITHER-1992 from Numdam, GROSS-DASGUPTA-2022 from arXiv 2303.03299v1, RJW-PADIC-L from arXiv 2309.15692v2, and RUBIN-ES as the author draft. Greither's journal page is the PDF page plus 447; Rubin's printed page is the PDF page minus 10.

| Target | README locator | Source line and page | Result |
|---|---|---|---|
| 4.18 | GREITHER-1992 §4: definitions before `(G1)`, p.490; the Gauss sum, p.490; `(G2)`, p.491; Lemma 4.8 (title) | GREITHER-1992 lines 1450–1461 (`W`, `M`, `μ`, `λ`, p.490), 1467–1469 (`g` and the claim `g∈F`, p.490), 1473–1481 (`(G1)`, pp.490–491), 1482–1497 (`(G2)`, p.491), 1498–1503 (Lemma 4.8, p.491) | The pages agree. Greither gets `λ_χ≠0` from Gross's Conjecture 1.15 (lines 1505–1507). The README instead proves it from Baker–Brumer (steps 5–8), with IntegralIwasawaTheory §4.2 as the supplier. |
| 4.18 | GROSS-DASGUPTA-2022 §2, pp.3–5 | GROSS-DASGUPTA-2022 lines 95–160: §2 starts on p.3; the Ferrero–Greenberg derivative with `log_p(p)=0` is on p.4; Gauss-sum logarithms and the linear-forms nonvanishing are on p.5 | Agrees with “valuation/logarithm convention and the algebraic-coefficient case”. |
| 4.2 (not in the diff) | GREITHER-1992 §2: setting, p.455; Lemma 2.2, p.456 | GREITHER-1992 lines 240–249 (setting), 251–257 (Lemma 2.1, p.455), 258–270 (Corollary, pp.455–456), 272–278 (Lemma 2.2, p.456) | Agrees. The kernel and cokernel are Tate cohomology groups (line 256), so cohomological triviality gives the README's isomorphism remark. |
| 0.10 (not in the diff) | RUBIN-ES III §2.1, printed p.34 (PDF p.44) | RUBIN-ES lines 1589–1611: `c̃_m` is defined (line 1607), and the collection is an Euler system with Euler polynomial `det(1−Fr_ℓ⁻¹x)=1−x` (line 1611) | Agrees. At `m=1`, `Fr_ℓ=1` and the factor `1−Fr_ℓ⁻¹` is `0`, so the norm is 1, as stated. |
| 0.14 (not in the diff) | RJW-PADIC-L §10.2, definition of `c_n(a)`, and Lemma 10.3, printed p.48 | RJW-PADIC-L lines 2814–2825, p.48: `c_n(a)=(ξ^a−1)/(ξ−1)`, and its norm compatibility | Agrees. `(1−ζ^a)/(1−ζ)=(ζ^a−1)/(ζ−1)`. |
| 3.1 (not in the diff) | RJW-PADIC-L Proposition 13.13 and proof, Corollary 13.14 and proof, p.68 | RJW-PADIC-L lines 3838–3853. The statement of Proposition 13.13 is at the foot of p.67; the finite-level sequence (13.1), for which the README cites it, and the limit step are on p.68; Corollary 13.14 is on p.68, with `E/U` at line 3853 | Agrees. The README reverses the quotient and uses compactness for the limit step, as earlier rounds' Source issues record. |

### Adversarial table

The first 12 rows give computed values for every statement the diff changes. The remaining rows are carried forward, each citing PRREVIEW~3, for statements the diff leaves untouched: the sampled targets, the five Lean headlines (§§1.6, 4.20–4.22, 5.1) and the nine Lean definitions.

| Statement | Instances | Values computed on the two sides / competing model | Result; change |
|---|---|---|---|
| §0.18 definition `M^χ=⨅δ eigenspace(ρδ)(χδ)` and its new Check | `p=5`, `O=M=ℤ₅`, `Δ₁=(ℤ/5)^×` acting by `ω³`; the inverse convention; `O=ℤ`, `M=ℤ/2` with trivial `C₂`-action and sign `χ`; trivial `Δ`; sign of `S₃` on `ℤ[S₃]` | `ω(2)` has order 4 and `ω(2)²=−1`. For `χ=ω³` the factor is `ω(2)³−ω(2)³=0`, so `M^(ω³)=M`. For `χ=ω` it is `ω(2)³−ω(2)=−2ω(2)`, with `v₅=0`, so `M^ω=0`. Under the inverse convention, `ω(2)³−ω(2)⁻³=−2ω(2)` gives `0` for `ω³`, and `ω(2)³−ω(2)⁻¹=0` gives `M` for `ω`. Torsion case: `ker(1−(−1))=ker 2=ℤ/2=M`. Trivial `Δ`: `eigenspace(id,1)=M`. `S₃`: `M^sgn=ℤ·Σ_g sgn(g)g`, of rank 1 | Correct; the new Check rules out the inverse convention. |
| Scope (lines 27–29) and the CyclotomicClassGroupsAndStickelberger §0.2 contract (line 221) | Supplier lines 27 and 145 | §0.2 covers odd `p` with `r≥1`, and `|Δ_r|=p−1`. The Check's `Δ₁` has order `4=p−1` at `p=5` | Correct attribution. |
| `Module.End.eigenspace` contract (line 159) | Pin lines 64, 423, 426, 467 | The only hypotheses are `[CommRing R] [AddCommGroup M] [Module R M]`; `eigenspace_def` gives `ker(f−μ•1)` | Correct; no hidden hypothesis. |
| IntegralIwasawaTheory §4.2 contract (line 223); F.10 (lines 855, 877); §4.18 step 7 and *Needs* (lines 3093, 3103, 3145–3147); §4.21 *Needs* (line 3489) | `p=2` with `α=−1`, `α=2`, `α=3`, `α=5`; `p=3` with `α=3` | Supplier line 562: `e=1`, `q=2`, `i≥2`, `N=2`, `u=1`, so `ℓ=0=log₂(−1)` and `‖ℓ‖≤1/4<ρ₂=1/2`. `2=1·2¹` lies in the kernel described by (a). From `9=1+8`, `v₂(log₂3)=3−1=2`; from `5=1+4`, `v₂(log₂5)=2`. Both are nonzero, so neither number is in the kernel. At the odd prime of §4.21, `log₃3=0` | Correct for every `p`; neither §4.1 nor §4.1e is needed. |
| §4.18 steps 6–7 on `F=ℚ(√−7)` | `α=(1+√−7)/2`, a root of `x²−x+2` | Modulo 16 the unit root is `α≡11` and the other root is `ᾱ≡6`, with `v₂=1`. Since `α²≡9 mod 16`, `v₂(log α)=2`. For `y=α/ᾱ`, `v₂ι(y)=−1`. `2y` has the same logarithm, `log y=2log α` (because `log ᾱ=log 2−log α`), and `v₂(log y)=3≠0` | The replacement `2^(−v₂ι(y))y` and the nonvanishing agree with step 6 and with the README Check `λ(α)=2log₂(α)𝔭` of valuation 3. |
| F.2 (lines 369–372) | `F⁺B=0`; `F⁺B=B`; `W_n` for `n=1,0` | `ker(H¹→H¹(I,B/0))=H¹_ur` and `ker(H¹→H¹(I,0))=H¹`, as in supplier §2.8 (line 520) and §5.3's `F⁺W₁=W₁`, `F⁺W₀=0` | Correct renaming. |
| F.5 (lines 522–525) | `χ=1`; quadratic `χ` of conductor 5 over `ℚ` with `T=ℤ_p(1)` | For `χ=1`, `L=K` and `c^1_F=Cor_{F/F}(c_F⊗ξ)=c_F`, matching supplier line 1703 (`c^1=c`). For the quadratic `χ`, the conductor is `5N`, and restriction to `L` gives `Σ_δχ(δ)δc_L` | Correct. |
| F.7 (line 642) | `H=O⊕O/π²`; `c=(π³,1)`, `c=(0,1)`, and `π·(π³,1)` | `ind_O=3` for the first. The torsion class gives `∞`. `ind_O(π·(π³,1))=4=3+1`, matching the supplier's API (line 2844) | Correct. |
| F.8 (lines 683–695) | `K=ℚ`; `K=ℚ(∛2)` with `T=ℤ_p(1)` and `d=1` | `ℚ` is totally real with unit rank 0, so `Hyp(K∞/K)` holds. `ℚ(∛2)` has `(r₁,r₂)=(1,1)` and is neither totally real nor imaginary quadratic, so it fails (supplier line 4803) | The section numbers §8.2, §8.3 and §8.6 are correct. |
| F.9 and §0.29 steps 1–2 (lines 741, 759, 1734–1735) | `m=3`, `b=5`; `m=5`, `b=2` | `s_(3,5)=[1]+3[2]=(5−[2])(⅓[1]+⅔[2])`. Also `(5−[2])θ_3=(5−[2])(−⅙[1]+⅙[2])=−[1]+[2]=s_(3,5)−2N_3`. `s_(5,2)` has floors `0,0,1,1` at `[1],[3],[2],[4]` | Correct in this README's `θ⁰`/`θ` notation. |
| §4.6 new Check (line 2650) | `p=2` and `p=3`; the inverse action; `[1]−[−1]` | At `p=2`, `(1−X)−(1−X)³=2X−3X²+X³`: linear coefficient `2=p`, quadratic `−3=−p(p+1)/2`. At `p=3`, `3X−6X²+…`. Inverse action at `p=2`: `3⁻¹−1=−2/3=−p/(1+p)`. `(1−X)−(1−X)⁻¹=−2X−X²−…`, and under `X↦−X` the linear coefficient becomes `+2`. Step 3's own check, `[1]−[a]` with linear coefficient `a−1`, gives `p` here | Correct at every `p`, 2 included. |
| `Suggested.lean` header (`module`) | Elaboration and the targeted build | Five `sorry` warnings (lines 126, 151, 166, 182, 199) and nothing else; gate `build=0` | Correct; the statements are unchanged. |
| F.1 `H¹_Iw` adapter | `ℚ∞/ℚ`, `T=ℤ₃(1)` | `lim_Cor H¹(ℚ_n,ℤ₃(1))=lim(ℚ_n^×)^`, the compact completion (RUBIN-ES line 1592); the supplier's §3.1 requires `(F)` (line 1378) | Renaming only; correct. Carried from PRREVIEW~3. |
| F.3 `ES(T,𝒦,N)` | `T=ℤ_p(1)`, `q≠p` | `P_q(X)=det(1−Fr_q⁻¹X on ℤ_p)=1−X`, as at RUBIN-ES line 1611 | Correct. Carried from PRREVIEW~3. |
| F.4 `R_(F,M)`, `φ^fs` | `K=ℚ`, `p=2`, `M=2`, `q=3,5`; `T=ℤ/p^k(1)` | The `2`-ray degrees are 1 and 2, so only `q=5` is admissible. Supplier line 1017: `P=1−ℓx≡1−x`, `Q=−1`, `φ^fs=−id` | Correct. Carried from PRREVIEW~3. |
| F.6 `κ_(F,r,M)` | Cyclic group `C₃` | `(σ−1)(σ+2σ²)=2−σ−σ²=3−N` | Correct. Carried from PRREVIEW~3. |
| §4.9 Frobenius criterion | Supplier §1.7 | The finite-level criterion is stated at supplier lines 942 and 955 | Correct citation. Carried from PRREVIEW~3. |
| F.10 logarithmic values | Odd quadratic mod3; p=2 | τ=i√3 and complex log formula gives π/(3√3); replacing logs by log absolute values gives0. log₂(−1)=log₂2=0 | Retain parity and Iwasawa branch. Carried from PRREVIEW~3. |
| F.11 Gamma/Gauss | p=2, n=0,1,2,3; trivial finite-field character | Γ₂ values1,−1,1,−1; negative Gauss-sum convention gives1 for trivial character | Correct signs, including n0. Carried from PRREVIEW~3. |
| 0.1 minimal polynomial, divided case | m=2,ℓ=2 | minpoly(i/ℚ)=X²+1=X²−ζ₂ | Correct small dyadic case. Carried from PRREVIEW~3. |
| 0.2 minimal polynomial, coprime case | m=3,ℓ=2 | `(X−ζ₆)(X−ζ₃²)=X²−ζ₃`; degrees1+1=2 | Correct removed root. Carried from PRREVIEW~3. |
| 0.3 norm, divided case | m=2,ℓ=2 | N(1−i)=2=1−ζ₂ | Correct. Carried from PRREVIEW~3. |
| 0.4 coprime norm | m=3,ℓ=2 | `(1−ζ₃)/(1−ζ₃²)=−ζ₃=1−ζ₆` | Correct. Carried from PRREVIEW~3. |
| 0.5 Frobenius | m=7,ℓ=2 | Inverse Frobenius exponent4: ζ₇^(2·4)=ζ₇; forward exponent2 gives ζ₇⁴≠ζ₇ | Retain inverse. Carried from PRREVIEW~3. |
| 0.6 sign | m=2,ℓ=2 | N(i−1)=2 while ζ₂−1=−2 | README's correction passes; source formula needs sign. Carried from PRREVIEW~3. |
| 0.7 conductor1 | p=2,3 | N(1−ζ_p)=2,3, respectively; not the real-norm square p² | Correct. Carried from PRREVIEW~3. |
| 0.8 p-stabilized numbers | p=5,m=3,1,5 | c₃=−ζ₃ has order6; c₁=5; c₅=1−ζ₅ | Torsion possible away from p, explicitly allowed. Carried from PRREVIEW~3. |
| 0.9 p-tower norms | p=5, first two levels | N(1−ζ₂₅)=1−ζ₅, then norm toℚ=5 | Correct direction. Carried from PRREVIEW~3. |
| 0.10 auxiliary norm | p=5,m=1,ℓ=2 | c₂=1; norm1 equals `(1−Fr₂⁻¹)c₁=0` additively | Correct zero Euler factor. Carried from PRREVIEW~3. |
| 0.11 nontorsion | p-power conductor | Rational norm p, versus root-of-unity norm±1 | Nonzero Kummer source certified by valuation. Carried from PRREVIEW~3. |
| 0.12 real norm | p=5 | `(1−ζ₅)(1−ζ₅⁻¹)=(5−√5)/2` for the chosen real embedding; conductor1 gives5, not25 | Correct real-degree convention. Carried from PRREVIEW~3. |
| 0.13 real distribution | p=3, p-tower | Norm of real generator at conductor9 to conductor3 is3; the conductor3 generator is3 | Correct transported norm. Carried from PRREVIEW~3. |
| 0.14 smoothing | m=5,a=2,4,6 | Quotients are1+ζ₅, −ζ₅⁻¹,1, each norm1 | Unit property and torsion boundary distinguished. Carried from PRREVIEW~3. |
| 0.15 admissible extension | p=3, q=2 | Principal cyclotomic Frobenius is−2; `(−2)²=4≠1` and it has infinite 3-adic order | Infinite admissible direction retained. Carried from PRREVIEW~3. |
| 0.16 Kummer class | ℚ, element p versus p^p | Valuation classes1 versus0 modulo p | Nonzero class is tied to actual unit/number. Carried from PRREVIEW~3. |
| 0.17 cyclotomic ES | Base fieldℚ | Initial class has valuation1; the zero family has valuation0 | Construction is not an arbitrary family. Carried from PRREVIEW~3. |
| 0.19 twisted sums | C₂ sign; trivial group; S₃ sign regular module | S=[1]−[s], S²=2S; trivial sum=id; sign sum in ℤ[S₃] squares to 6S, while ordinary norm has all positive coefficients | Correct without commutativity or division. Carried from PRREVIEW~3. |
| 0.20 Frobenius on sum | C₄,χ(g)=i | Inverse-character factor1−i⁻¹=1+i; wrong forward factor1−i | Correct. Carried from PRREVIEW~3. |
| 0.21 root-of-unity unit | ℤ₂,ζ=−1; ℤ₃,ζ=−1 | 1−ζ=2 is nonunit at2, unit at3 | Prime-to-p order hypothesis essential. Carried from PRREVIEW~3. |
| 0.22 ξ generator | ℚ(√5), χ quadratic | For ε=(1+√5)/2, character sum corresponds to ε⁻², not ε or1 | Correct unnormalised generator. Carried from PRREVIEW~3. |
| 0.23 ξ is unit | Nontrivial χ versus trivial prime-power conductor | Weighted prime valuation sums to0; trivial character retains valuation1 | Correct nontrivial-character hypothesis. Carried from PRREVIEW~3. |
| 0.24 circular line | ℚ(√5),p=3,5 | Exponent−2 is a unit in both coefficient rings; Eχ/Oξ has order1 | Correct. Carried from PRREVIEW~3. |
| 0.25 restriction–Kummer | ℚ₇,p=3; ℚ→ℚ(i),p=2 | Compact completion is ℤ₃⊕C₃, whereas discrete tensor has ℚ₃/ℤ₃ and its completion0. κ(−1) restricts from nonzero to0 in the degree2 extension | Correct completion; prime-to-p restriction cannot be dropped. Carried from PRREVIEW~3. |
| 0.26 Euler factor | Quadratic conductor5,p=3,5,11 | Factors1−χ⁻¹(p) are2,1,0 | Correct convention for p dividing conductor. Carried from PRREVIEW~3. |
| 0.27 span of cℚ | Same three primes | Factors2 and1 are units at3 and5; factor0 at11 generates0 instead of Oξ | χ(p)≠1 is necessary. Carried from PRREVIEW~3. |
| 0.28 unsmoothed system | χ₅,p=11; rational base | Initial unsmoothed class is nonzero (real convention gives2ξ); p-stabilized class0. Raw auxiliary norm atℓ isℓ, not base unit1 | Extra conductor bookkeeping retained. Carried from PRREVIEW~3. |
| 0.30 local functional/family | p=3, tame conductors 1,2,5; first p-step; two local factors at conductor8 | x₁=2/3, x₂=−1/3; N(2)x₂=−2/3=−x₁. Tr(x₅)=−2/15, multiplied by5 gives−2/3. Tr(x₃)=2=3x₁ cancels the 1/3 normalization. At m8 factor traces s,−s with s²=−2 sum to0 | Normalized restrictions pass; unscaled factor−1/2 fails. Semilocal trace required. Carried from PRREVIEW~3. |
| 0.31 replacement | q=2,p=3 | New polynomial1−X/2, old1−X, difference X/2 divisible byq−1=1; unchanged bad-support field classes | Same coefficientℤ_p; no Tate twist created. Carried from PRREVIEW~3. |
| 1.1 Rubin hypotheses | p=5,χ=ω² | Residual dual characterω⁻¹ remains nontrivial on C₄; quotientC₂ would lose this information | Correct enlarged tame group. Carried from PRREVIEW~3. |
| 1.2 unit rank | ℚ(√5),p=3 | Eχ rank1, ξ exponent−2 gives index0 in valuation units; c=0 would give∞ | Nonzero generator matters. Carried from PRREVIEW~3. |
| 1.3 Selmer/class dictionary | ℚ(√−5),p=2; prime above2 | Class groupC₂ becomes0 after killing the class of the prime above2 | Ordinary and p-split groups are distinguished. Carried from PRREVIEW~3. |
| 1.4 derivative descent | C₃ | Derivative identity gives3−(1+σ+σ²)=2−σ−σ² | Correct coefficient and norm direction. Carried from PRREVIEW~3. |
| 1.5 finite–singular relation | Frobenius unipotent 2×2 | Image of coinvariant[e₂] is−e₁, not e₁; identity Frobenius on rank2 has Q(1)=0 | Rank-one quotient hypothesis retained. Carried from PRREVIEW~3. |
| 1.6 finite Kolyvagin bound | ℚ(√5),χ₅,p=3 | Class component order1 divides unit quotient order1; scalar extension preserves1 | Headline agrees with Lean. Carried from PRREVIEW~3. |
| 2.1 Iwasawa hypotheses | Rank1 trivial action of τ versus rank2 | coker(τ−1) has O-rank1 versus2 | Hypothesis discriminates. Carried from PRREVIEW~3. |
| 2.2 norm-limit modules | L=ℚ(√6),p=3; L=ℚ(√5),p=3/11 | Local Tate roots contribute ℤ₃(1), killed byT−3; split-prime correction has rank0 at3 and1 at11 | No false torsion-freeness claim. Carried from PRREVIEW~3. |
| 2.3 Λ-index | H=Λ,c=T | Index(T), while empty/zero class gives0; augmentation factor isT | Correct. Carried from PRREVIEW~3. |
| 2.4 divisibility | char(A)=T−p, denominator errorT² | T andT−p have no common height-one factor, so T-errors cannot supply a missing factorT−p | Correct use of torsion and error support. Carried from PRREVIEW~3. |
| 3.1 four-term sequence | C=0,E=pℤ,U=ℤ | U/E=ℤ/p; E/C=pℤ embeds into U/C=ℤ | Correct quotient direction; E/U is not defined. Carried from PRREVIEW~3. |
| 3.2 trivial component | p=3,a=2 | v₃log₃2=1 and v₃(1−1/3)=−1, so product valuation0; char(X)=char(Y)=(1) | Pole cancels, not ζ alone. Carried from PRREVIEW~3. |
| 3.3 finite-layer comparison | Split χ₅,p=11; n=0 | Universal-norm projection of circular line0 but finite circular lineOξ≠0; ν₀=1 so Λ/(ν₀)=0 | Control error retained. Carried from PRREVIEW~3. |
| 3.4 characteristic equality | T andT−p | Both have μ0,λ1 but unequal ideals; after known divisibility the quotient has μ0,λ0 and is a unit | Correct use of divisibility, not totals alone. Carried from PRREVIEW~3. |
| 3.5 main conjecture | p=3 | X∞⁺=0 and smoothed zeta ideal(1); both characteristic sides(1) | No Vandiver module-isomorphism overclaim. Carried from PRREVIEW~3. |
| 4.1 integral χ-quotient | C₂ sign overℤ₂ | Minus ℤ₂ has quotientℤ₂. The inclusion1↦1+s becomes ℤ/2→ℤ₂, zero, so exactness fails on the left | Correct integral quotient. Carried from PRREVIEW~3. |
| 4.2 norm descent | Identity extension; full local units at oddp | Identity norm kernel/cokernel0; −1 has order2 and is absent from the pro-p component | Full/pro-p distinction retained. Carried from PRREVIEW~3. |
| 4.3 circular tower | p=2,m=3; conductor15,a=3 | Absolute norm toℚ of1−ζ₃i is1; nonprimitive conductor15 input has rational norm25 rather than primitive norm5 | Roots and conductors not interchangeable. Carried from PRREVIEW~3. |
| 4.4 Coleman sequence | Unramified quadratic at3, Frob(i)=−i; p=2 boundary | β(exp9)=6; β(exp(9i))=12i, versus iβ(exp9)=6i. Dyadic f=a+bX maps to(b,a mod2); f=1 maps to(0,1) | β is not O-linear; sign term necessary. Product root is(1−X,1). Carried from PRREVIEW~3. |
| 4.5 semilocal interpolation | Dyadic roots ζ₈→ζ₄ | Nζ₈=−i and N(−ζ₈)=−i; chosen signed roots follow this transition | Retain signed norm sequence. Carried from PRREVIEW~3. |
| 4.7 Coleman circular image | p=5,h=2−X; p=3,conductor5 | Dlog(h) has linear coefficient1/4; boundary `(1−5)/4=−1`. InvolutionT′=−T+T²+…; upstairs residue norm exponent80 versus downstairs8 | Sign, full inversion and coefficient descent retained. Carried from PRREVIEW~3. |
| 4.8 semilocal quotient | Λ=ℤ_p[[T]], quotient byT−p | `(Λ[1/p])/(T−p)=ℚ_p≠0`; `ℚ_p[[T]]/(T−p)=0` | Correct bounded-denominator rationalization. Carried from PRREVIEW~3. |
| 4.10 bounded control | Ideal(p,T)⊂Λ; local roots at3 | Double dualΛ, defect𝔽_p of orderp; ℤ₃(1) survives rationally with annihilatorT−3 | Finite defects and Tate-root kernel retained. Carried from PRREVIEW~3. |
| 4.11 Kolyvagin/Maschke | Δ=C₂, sign moduleℤ₂ | Lift1↦1−s projects to2, not1; Δ trivial gives factor1 | Integral multiplier #Δ necessary. Carried from PRREVIEW~3. |
| 4.12 real all-prime theorem | First real dyadic layer | Norm-generated circular lattice2E gives quotient order2; CM-plus intersectionE gives order1; tower factors(2) versus(1) | Correct two lattices; rationalization removes(2). Carried from PRREVIEW~3. |
| 4.13 adjoint/twist | One-dimensional actiona, cyclotomic valueu | Dual Tate actionu/a; witha=1,u=4 it is4, not1 | Contragredient then twist retained. Carried from PRREVIEW~3. |
| 4.14 odd all-prime main | p=3,exceptionalω; dyadic numerator2 | Exceptional class module0 has char(1); half times numerator2 is1. Λ/(p) would be infinite despite rational vanishing | μ-vanishing input necessary. Carried from PRREVIEW~3. |
| 4.15 split divisors | ℚ(√−7),p=2 | Two prime classes modulo plus relation giveℤ₂; Γ acts trivially, annihilatorT | Correct exceptional factor. Carried from PRREVIEW~3. |
| 4.16 trivial-zero removal | Λ/(T(T−a)),a≠0 | RemoveT to obtainT−a with value−a at0; original value0 cannot be cancelled numerically | Correct order of operations. Carried from PRREVIEW~3. |
| 4.17 split extension | ℤ_p⋊ℤ_p with action1+p | Coinvariant kernelℤ_p/p, abelianization𝔽_p⊕ℤ_p | Exact sequence and commutator relation agree. Carried from PRREVIEW~3. |
| 4.19 exceptional derivative | Rank-one lattice, μ=b,λ=4g | IndicesNχ(b) andNχ(g) againstO and4O; quotientNχ(b)/Nχ(g) | Target lattice factor4 cancels correctly. Carried from PRREVIEW~3. |
| 4.20 class lower bound | Quartic conductor5,p=2 | Norm(B/2)=1/10, Nχ(B/2)=1/2≤class order1 | Fractional lower bound is meaningful. Carried from PRREVIEW~3. |
| 4.21 odd-prime comparison | C₃ acting onℤ/9 by4 | Norm1+4+7=3 mod9; kernel/cokernel each order3, image{0,3,6} | Integral error terms retained; not a projector. Carried from PRREVIEW~3. |
| 4.22 both finite branches, including the new Lean theorem | Sextic χ₇; quartic χ₅; quadratic χ₃; enlarged coefficients | Sextic Norm(B/2)=1/7 gives Nχ=1=class order. Quartic B=(−3+i)/5, Norm(B/2)=1/10 gives 1=2·(1/2). Degree-two coefficient extension gives 1=4·(1/4). Quadratic B=−1/3 gives 1=2·(1/2) | Both branches and the exponent e pass; no missing headline. Carried from PRREVIEW~3. |
| 4.23 finite-ray/log comparison | ℚ(√5),p=3; real cubic at2 | Regulator valuation1 and Euler factor4/3 valuation−1 cancel. Nontrivial sign part of real cubic has order4 | Ordinary/real ray correction cannot be discarded. Carried from PRREVIEW~3. |
| 4.24 ray transfer | C₂×C₂×C₃,p=3; identity | For C₆=Gal(ℚ(√5)ℚ(ζ₇)⁺/ℚ), inertia orders are2 and3, neither6. In C₂×C₂×C₃ inertia at7 containsC₃; relative degree3 gives αβ=3 and βα=1+σ+σ². Identity gives1 | Cyclic p-Sylow suffices; total ramification overℚ unnecessary. Carried from PRREVIEW~3. |
| 4.25 real formula | Trivialχ versus faithful C₃-character | Trivial ray quotient rank1 and L-value pole; onℤ/9 withσ=4, norm quotient order3 | Non-p-power and faithfulness conditions retained. Carried from PRREVIEW~3. |
| 4.26 Gras | ℚ(√5),p=3; real conductor7 cubic,p=2 | At3 E/C completion0, class0, both orders1; middle factor1, not2. At2 nontrivial residue degree2 contributes2²=4, cancelled by enlarged circular lattice | Correct middle factor and enlarged units. Carried from PRREVIEW~3. |
| 4.27 integral Coleman character | p=5, ρ=ω²; k=1; χ₅ at p=11 | Untwisted basis has θ=ρω⁻¹=ω; Tate twist gives ω². Lχ(u−1)=G_p(0,χ), whereas unshifted G_p(u−1,χ)=L_p(1,χ). At11 the even ρ kills the odd local-root terms, giving zero outer terms | Finite-character twist and Mellin inversion both necessary. Carried from PRREVIEW~3. |
| 5.1 finite equality | ℚ(√5),χ₅,p=3 and5 | Class order1 and unit quotient order1 at both primes; χ₅(5)=0 gives factor1 | Conductor divisible byp remains covered. Carried from PRREVIEW~3. |
| 5.2 odd-character formulation | p=3 | Only odd tame characterω; corresponding unramified module0 and characteristic ideal(1) | Exceptional component handled. Carried from PRREVIEW~3. |
| 5.3 Tate/Greenberg | n=−1,0,1,2; p=3,n=2 | `(r_n,r_(1−n))=(0,0),(0,1),(1,0),(0,0)`; atn2 Selmer0 has char(1), while the bare twisted zeta has a pole | Correct critical ranges and twisted augmentation factor. Carried from PRREVIEW~3. |
| `classGroupTensorAction` | Identity automorphism; conjugation on ℚ(√−23), p=3 | Identity sends x to x; the three reduced forms of discriminant−23 give class group C₃, conjugation sends its generator1 to2, whereas identity would give1 | Covariant native action retained. Carried from PRREVIEW~3. |
| `classGroupChiComponent` | Same C₃ class module, quadratic Galois sign/trivial characters | Sign eigenspace C₃ has order3; trivial eigenspace is kernel of−2, hence0 of order1 | Carrier discriminates the character. Carried from PRREVIEW~3. |
| `classGroupChiQuotient` | Same module and characters | Sign relation is0, quotientC₃; trivial relation is−2, quotient0 | Agrees with components when2 is invertible. Carried from PRREVIEW~3. |
| `unitTensorAction` | ℚ(√5), ε=(1+√5)/2,p=3 | Conjugation sends ε to−ε⁻¹, hence exponent1 to−1 after 3-adic tensor; identity sends1 to1 | Correct action, not inverse by definition. Carried from PRREVIEW~3. |
| `globalUnitImage` | Global ε; rational prime3 | ε has all finite valuations0 and lies in image; 3 has a nonzero prime valuation and is excluded | Actual global units, not all nonzero field elements. Carried from PRREVIEW~3. |
| `unitChiComponent` | Quadratic sign on ε; trivial character | Sign line Oε; trivial line0 after odd-primary tensor | Correct global/eigen intersection. Carried from PRREVIEW~3. |
| `xiChi` | Quadratic conductor5; trivial group | Cyclotomic norm gives exponent−2 on ε; trivial-group sum returns the norm class unchanged | Unnormalised sum, not zero or normalized projector. Carried from PRREVIEW~3. |
| `chiUnitQuotient` | Quadratic conductor5,p=3/5; zero global-unit tensor | Quotient by−2 gives order1 at either prime; zero submodule modulo zero also has order1 | Headline uses the actual nonzero circular line; boundary order convention consistent. Carried from PRREVIEW~3. |
| `primitiveBernoulliOne` | Odd quartic conductor5, inflated to55; trivial character presented modulo3 | Inflated B₁=0 because χ(11)=1, but primitive B₁=(−3+i)/5 up to conjugation; trivial primitive conductor1 gives+1/2 rather than the modulus3 sum0 | Primitive-character operation is essential. Carried from PRREVIEW~3. |

## Not verifiable

- **Sample targets in the changed passages:** nothing is unverifiable. The README dates GROSS-DASGUPTA-2022 as a 2022 manuscript; the copy read is arXiv 2303.03299v1 (March 2023), whose §2 and pp.3–5 match the locator.
- **Sample targets outside the changed passages:** 0.20, 0.25, 0.30, 1.3, 3.3, 4.4, 4.5, 4.10, 4.12 and 4.26 were not re-read this round, as the incremental scope allows. Each was checked at its locator in an earlier round: 0.25 in PRREVIEW~1; 0.30 and 4.5 in PRREVIEW~2; 4.4 and 4.26 in both; 0.20, 1.3, 3.3, 4.10 and 4.12 in PRREVIEW~3.
- **Other locators** outside the changed passages are carried from the previous reports, including MORITA-1975, which is still uncertified.
- **The five Lean theorems** are admitted by design. The elaboration, the binder check and the computed instances certify their types and the tested cases, not formal proofs.

## Source issues

- **Error** in GREITHER-1992 at §4, the Gauss-sum construction, printed p.490 (GREITHER-1992 line 1469): the source says the Gauss sum `g` lies in `F`; it should say `g` lies in the decomposition field of 2 in `ℚ(μ_m)`, with its norm to `F` used instead; affects a stated result.
- **Error** in GREITHER-1992 at `(G1)`, printed pp.490–491 (GREITHER-1992 lines 1478–1481): the source says `μ_χ(g)` is `m·B_{1,χ^{−1}}` times `(𝔭)_χ`; it should be `B_{1,χ^{−1}}·(𝔭)_χ` with no factor `m` (at `m=7` the valuations give `−1`, not `−7`); affects nothing.
