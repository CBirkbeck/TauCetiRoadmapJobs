# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheory (pull request #879 at 9856719)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed since `b4c015e`, of the gate at this head, and of the pull request's title and description.

## R01 (P3) — Gate `statement-hygiene`: `flFiniteFlatDictionary` concludes a bare `Nonempty` equivalence

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/Suggested.lean:256–258`: “`theorem flFiniteFlatDictionary (hp : 2 < p) : Nonempty ((PGroup p (WittVector p k))ᵒᵖ ≌ FLTorsion p k)`”.

**Claim:** the headline is the Fontaine–Laffaille anti-equivalence of §R07.3.18; the gate refuses a theorem that concludes `Nonempty (A ≌ B)` unless it is named `nonempty_*`.

**Witness:** the gate at `9856719`: `statement-hygiene: line 257: P3 theorem flFiniteFlatDictionary concludes Nonempty (…)`. The statement pins nothing about the functor: any equivalence satisfies it, with no law relating order to length.

**Repair:** state the functor with a law, in the shape `dieudonneEquivalenceFinite` already has (elaborates on a scratch copy, `sorry` the only warning):

```lean
theorem flFiniteFlatDictionary (hp : 2 < p) :
    ∃ Mfun : (PGroup p (WittVector p k))ᵒᵖ ⥤ FLTorsion p k,
      Mfun.IsEquivalence ∧
      ∀ (G : PGroup p (WittVector p k)) (n : ℕ), rank G.obj = p ^ n →
        Module.length (WittVector p k) (Mfun.obj (op G)).obj.M = n := by
  sorry
```

Values: `μ_p` and `ℤ/p` have `M = k`, length `1 = n`; the trivial group has `M = 0`, `n = 0`.

## R02 (P3) — Gate `statement-hygiene`: `finiteFlatClassification` concludes a bare `Nonempty` equivalence

**Location:** `Suggested.lean:313–319`: “`Nonempty ((PGroup p R)ᵒᵖ ≌ TorsionKisinModule p k E)`”.

**Claim:** the headline is the all-prime Kisin–Kim anti-equivalence of §§R07.4.22–R07.4.23; same gate rule as R01.

**Witness:** the gate at `9856719`: `statement-hygiene: line 318: P3 theorem finiteFlatClassification concludes Nonempty (…)`.

**Repair:** replace the conclusion by (elaborates on the same scratch copy):

```lean
    ∃ Mfun : (PGroup p R)ᵒᵖ ⥤ TorsionKisinModule p k E,
      Mfun.IsEquivalence ∧
      ∀ (G : PGroup p R) (n : ℕ), rank G.obj = p ^ n →
        Module.length (Sfrak p k)
          ((Mfun.obj (op G)).M ⧸
            (Ideal.span {(PowerSeries.X : Sfrak p k)} •
              (⊤ : Submodule (Sfrak p k) (Mfun.obj (op G)).M))) = n := by
