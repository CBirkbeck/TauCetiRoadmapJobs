# Review of ModularCurvesPartII (pull request #913 at 82d96e2)

**Verdict:** accepted

Incremental re-review of the 134 lines changed since b12d5ad (the Layer 16 import of the modular quotient, the Gross–Zagier locators, the spelled-out Calegari–Dimitrov–Tang citations and the Lean docstrings), with the previous findings re-checked. No P1 or P2 finding remains; the gate passes. The four notes below are the author's to take or leave.

## R01 (P3) — The summary still names Shimura's dimension theorem as an end result of this roadmap

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:3`: "The end results are … Ihara injectivity and saturation, Shimura's dimension theorem for modular abelian varieties, and finite-level Taylor–Wiles freeness."

**Claim:** The roadmap's end results include Shimura's theorem `dim A_f=[K_f:ℚ]`.

**Witness:** Line 17 and §16.3 (lines 4138–4142) now say the theorem and `modularTate_rank_two` are CyclotomicClassGroupsAndStickelberger §4.3's and are "consumed here, not proved again"; the Lean docstring (Suggested.lean lines 33–35) correctly lists only the `J₀(N)` isogeny and the Abel–Jacobi composite for Layer 16.

**Repair:** In the summary replace "Shimura's dimension theorem for modular abelian varieties" by what Layer 16 now delivers, for example "the `J₀(N)` quotient isogeny, oldform factors and Abel–Jacobi composites for the imported modular abelian varieties".

## R02 (P3) — Name the level-`Γ₀` inputs of the rank-two freeness that §16.5 now proves inline

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4180`: "the argument of §14.14 run on `X₀(N)`, with the perfect full-Hecke pairing of §7.6 in place of the `Γ₁` one, gives `V_ℓ(J₀(N))` free of rank two over `ℚ_ℓ⊗T₀(N)`"; `*Needs:*` at line 4196.

**Claim:** §16.5 obtains `dim A_f⁰=[K_f:ℚ]` from rank-two freeness of `V_ℓ(J₀(N))` over `ℚ_ℓ⊗T₀(N)`.

**Witness:** §14.14's argument (lines 3827) identifies `H¹` with its dual through §14.7's `w_ζ`-twisted self-adjointness, which is stated for `T₁(N)` on `X₁(N)` only (line 3662). On `X₀(N)` the same step needs the full `T₀(N)`, including every `U_p`, self-adjoint for the `w_N`-twisted pairing (Ribet–Stein p.70, lines 3014–3016 of the cached text, run with `w_N` for `w_ζ`); the `*Needs:*` line names neither §13.4 (whose prose covers it for "the chosen Fricke map") nor §9.4 (`w_N`), nor §14.5 and §14.13 at level `Γ₀(N)`. The mathematics is right: for `N=22` the old block has `U₂` with characteristic polynomial `X²+2X+2`, so `ℚ⊗T₀(22)=ℚ(i)` and `H¹` of dimension four is free of rank two; for `N=11`, `T₀(11)=ℤ` and `H¹` has dimension two.

**Repair:** Add to §16.5's `*Needs:*` the inputs the transposed argument uses: §13.4 with §9.4's `w_N` for the twisted self-duality, §14.5 and §14.13 at level `Γ₀(N)`; or state "`V_ℓ(J₀(N))` is free of rank two over `ℚ_ℓ⊗T₀(N)`" as its own one-sentence target in §14.14 (for `Γ₀(N)` with the full algebra and the `w_N`-twisted pairing) and cite it from §16.5.

