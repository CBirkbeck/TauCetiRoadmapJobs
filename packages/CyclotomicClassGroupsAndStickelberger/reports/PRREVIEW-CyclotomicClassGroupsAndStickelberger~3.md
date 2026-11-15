# Review of CyclotomicClassGroupsAndStickelberger (pull request #1260 at 10bc9eb)

**Verdict:** needs changes

## R01 (P2) — Shared results still have two declared owners

**Location:** `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md:1315`: “The shared field-valued package in §4.3 supplies downstream AbelianSchemesAndArithmeticModuli”.
**Claim:** Previous R01 remains unresolved: the shared abelian and local results are still independently owned by later roadmaps. The binding ownership rule classifies this duplication as P2.
**Witness:** PR #849, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2955`, independently targets `homFreeFinite`; PR #879, `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1700`, independently targets Hodge–Tate decomposition. Neither passage imports this roadmap's shared package.
**Repair:** Keep the earlier ownership here and record the exact allocation: “AbelianSchemesAndArithmeticModuli A3.9, A4.1, A6.7, A6.11 and A6.14 specialize §4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.19, R07.1.24 and R07.1.30 specialize §4.4.” The later roadmaps must import those shared results; their own reviews handle those edits. For A6.7, both statements give the same bound `rank Hom(A,B) ≤ 4 dim A dim B`.

## R02 (P3) — Gauss-product signature contains a local instance command

**Location:** `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/Suggested.lean:171`: `letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩`.
**Claim:** `abelianCharacter_gauss_product` fails the gate's statement-hygiene rule forbidding `letI` in theorem signatures.
**Witness:** The gate reports this exact hit; `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:254` supplies `DirichletCharacter.conductor_ne_zero` under `[NeZero m]`.
**Repair:** Before the three character-product theorems, add a documented named local instance `conductorNeZero (m : ℕ) [NeZero m] (χ : DirichletCharacter ℂ m) : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩`; delete the signature's `letI` line. The scratch replacement elaborates, including the primitive conductor-one factor.

## R03 (P3) — Relative-class-number signature contains a local instance command

**Location:** `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/Suggested.lean:186`: `letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩`.
**Claim:** `relativeClassNumber_character_product` fails the same statement-hygiene rule.
**Witness:** The gate identifies line 186; its conductor instance has exactly the type provided by R02's named instance.
**Repair:** Use R02's named instance and delete this `letI` line. The complete scratch file elaborates; at F=ℚ(i), the product remains `1·4·(−(−1/2)/2)=1=h⁻`.

## R04 (P3) — Real-class-number signature contains a local instance command

**Location:** `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/Suggested.lean:198`: `letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩`.
**Claim:** `realClassNumber_log_product` fails the same statement-hygiene rule.
**Witness:** The gate identifies line 198; the summation over `ZMod χ.conductor` elaborates with R02's named instance.
**Repair:** Use R02's named instance and delete this `letI` line. The scratch replacement elaborates; for ℚ(√5), both products equal `log((1+√5)/2)`.

## R05 (P3) — Eigenlift signature introduces an unnecessary local instance

**Location:** `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/Suggested.lean:222`: `letI := hE`.
**Claim:** `primeLevel_cuspidal_eigenlift` fails the statement-hygiene rule; this instance command is unnecessary for the remaining signature.
**Witness:** Deleting this line while retaining the existential `(hE : NumberField E)` elaborates successfully at the pins, with no additional hypothesis or instance.
**Repair:** Delete `letI := hE`, retaining the existential number-field witness. The p=37, k=32 specialization still requires residues 23 and 31 at primes 2 and 3.

## Previous findings