```

Values: `μ_p`, `ℤ/p`: `𝔐 = k⟦u⟧`, `𝔐/u𝔐 = k`, length `1`; `ℤ/p²`: `𝔐 = 𝔖/p²`, `𝔐/u𝔐 = W₂(k)`, length `2`. The length of `𝔐/u𝔐` is additive on `(Mod/𝔖)` because `u` is injective on the quotient.

## R03 (P3) — The cyclotomic supplier citation still names declarations and a section that the supplier's head does not have

**Location:** `README.md:2875–2877`: “its `cyclotomicClassEigenspaces`, `bernoulli_annihilates_component`, `herbrand`, exponent-one vanishing theorem (§§2.3–3.1), `inverseCharacterClassGroup` and `inverseCharacterUnramifiedQuotient_zero` supply this prime-conductor specialization”.

**Claim:** these are names and the section of CyclotomicClassGroupsAndStickelberger. (Previous R01, third part: the name `cyclotomicClassEigenspace_one_eq_zero` is gone, as asked; the section the previous review suggested, §§2.3–3.1, is wrong, and the supplier's head has since renamed the neighbours.)

**Witness:** CyclotomicClassGroupsAndStickelberger at its open head: the exponent-one vanishing is in §3.2 (its README line 568); the carrier is `cyclotomicClassEigenspace` (line 148, `Suggested.lean` line 63); §8.1 states `inverseCharacterClassGroup_all_levels` (line 1233); `herbrand`, `cyclotomicClassEigenspaces`, `inverseCharacterClassGroup`, `inverseCharacterUnramifiedQuotient_zero` occur nowhere in it (its interface for R07.G5 is line 1298).

**Repair:** “its carrier `cyclotomicClassEigenspace` (§0.2), `bernoulli_annihilates_component`, Herbrand's implication and the exponent-one vanishing theorem (all §3.2), `inverseCharacterClassGroup_all_levels` at `r = 1` (§8.1) and the vanishing of the inverse-character unramified quotient (§8.2) supply this prime-conductor specialization”.

## R04 (P3) — API bullets carry backticked Lean names that `Suggested.lean` does not declare (previous R02, not repaired)

**Location:** `README.md:638–642` (“- `frobeniusHom`: …”, “- `verschiebungHom`: …”) and the other API bullets of that form, 192 in all; `README.md:320` names a namespace `SerreWeights` (§R07.5.15).

**Claim:** house style: an API bullet carries a backticked Lean name only when `Suggested.lean` declares it.

**Witness:** `grep -c` of bullets “- `name`: ” gives `192` at this head, as at `b4c015e`; the last component of only 15 of the 192 names occurs in `Suggested.lean` at all (27 declarations); no `namespace SerreWeights` in the file. The gate's `readme-ids-missing` scanner passes them.

**Repair:** drop the labels and keep the prose (“The Frobenius `F_G : G ⟶ G^{(p)}` is a homomorphism of group schemes.”); delete “and `SerreWeights` (§R07.5.15)” at :320. No mathematics changes.

## R05 (P3) — Description: “It has six layers” leaves out Layer R07.G and the R07.P interfaces

**Location:** pull request description: “It has six layers:” followed by R07.1–R07.6.

**Claim:** the list is the roadmap's layers.

**Witness:** the head has seven `## Layer` headings: `README.md:2722` “Layer R07.G: Global admissible groups and dyadic amalgams” (§§R07.G1–G8) sits between R07.1 and R07.2; Layer R07.1 also holds §§R07.P2–R07.P5a and R07.P7.1–R07.P7.5.

**Repair:** “It has seven layers:”, with, after R07.1 (whose bullet adds “the finite-`K` period and realization interfaces R07.P2–P5a and R07.P7.1–P7.5”): “**R07.G, global admissible groups.** Marked global models, geometric-fibre lengths, the global cohomology bound, rank-one groups, the cyclotomic class-group obstruction, odd global purity, the dyadic `D`-model and dyadic amalgams.”

## R06 (P3) — Description: the supplier sentence names two roadmaps the README never cites and omits two it consumes

**Location:** description: “Section-level suppliers: NoncommutativeAndEquivariantIwasawa (§F.6, the period-boundary and exponential prefix imported in R07.P3), ReductiveGroupsPartII, … DerivedModuleAlgebra, LocalPurity and PurityOfBranchLocus (§§2.1–2.2).”

**Claim:** these are the roadmap's suppliers; the R07.3 and R07.4 bullets list “Filtered `(φ, N)`-modules, weak admissibility” and “Kedlaya's slope filtration” as layer content.

**Witness:** `ReductiveGroupsPartII` and `LocalPurity` occur `0` times in the README. PadicLocalLanglandsForGL2Qp has its own contract subsection (`README.md:84–86`, `:138`: §0.2 owns the filtered modules, §0.3, §§2.7–2.8); SmoothRepresentationsOfLocalGroups Layer SR.2 at `:209`; `README.md:189–191`: §§R07.4.4, R07.4.7, R07.4.8 restate §F.6 stages 1–2.