## R03 (P3) — §16.3 consumes a step the supplier names only as a sourced proof step

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4153`: "CyclotomicClassGroupsAndStickelberger §4.3 (dimension theorem, `modularTate_rank_two`, rational Tate exactness of the quotient)"; line 290 likewise.

**Claim:** §4.3 supplies the identification of `V_ℓ(A_f)` with `V_ℓ(J₁(N))/p_fV_ℓ(J₁(N))` by `q_f`.

**Witness:** At its open head, §4.3 names `modularQuotient`, `abelianSubvarietyQuotient` (identified with `D/(C∩D)` through a Poincaré complement), `modularTate_coefficientComparison`, `modularTate_rank_two` and `dim A_f=[E:ℚ]`; rational Tate exactness appears only in its sources sentence ("Ribet–Stein, Definition 5.13 and proof of Theorem 5.14, p.73, for … rational Tate exactness"), not as a stated target. The identification is nevertheless a two-line consequence of inputs this roadmap already lists: §16.5 derives the same statement for `J₀(N)` from AbelianSchemesAndArithmeticModuli A6.5 and A4.

**Repair:** In §16.3 state the identification `V_ℓ(J₁(N))/p_f ≅ V_ℓ(A_f)` as this roadmap's own one-line consequence of A6.5 and A4 (exactly as §16.5 does for `J₀(N)`), citing §4.3 only for `dim A_f=[K_f:ℚ]` and `modularTate_rank_two`; drop "rational Tate exactness of the quotient" from the §4.3 contract at lines 290 and 4153.

## R04 (P3) — The renumbering of §§16.3–16.8 leaves the open consumers' citations stale

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4138–4219`: the former §§16.4–16.8 are now §§16.3–16.7.

**Claim:** Consumers reach the dimension theorem, the `J₀(N)` quotient, oldforms and the Abel–Jacobi composite by section number.

**Witness:** At their open heads, EllipticCurveModularity (README lines 73, 1502, 1552, 1704, 1757, 1843, 1968) cites "§§16.2–16.8", "§16.4" for the dimension theorem, "§16.6" for the `J₀(N)` quotient, "§16.7" and "§16.8"; AutomorphicGaloisRepresentations (line 2450) cites "§16.4"; EllipticCurveModularityPartIIGL2TypeAbelianVarieties (lines 386, 393, 397, 401) cites "§16.6" for the `J₀(23)` isogeny and "§§16.1–16.7". Under this head, §16.6 is oldforms, §16.8 does not exist, and the dimension theorem is §16.3.

**Repair:** Nothing in this folder: carry the mapping (old 16.4→16.3, 16.5→16.4, 16.6→16.5, 16.7→16.6, 16.8→16.7, and the dimension theorem now imported from CyclotomicClassGroupsAndStickelberger §4.3) to the three consumers when they are next revised. Recorded here so the drift is not mistaken for a defect of theirs later.

## Previous findings

- R01 — repaired: §16.2 is the import ("the shared Albanese quotient `modularQuotient f` of CyclotomicClassGroupsAndStickelberger §4.3 … this roadmap constructs no quotient of `J₁(N)`"); the construction paragraph and the nine interface bullets are gone; §§16.3–16.4 are one paragraph consuming the dimension theorem and `modularTate_rank_two`, with the Layer 14 comparison and the level-11, level-23 and order-11 Checks kept. Every consumed name resolves in §4.3 at the open head (lines 622–694 of the printed roadmap). The merged section's new Checks are correct (table below). R02 and R03 of this report are the two small loose ends the repair left.
- R02 — repaired: the "(PDF p.N)" annotations are gone from §§6.3, 7.5, 7.6 and the References entry now says the scan is not a uniform offset; the printed pages are right (I §1 on printed 226: GrossZagier lines 50–90, the cusps ∞ and 0 with 1 and N components; V §1 on printed 306: lines 3104–3115).
- R03 — repaired: "CDT" no longer occurs; the five README passages (lines 3978, 4058, 4072, 4076, 4090) and the three Lean docstrings (lines 112, 150, 161) say Calegari–Dimitrov–Tang.

## Verified sound

**Scope of this round.** The diff (134 lines: README 117, Suggested.lean 17) and everything that cites it were read: lines 17, 141–147, 172, 290, the Layer 16 sections 16.1–16.7 with their Examples and Dependencies, §§6.3, 7.5, 7.6, 13.4, 14.5, 14.7, 14.13, 14.14, §§15.5, 15.9, 15.10 and the Lean module docstring and three declaration docstrings. The gate record for this head reports every counter zero and `OK`. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The dependency check run by this review returned