- R01 — not repaired: README:1315 still names the downstream roadmaps without the requested section mapping; their heads still independently target the shared results. Carried as R01 under this round's P2 ownership rule.
- R02 — repaired: README:1039 writes the explicit ratio and cites `cyclotomicRatio_norm`; README:1048 names `smoothedCyclotomicUnit`. IntegralIwasawaTheory §§1.3–1.4 supply those names; §1.6 supplies the dyadic phase.
- R03 — repaired: README:632 and 1323 now say “Theorem 9.17, p.300, with proof on pp.300–301”; montgomery-vaughan line 1295 closes the proof before p.302.

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result / change |
|---|---|---|---|---|
| §3.4 quadratic Gauss sum | Primitive characters of discriminants −4, 8, −8; conductor 1 | 2i; 2√2; 2√2 i; 1 | i√4; √8; i√8; √1 | Equal; page correction verified |
| §6.1 integral ratio | (m,a)=(5,2),(8,3),(2,1) | 1+ζ₅; 1+ζ₈+i; 1 | (ζ₅²−1)/(ζ₅−1); (ζ₈³−1)/(ζ₈−1); 1 | Equal; supplier name repaired |
| §6.1 real phase | (m,a,t)=(5,2,2),(8,3,−1) | −1.618033989; 2.414213562 | −(1+√5)/2; 1+√2 | Equal; odd and dyadic conventions agree |
| `abelianCharacter_gauss_product` | m=4, F=ℚ(i) | τ(1)τ(χ₋₄)=1·2i | i¹√4=2i | Equal; R02 concerns form |
| `relativeClassNumber_character_product` | m=4, F=ℚ(i) | h(F)/h(ℚ)=1/1=1 | Qw(−B₁,χ/2)=1·4·1/4=1 | Equal; R03 concerns form |
| `realClassNumber_log_product` | m=5, F=ℚ(√5) | hR=log((1+√5)/2)=0.4812118251 | −½Σχ₅(a)log\|1−ζ₅ᵃ\|=0.4812118251 | Equal; R04 concerns form |
| `primeLevel_cuspidal_eigenlift` | p=37, k=32; ℓ=2,3 | Required reductions c₂=23, c₃=31; χ(2)=11 | 1+2³¹≡23; 1+3³¹≡31; 2³⁰≡11 mod 37 | Consistent; existence not computed; R05 |
| §4.3 `homFreeFinite` | Zero abelian variety; non-CM elliptic curve E/ℂ | rank Hom(0,0)=0; rank End(E)=1 | Bounds 4·0·0=0; 4·1·1=4 | 0≤0, 1≤4; ownership R01 |
| §4.4 Hodge–Tate decomposition | μ_{p∞}; ℚ_p/ℤ_p | Weight multiplicities (0,1); (1,0) | (dim Gᴰ,dim G)=(0,1); (1,0) | Equal; ownership R01 |
| §4.4 full faithfulness | Constant ℤ/3 over ℤ₃ and ℚ₃ | Integral endomorphisms: 3 | Generic endomorphisms: 3; e=1<2 | Equal; ownership R01 |

The adversarial rows for untouched statements stand as in the previous review of `5de2052`.

- Sources: 2 locators rechecked—montgomery-vaughan lines 1229–1295 (Theorem 9.17 and proof); sharifi lines 3396–3430 (Theorem 4.3.3 and proof).
- Pins: 3 declarations opened—Mathlib `RingTheory/RootsOfUnity/CyclotomicUnits.lean:100`, `NumberTheory/NumberField/Cyclotomic/Basic.lean:214`, `NumberTheory/DirichletCharacter/Basic.lean:254`.
- Changed supplier citations: 3 sections resolved at IntegralIwasawaTheory #1306, §§1.3, 1.4, 1.6; ratio, norm and real-phase conventions agree.
- Signatures: all 29 named definitions/theorems checked with `#check @name`; no lost binder; the scratch repair preserves the mathematical statements.
- Gate: FAIL, exactly 4 statement-hygiene hits; all other scanners pass. Dependency output: `depcheck: 245 roadmaps, 2214 edges, 0 problem(s)`.
- Lean: targeted build succeeds (9104 jobs); original-file elaboration, signature probe and repaired scratch copy each exit 0 with exactly 21 `sorry` warnings.
- PR text: title, prose and `roadmap-summary` match the new 1680-line folder; 0 removed headings/declarations, 0 outside-folder changes, and no supplier changes in the incremental diff.

Overlap check: read EulerSystemsCyclotomicMainConjecture, IntegralIwasawaTheory, ArithmeticKTheory, EisensteinIdealAndRationalTorsion, DirichletPadicLFunctions and ClassicalArithmeticCompletion; circular units and norm limits belong to IntegralIwasawaTheory, finite-field Gauss valuations to ClassicalArithmeticCompletion, finite cyclotomic annihilation/regularity to this roadmap, main-conjecture applications to EulerSystemsCyclotomicMainConjecture, K-groups to ArithmeticKTheory, Eisenstein torsion to EisensteinIdealAndRationalTorsion, and interpolation to DirichletPadicLFunctions. Shared abelian/local ownership remains R01.

Source independence: changed passages only—4 passages compared with 2 sources and IntegralIwasawaTheory; no copied wording or reused material found. Montgomery–Vaughan has the largest share of changed source citations, 2 of 3. No layer was added, removed or reordered; arrangement was not re-reviewed.

## Not verifiable

- none within the changed passages; untouched source certifications remain those of the previous review.

## Source issues

- none

## For the human reviewers

- none