**Repair:** drop ReductiveGroupsPartII and LocalPurity; write “NoncommutativeAndEquivariantIwasawa (§F.6: the period sequences and exponential imported in R07.P3; stages 1–2, the Robba carriers and Kedlaya's slope theory, restated at the Kummer frame in R07.4.4, R07.4.7, R07.4.8)”; add “PadicLocalLanglandsForGL2Qp (§0.2 filtered `(φ, N)`-modules, weak admissibility and labelled Sen operators; §0.3; §§2.7–2.8), SmoothRepresentationsOfLocalGroups (Layer SR.2)”.

## R07 (P3) — Description: the Lean file has no tests and no negative control

**Location:** description: “The Lean prototypes are real-bodied and are tested against Tau Ceti's constant and diagonalizable group schemes (`ℤ/N`, `μ_N`) and against Mathlib's Witt vectors. A negative control over `ℤ_2` shows that Raynaud's bound `e < p − 1` cannot be dropped.”

**Claim:** `Suggested.lean` contains tests on those carriers and a `ℤ_2` control.

**Witness:** `Suggested.lean` at this head: 27 declarations, 7 sorried headline theorems, `0` `example`s; the constant and diagonalizable groups occur only in the statement of `globalPrimeOrderClassification`. The `ℤ_2` control is a README Check (`README.md:1966`, `:2317`).

**Repair:** “`Suggested.lean` states seven headline theorems with `sorry` on Tau Ceti's finite locally free group schemes and Mathlib's Witt vectors, with real-bodied definitions only. A README Check over `ℤ_2` (§§R07.1.30–R07.1.31: `ℤ/2` and `μ_2` are two models of one generic group) shows that Raynaud's bound `e < p − 1` cannot be dropped.”

## R08 (P3) — Description summary: “the existing `BarsottiTate` carrier” is a supplier's, not a pinned one

**Location:** description, summary block: “finite groups are objects of Tau Ceti's `FiniteLocallyFreeCommAffineGroupSchemeCat` and p-divisible groups use the existing `BarsottiTate` carrier.”

**Claim:** a `BarsottiTate` carrier exists beside the Tau Ceti one.

**Witness:** `grep -rl BarsottiTate` over the pinned Mathlib and Tau Ceti: `0` files; `README.md:151`: “AbelianSchemesAndArithmeticModuli §A4.5 owns the carrier `BarsottiTate S p h`”; the docstring of `Suggested.lean` lists the carrier as absent from the pins.

**Repair:** “… and p-divisible groups use the `BarsottiTate` carrier of AbelianSchemesAndArithmeticModuli §A4.5.”

## Previous findings

- R01 — partly repaired: `README.md:467` “`tateSen_H0` and `tateSen_H1`” and `:516`, `:7779` “§1.4, *Residual descent*” resolve at the suppliers' heads; `:2876` “exponent-one vanishing theorem (§§2.3–3.1)” does not (R03).
- R02 — not repaired: `README.md:638` “- `frobeniusHom`: `F_G : G ⟶ G^{(p)}`, a homomorphism of group schemes.” and 191 further labelled API bullets; `:320` still lists `SerreWeights` (R04).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| R07.G5 cyclotomic class-group obstruction (`README.md:2862–2879`; sampled target, changed passage) | `ℓ = 5`, `j = 1, 3`; `ℓ = 3`; index convention against the supplier | `ω(2) ≡ 7 mod 25`: `Σ aω(a)⁻¹ = −3 + ω(2) ≡ 4 ≡ −1 mod 5`, so `5L₁` is a unit and `Y^(1) = 0`; `Σ aω(a)⁻³ = −3 − ω(2) ≡ −10 mod 25`, `L₃ ≡ −2 mod 5`, a unit, and `B_{5−3} = B₂ = 1/6` is a unit: `Y^(3) = Y^(−1) = 0`. `ℓ = 3`: no odd `1 < j < 2`; `Y^(−1) = Y^(1) = 0`. Supplier: `B_{1,ω^{−i}}` kills `A^(i)`, `A^(1−k) ≠ 0 ⇒ p ∣ B_k`; here `k ≡ ℓ − j`: same convention | pass; names: R03 |
| `flFiniteFlatDictionary` (`Suggested.lean:256`) | `μ_p`, `ℤ/p`, trivial group over `W(k)`; elaboration of the repair | lengths `1, 1, 0` against `n = 1, 1, 0` | R01 |
| `finiteFlatClassification` (`Suggested.lean:313`) | `μ_p`, `ℤ/p`, `ℤ/p²`; elaboration of the repair | lengths of `𝔐/u𝔐`: `1, 1, 2` against `n = 1, 1, 2` | R02 |
| PadicPeriodRings contract (`README.md:464–467`) | `i = 0`, `i ≠ 0` | supplier (its lines 369–370): `tateSen_H0`: `C(i)^{G_K} = K` at `i = 0`, `0` otherwise; `tateSen_H1`: `0` for `i ≠ 0`, `K·[log χ]` at `i = 0`; the other six names of the sentence occur at its lines 106–375 | pass |
| Residual descent (`README.md:516`, `:7779`) | trivial `ρ`, `n = 1` | supplier §1.4 (its line 1107): finite image, `k` generated by the entries is finite, `V = V_k ⊗ 𝔽̄_p`; trivial `ρ` gives `k = 𝔽_p`; §R07.5.6a chooses a finite `k/𝔽_p` and `V_k`: same statement | pass |

The rows for untouched statements stand as in the previous review, of `b4c015e`.

- Gate, run on this head: `statement-hygiene=2`, every other scanner `0`, `FAIL` (R01, R02).
- Dependency check: `depcheck: 245 roadmaps, 2221 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`: seven `declaration uses sorry` warnings (lines 94, 103, 113, 170, 256, 313, 336), nothing else. A scratch copy with the two repairs of R01–R02 and `#check @` of both elaborates the same way. The one lead of `signatures.md` (`BreuilKisin.frob` without `[CharP k p] [PerfectRing k p]`) is no defect: the Witt Frobenius and `PowerSeries.expand` need neither.
- Source locators checked against the text: 2 sources, 7 locators. `sharifi-iwasawa` lines 3591 (Lemma 4.5.2, p. 114), 3648 and 3664 (Lemmas 4.5.4–4.5.5, p. 115), 3691 (Theorem 4.5.6, p. 116), 3748–3764 (Theorem 4.5.7, pp. 117–118: `−pB_{1,ω⁻¹} ≡ 1 mod p`); `mazur1977` lines 1028–1030 (Proposition 2.8, p. 53), 1031–1056 (Corollaries 2.9–2.10, pp. 53–54). The other fourteen targets of the seeded sample lie outside the changed passages and were not read again.
- Cross-roadmap citations resolved at the open heads: PadicPeriodRings (8 names), ArithmeticGaloisRepresentations §1.4, CyclotomicClassGroupsAndStickelberger (6 names, 4 unresolved: R03).
- Changes outside the folder: none (`git diff --stat origin/main...HEAD` outside it is empty). Title: agrees with the head.
- Overlap check: read PadicHodgeTheory, LocalGaloisDeformationRings, EllipticCurveModularityWild3Adic (open; each cites this roadmap as supplier, 29, 45 and 28 times) and `overlaps.md` (no shared roadmap, dropped id or second copy); nothing shared.
- Source independence: changed passages only: 4 changed passages (supplier names and sections, no source prose) and the R07.G5 statement compared with 2 sources, none shared; largest share of the locators by author mention is Kisin (2006–2009), about 130 of 370; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The items of the previous review's `## Not verifiable` stand (Kisin 2006–2009b, Serre 1987, Berthelot–Breen–Messing 1982 and the others listed there); none is cited in a changed passage.

## Source issues

- none

## For the human reviewers

- **Not tested.** Kisin 2006, 2008, 2009, 2009b carry the largest share of the locators and were uncertified at `b4c015e` (the author's page serves `.dvi`); wording and arrangement were not compared against them in this round either.