```text
depcheck: 201 roadmaps, 1326 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line; CyclotomicClassGroupsAndStickelberger is line 29 of the merge order and this roadmap line 70. No process word, pull-request number, LaTeX delimiter, stray file, `set_option`, sorry'd data or edit outside the folder appeared in the diff. The 51 resolver leads are unchanged from the previous round and none falls in the changed passages.

**Supplier resolution at the open head.** CyclotomicClassGroupsAndStickelberger §4.3 (pull request head, lines 622–694): `modularQuotient f` built over ℚ from the Jacobian of `X₁(N)` on the `(E,P)` model with the Albanese action `T_ℓ=π₂*π₁^*`, `⟨a⟩=I_a*`, eigencharacter `T_n↦a_n(f)`, `⟨a⟩↦ε(a)`, kernel generated by the images of the annihilator; `abelianSubvarietyQuotient B C` for any abelian subvariety of an abelian variety over any field, with surjective map, kernel C, universal property and field-extension compatibility, through a Poincaré complement; `modularQuotientForIdeal I`; `modularQuotient_map`, `_kills`, `_lift`, `_hom_ext`, `_baseChange`, `_hecke`; `dim A_f=[E:ℚ]`; `modularTate_coefficientComparison`; `modularTate_rank_two`. Its Checks (zero and unit ideals, `N<5`, level 11, weight twelve) agree with §16.2's. Conventions agree: the same model, the same Albanese action, the Picard quotient transported by the cyclotomic Fricke map and never identified on the same quotient. The `N≥5` hypothesis of §16.2 is this roadmap's representability range for the `(E,P)` model over ℤ (its own §5.20 shows `Γ₁(4)` fails at 2) and is vacuous for the supplier since no weight-two newform exists below level 11. `abelianSubvarietyQuotient` over an arbitrary field covers §16.5's use on `J₀(N)`. The other citations the diff touches resolve as in the previous round: AbelianSchemesAndArithmeticModuli A3.7, A4, A6.5 (`poincareReducibility`), A3.2 (`multiplicationAndDensity`); NeronModelsAndSemistableAbelianVarieties §5.1; JacobianChallenge Layer F; SchemeAndStackFoundations §0.7; ModularForms Layers 4, 5, 8, 8G. A3.3 is no longer cited anywhere. Ownership against the listed open pull requests: the only other owner of the modular quotient is the cited supplier; no consumer builds it (AdelicImagesAndModularCurves, EllipticCurveModularity, AutomorphicGaloisRepresentations, EllipticCurveModularityPartIIGL2TypeAbelianVarieties all consume it, see R04).

**Seeded sample, where it falls in the changed passages.** §16.2 (the one sampled target the diff touches): RibetStein (author-page text, 4032 lines) lines 3162–3171, printed p.73: `K_f` generated by the `a_p`, `p_f` the minimal prime, Definition 5.13 `A_f=Pic⁰X₁(N)/p_f` under the `( )_*` action, good reduction over `ℤ[1/N]`, `K_f≅(T₁(N)/p)⊗ℚ` acting up to isogeny; lines 1342–1347, printed p.29, §2.3.1.2: `A_f` the quotient of `J₁(N)` by the image of the annihilator of f; lines 1269–1273, printed p.28, §2.3.1: dimension `[E:ℚ]`. Supports §16.2 and §16.3 as written. §16.3's Theorem 5.14 and its proof (lines 3172–3185): dimension and rank-two freeness from Lemma 5.11, Theorem 5.12 and rational Tate exactness via Poincaré reducibility, which is what R03 is about. §16.5's Corollary 5.9 and its proof (lines 3001–3041, printed pp.69–70) were read for R02. The Gross–Zagier pages are in the R02 entry above. The other fourteen sampled targets (1.4a, 3.12, 4.3, 4.11, 5.15, 5.20, 7.1, 7.1a, 7.3, 7.4, 10.2, 11.7, 14.4, 14.9) are untouched by the diff and were verified in the full reviews of rounds 1 and 2.

**Lean.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all ten declarations elaborated in four seconds with exactly seven `declaration uses sorry` warnings and no other message. Every elaborated type is unchanged from the previous round (the diff touches docstrings only): `regularInvariants_iff_principalInertia` keeps `IsRegularLocalRing A`, `Module.Finite (FixedPoints.subring A G) A`, the residue-field unit and the trivial residue action; `perfectHeckePairing` keeps `[NeZero N]`; `sArithmetic_congruenceSubgroupProperty` keeps `IsLocalization.Away` and `FiniteIndex`; the three Ihara theorems keep `3 ≤ N` or `5 ≤ N`, both primes, `¬ p ∣ N`, the rational conjugation equation and the agreement hypothesis. The module docstring now names, for Layer 16, the `J₀(N)` quotient isogeny and the Abel–Jacobi composite as not statable (modular Jacobians and Hecke actions absent at the pins) and no longer lists the imported dimension theorem: correct. No new declaration, so the one-tactic probe of the previous round stands (no padding). The `3 ≤ N` and `5 ≤ N` hypotheses of §§15.6, 15.7, 15.10 remain unused by the arguments (P3 note carried from round 2, not a finding).

**Headline theorems.** Unchanged list: compact modular uniformization and cusp fields; connected fixed-pairing and twisted curves; integral level stacks, coarse curves and their base-change range; the weight-two differential and perfect Hecke-pairing dictionary; bad fibres and nearby cycles; Jacobian functoriality and integral duality; the Shimura isomorphism and rank-two freeness; CSP, Ihara and congruence invariance; the modular abelian quotients (the `J₀(N)` isogeny, oldforms, the Abel–Jacobi composite; the dimension theorem is imported); Eichler–Shimura, modular monodromy and Taylor–Wiles freeness. The seven statable ones are stated; none is absent or forced through a stand-in.

### Computed adversarial pass

Rows for statements the diff leaves untouched carry forward from the round-2 report (`PRREVIEW-ModularCurvesPartII~2`, table rows 0.1–17.9), each verified there with the values recorded; this round adds rows for every changed statement.

| Statement/target | Instances tried | Values computed on each side | Result/change |
| --- | --- | --- | --- |
| 0.1–5.20, 6.2, 6.4, 7.1–7.4, 8.2–13.7, 14.6–14.9a, 15.3–15.8, 16.1, 17.2–17.9 | as in the round-2 table | as in the round-2 table | untouched by the diff; carried forward from the previous report |
| 6.3 (locator only) | Gross–Zagier I §1 | printed 226 carries the start of I §1 (cusps ∞ and 0 with 1 and N components); the scan's PDF page 2 | locator correct; PDF annotation rightly dropped |
| 7.5, 7.6 (locator only; Lean headline unchanged) | Gross–Zagier V §1 | printed 306 = PDF page 101, heading "§1. Heights of Heegner points and derivatives of L-series"; `perfectHeckePairing` elaborates unchanged with `[NeZero N]` | locator correct; sound |
| 15.5, 15.9, 15.10 (citation spelling only) | the three Lean docstrings and the five README passages | "CDT" occurrences: 0; Calegari–Dimitrov–Tang named at Lemma 4.6.2, Corollary 4.5.3, Lemma 4.6.3; signatures unchanged (7 sorry) | sound |
| 16.2 Check 1 | `N≤10`, `N=12` against `N=11`, `13` | genus of `X₁(N)`: 0 for `N∈{1,…,10,12}`; `g(X₁(11))=1`, `g(X₁(13))=2` | first weight-two newform at `N=11`; sound |
| 16.2 Check 2 | `N=11` | `dim S₂(Γ₁(11))=1`, all diamonds trivial, `T₁(11)=ℤ[a_n]=ℤ`, `λ_f=id`, `p_f=0`, `B_f=0`, `q_f` an isomorphism; the whole-algebra kernel gives `J/J=0` | distinguishes the annihilator kernel from the whole-algebra kernel; sound |
| 16.2 Check 3 | `N=23`, trivial character | `X₁(23)→X₀(23)` unramified of degree 11, `g(X₀(23))=2`, `g(X₁(23))=11·2−10=12`; `J₀(23)` simple with `K_f=ℚ(√5)`; `dim A_f=2`, `dim B_f=12−2=10` | sound |
| 16.2 (`N≥5` and the supplier's range) | `N=4` over ℤ at 2; `N<11` | `[−1]` fixes the Drinfeld ℤ/4-structure on the multiplicative locus in characteristic 2 (§5.20), so the `(E,P)` model is not representable over ℤ at `N=4`; `S₂(Γ₁(N))=0` for `N<11` | consumer hypothesis stricter than the supplier's, vacuous on the newform range; sound |
| 16.2 good reduction | `p∤Nℓ`; `p∣N` | `V_ℓ(A_f)` a quotient of `V_ℓ(J₁(N))`, unramified at `p∤Nℓ`; no claim at `p∣N` | Néron–Ogg–Shafarevich as cited; sound |
| 16.3 Checks | level 11; level 23 trivial χ; level 23 ε of order 11 | `[K_f:ℚ]=1,2,10`; `dim_{ℚ_ℓ}V_ℓ(A_f)=2,4,20`; against `2 dim A_f=2,4,20` | sound |
| 16.3 integral non-exactness Check | isogeny `B→A` with kernel of order ℓ | `V_ℓ` surjective (isogeny invariance); on `T_ℓ` the cokernel is `ℤ/ℓ` (e.g. `[ℓ]:E→E` on `T_ℓE≅ℤ_ℓ²` has cokernel `(ℤ/ℓ)²`, `T_ℓ` of a cyclic-ℓ-kernel isogeny has cokernel `ℤ/ℓ`) | sound |
| 16.3 comparison route | level 11; level 23 | `V_ℓ(J₁(N))` free of rank 2 over `ℚ_ℓ⊗T₁(N)` (§14.14); quotient by `p_f` free of rank 2 over `ℚ_ℓ⊗K_f`: dimensions `2·1`, `2·2` | recovers the import; sound |
| 16.4 (Needs renumbered) | `w_ζ` transport | unchanged statement; Needs now §16.3 (exists) | sound |
| 16.5 rank-two freeness on `X₀(N)` | `N=11`; `N=22`; `N=44` old block | `T₀(11)=ℤ`, `dim H¹=2`; `U₂` on `span{f,V₂f}` has matrix `[[−2,1],[−2,0]]`, characteristic polynomial `X²+2X+2`, `ℚ⊗T₀(22)=ℚ(i)`, `dim H¹=4=2·2`; on `span{f,V₂f,V₄f}` the characteristic polynomial is `X(X²+2X+2)` (semisimple) | free of rank two in each instance; the `w_N`-twisted self-adjointness of `U_p` is the input R02 asks to be named |
| 16.5 isogeny `v∘u=[d]` | `N=11`; `E×E` with `diag(1,0)`; `u=v=0`; `E→E×E` | `d=φ(11)/2=5`, `[5]` on a dimension-one `A_f⁰`; `diag(1,0)` has kernel `0×E` (not an isogeny); `[0]` fails positivity; `x↦(x,0)` with first projection gives `[1]` yet unequal dimensions | criterion hypotheses each necessary; sound |
| 16.5 universal properties | `A_f⁰` and `A_f` | `π^*` sends `B_f⁰` into `B_f` and `π_*` sends `B_f` into `B_f⁰` because `p_f` is the inverse image of `p_f⁰` under `T₁(N)→T₀(N)`; `abelianSubvarietyQuotient` and `modularQuotient_lift` both resolve in §4.3 | sound |
| 16.6 (Needs renumbered) | `M=N`, `Np`, `Np²` | `τ(1),τ(p),τ(p²)=1,2,3` | unchanged; sound |
| 16.7 (Needs renumbered) | constant composite | value `q_f(AJ_c(c))=0`, image generates `J`, so `q_f=0`, contradicting `A_f≠0` (§16.3) | unchanged; sound |
| line 147 (A6 contract) | A6.5 uses | §16.5 (rational Tate exactness of the `J₀(N)` quotient), §16.6 (isogeny decomposition) | consistent with the Needs lines; sound |
| Lean docstring, lines 33–35 | Layer 16 entries | `J₀(N)` isogeny and Abel–Jacobi composite listed as not statable; the dimension theorem absent (imported) | matches README; sound |

### Pinned library and Lean audit

The pins are those of `lake-manifest.json` (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`), unchanged since round 2. Declarations opened this round at the pin: none new (the diff adds no Lean statement); the round-2 list of 62 declarations stands.

## Not verifiable

- Nothing new this round. The Calegari–Dimitrov–Tang, Faltings–Chai, Bosch–Lütkebohmert–Raynaud, Stichtenoth, Katz–Mazur and Serre items of the round-2 report are untouched by the diff and remain as recorded there.
- Ribet–Stein and Gross–Zagier were read this round from their author-hosted copies (William Stein's page; Zagier's MPIM page), fetched through the sources service with the author-page licence class.

## Source issues

- none
