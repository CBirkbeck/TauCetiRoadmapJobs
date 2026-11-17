# Review of SemiringSchemes (pull request #2466 at 851ac89)

**Verdict:** needs changes

## R01 (P2) — Sorry'd instances and sorry'd structure fields in `Suggested.lean` (gate: `sorry-data`, 5)

**Location** `TauCetiRoadmap/SemiringSchemes/Suggested.lean` lines 28, 31, 34 (`instance : HasColimits CommSemiRingCat.{u} := by sorry`, and the two `SemimoduleCat` instances), 50–54 (`Ideal.toRingCon`: `iseqv := sorry`, `add' := sorry`, `mul' := sorry`), 57–61 (`RingCon.zeroIdeal`).

**Claim** The file may hold no `instance` or `def` whose body contains `sorry`; every later declaration mentions the two definitions.

**Witness** Gate at 851ac89: `sorry-data=5`. A copy with the three instances deleted and the two bodies below elaborates with `sorry` warnings on the nine theorems only; no later statement uses the instances.

**Repair** Delete the three instances (the README keeps §0.1 and §0.2 as targets). Replace the bodies by `def Ideal.toRingCon (I : Ideal R) : RingCon R := ringConGen (fun a b ↦ a ∈ I ∧ b = 0)` and `def RingCon.zeroIdeal (c : RingCon R) : Ideal R := RingHom.ker (c.mk' : R →+* c.Quotient)`; the Bourne formula `∃ i ∈ I, ∃ j ∈ I, a + i = b + j` stays a README API bullet.

## R02 (P2) — The headline equality of topologies is statable at the pins and absent

**Location** `Suggested.lean` lines 9–10: "It states … the headline comparison of Zariski topologies." README §3.3: "**Corollary** (`zariskiTopologyTV_eq_principal`). `zariskiTopologyTV = zariskiTopologyPrincipal`."

**Claim** The file states only `RingHom.IsZariskiOpen.exists_away_cover`; the Summary's first end theorem, the equality of the two Grothendieck topologies on `CommSemiRingCat.{u}ᵒᵖ`, is not stated although `Precoverage` and `Precoverage.toGrothendieck` exist at the pin.

**Witness** A scratch file with three real definitions and `theorem zariskiTopologyTV_eq_principal : zariskiPrecoverageTV.toGrothendieck = zariskiPrecoveragePrincipal.toGrothendieck := sorry` elaborates (one `sorry` warning). On `A = 0` both sides make the empty presieve covering.

**Repair** Add, with real bodies: `Module.LimitFaithfullyFlat (A M : Type u) : Prop := Module.LimitFlat A M ∧ ∀ (N P : Type u) … (φ : N →ₗ[A] P), Function.Bijective (φ.lTensor M) → Function.Bijective φ`; `zariskiPrecoverageTV` (presieves `Presieve.ofArrows` of a `Type u`-indexed family of `IsZariskiOpen` maps `X.unop ⟶ B i` with a `Finset` subfamily whose product, an algebra through `RingHom.pi`, is `LimitFaithfullyFlat`); `zariskiPrecoveragePrincipal` (presieves of `algebraMap X.unop (Localization.Away (g i))`, `g : Fin n → X.unop`, `Ideal.span (Set.range g) = ⊤`); then the theorem above. Correct the module docstring accordingly.

## R03 (P2) — §2.3, conservativity of a finite family does not give faithful flatness

**Location** README line 522: "For a finite family of `R`-algebras `Sᵢ`, the product of the base-change functors is conservative if and only if `∏ Sᵢ` is faithfully flat".

**Claim** The left side does not imply flatness of the `Sᵢ`; the equivalence needs every `Sᵢ` flat.

**Witness** `R = ℤ`, `S₁ = ℤ`, `S₂ = ℤ/2`: base change to `S₁` is the identity, so the product functor is conservative; `ℤ × ℤ/2` is not flat over `ℤ` (`ℤ/2` has torsion), hence not faithfully flat.

**Repair** "For a finite family of flat `R`-algebras `Sᵢ`, the product of the base-change functors is conservative if and only if `∏ Sᵢ` is faithfully flat (Borger–Jun, Proposition 2.1, for modules over a finite product)." Add the instance above as a negative-control Check. This is also the form §3.2 uses (Toën–Vaquié, Definition 2.10(1)(a)–(b)).

## R04 (P2) — §4.1, `OpenImmersionSite.HasDescent` has no stated fields, and the source proof uses a third input

**Location** README lines 655–657: "except Lemma 2.14, whose proof uses descent of `P`-morphisms and finite presentation; state it with those two properties as fields of a refinement `OpenImmersionSite.HasDescent`."

**Claim** For a general `(C, J, P)` neither "descent of `P`-morphisms" nor "finite presentation" is defined, so the structure does not determine its object; Toën–Vaquié's proof of Lemma 2.14 also uses quasi-compactness of affines.

**Witness** TV05 line 732 (finite subcover, because the source is affine), line 767 (finite presentation of the pieces), line 775 (Corollary 2.11(2)): three inputs, none a property of an abstract `(C, J, P)` as listed in §4.1.

**Repair** State one field, which is what the converse of Lemma 2.14 proves and what §4.1 consumes: "`HasDescent`: if `g : Z ⟶ Y` is a monomorphism of `C` and some `J`-covering family `{Zᵢ ⟶ Z}` of `P`-morphisms has every composite `Zᵢ ⟶ Y` in `P`, then `P g`." Then: "For `Aff` this is proved from finite subcovers of affines (§3.2), finite presentation (§0.4) and descent (§2.4), as in Toën–Vaquié's proof of Lemma 2.14." The same wording replaces "under `HasDescent`" at line 650 and lines 932–934.

## R05 (P2) — The generic layer is handed in both directions between this roadmap and FunctorOfPoints

**Location** README lines 916–917: "The FunctorOfPoints roadmap can reuse §4.1 for its ring case; it supplies §5.4's equivalence."

**Claim** FunctorOfPoints is a supplier (§5.3, §5.4); listing it as a consumer of §4.1 is a cycle, and both texts claim the generic layer.

**Witness** FunctorOfPoints (pull request #2465) `README.md` line 87: "The generic layer of this roadmap (a site with a class of open subfunctors and a locally representable full subcategory) is instantiated for commutative semirings"; this README line 52: "**This roadmap owns it**".

**Repair** Delete the sentence at lines 916–917. In `## Scope and ownership` add: "FunctorOfPoints states its open subfunctors and locally representable functors on `(CommAlgCat R)ᵒᵖ` only (its §1.2, §2.1) and does not consume §4.1; `OpenImmersionSite` has this roadmap as its single owner." FunctorOfPoints line 87 is to be reworded in that pull request ("the semiring analogue of Layers 0–2").

## R06 (P2) — §4.3, non-affineness of `𝔸²_A \ {0}` fails for the zero semiring

**Location** README line 675: "The open subscheme `𝔸²_A \ {0}` and its non-affineness (global sections `A[x, y]`)."

**Claim** The statement is quantified over every semiring `A` (line 669) and is false for `A = 0`.

**Witness** `A = 0`: `A[x, y] = 0`, `𝔸²_A` and the open subscheme are both the empty scheme `Spec 0`, which is affine. For `A ≠ 0` the `A`-point `(0, 0)` separates them.

**Repair** "For a nontrivial semiring `A`, the open subscheme `𝔸²_A \ {0}` is not affine: its global sections are `A[x, y]`, and the `A`-point `(0, 0)` of `𝔸²_A` does not lie in it." Add `A = 0` as a Check. The same hypothesis is needed in §4.1 line 648 only as stated there ("over a field"), which is correct.

## R07 (P3) — Backticked names of this roadmap's own that `Suggested.lean` does not declare (gate: `readme-ids-missing`, 9)

**Location** README lines 268, 292, 338, 351, 512: `CommSemiRingCat.regularEpi_iff_surjective`, `Algebra.congrFinitePresentation_iff_isFinitelyPresentable`, `RingCon.zeroIdeal_mono`, `Ideal.toRingCon_sup`, `Ideal.toRingCon_iSup`, `RingCon.isSubtractive_zeroIdeal`, `Module.limitFaithfullyFlat_iff_surjective_comap`.

**Claim** A backticked name of the roadmap's own is a claim that `Suggested.lean` declares it; these seven are not declared.

**Witness** Gate at 851ac89: `readme-ids-missing=9`. The other two, `Algebra.isEpi_iff_forall_one_tmul_eq` (README line 142) and `PrimeSpectrum.isClosedEmbedding_comap_of_surjective` (line 394), are Mathlib declarations (`Mathlib/Algebra/Algebra/Epi.lean` line 31; `#check` succeeds): I read those two lines as false positives.

**Repair** State each of the seven facts in prose without the name, for example line 268: "A morphism of `CommSemiRingCat` is a regular epimorphism if and only if it is surjective; …". The same applies to the further undeclared names the gate does not list (`Ideal.toRingCon_eq_ringConGen`, `RingHom.ker_eq_zeroIdeal`, `RingCon.zeroIdeal_toRingCon`, `limitFaithfullyFlat_pi_away_iff`, `Module.LimitFaithfullyFlat.comonadic`, and those of Layers 4–6).

## R08 (P3) — Process residue in the README (gate: `residue`, 2)

**Location** README line 117: "see the TODO pointing to https://github.com/leanprover-community/mathlib4/issues/28826"; line 150: "records the TODO \"to introduce the genuine flatness over semirings …\"".

**Claim** `TODO` is refused by the gate, and line 117 cites an issue number of another repository.

**Witness** Gate at 851ac89: `residue=2`, lines 117 and 150.

**Repair** Line 117: "hom-sets carry `AddCommMonoid`; Mathlib's `Preadditive` needs additive groups and does not apply". Lines 149–152: "The module docstring says that `Module.Flat` is mono-flatness over a semiring and that the finite-limit notion is not yet defined there."

## R09 (P3) — Form of `Suggested.lean`

**Location** `Suggested.lean` lines 1–14 (`module`, `public import Mathlib`, `public section`), 5–12 (module docstring), 26, 47, 73, 97 (`/-! ## Layer 0 -/` …), and the declarations at lines 37, 41, 63, 66, 69, 75, 88, 91, 94, 99.

**Claim** The import is the single line `import Mathlib`; the module docstring says that README.md is the roadmap and names each headline that is not statable with the carrier it lacks; layer comments carry the README titles; every declaration has a docstring.

**Witness** Ten declarations have no docstring; the docstring names no headline of Layers 4–6; the same file with plain `import Mathlib` and without `module` and `public section` elaborates identically.

**Repair** Use `import Mathlib` alone. Docstring: "…: target signatures. The roadmap is README.md; this file is not the roadmap. Not statable at the pins: closed subschemes of `Spec A` ↔ `RingCon A` (§4.5), fibre products and gluing (§4.2), the adjunction with ring schemes (§5.3–5.4) and the comparison of §6.4, each for lack of the scheme category of §4.1 or of `LocallySemiringedSpace`." Title the layer comments as in the README and add a docstring stating the mathematics to each of the ten declarations.

## R10 (P3) — README code blocks and `Suggested.lean` disagree

**Location** README lines 283–287 (`Algebra.CongrFinitePresentation (R A : Type*)`), 550–551 (`f.LimitFlat ∧ … ∧ f.CongrFinitePresentation`), 473–477 ("in every universe `v` of test modules").

**Claim** The Lean file has `(A B : Type u)` (one universe), a body through `Module.LimitFlat A B` and `Algebra.CongrFinitePresentation A B`, and `limitFlat_iff_preservesFiniteLimits` for `M : Type u` on `SemimoduleCat.{u} R` only.

**Witness** Elaborated types: `Algebra.CongrFinitePresentation : (A B : Type u_1) → …`; `limitFlat_iff_preservesFiniteLimits : ∀ {R : Type u_1} … (M : Type u_1) …`; `RingHom.LimitFlat` and `RingHom.CongrFinitePresentation` are declared nowhere.

**Repair** Copy the three Lean signatures into the README blocks as they stand in `Suggested.lean`, and say in §2.1: "The Lean statement takes `M` and the test modules in the universe of `R`, where `SemimoduleCat.{u} R` is monoidal; the statement for test modules in another universe is a further target."

## R11 (P3) — §2.3, `Module.LimitFaithfullyFlat` does not fix the universe of its test maps

**Location** README lines 507–508: "a linear map `φ` is bijective whenever `M ⊗ φ` is".

**Claim** §2.1 defines flatness by the equational criterion in order to avoid a universe quantification; the faithfulness clause reintroduces one without saying where `φ` lives.

**Witness** Mathlib's `Module.Flat` (`Mathlib/RingTheory/Flat/Basic.lean` line 115) has to write `⦃P : Type u⦄` for the same reason; a `Prop`-valued definition cannot quantify over all universes.

**Repair** "… for linear maps `φ` between `R`-modules in `Type u` (the universe of `R`). Prove that the condition for test modules in any universe `v` is equivalent to it; for an algebra this follows from the criterion `LimitFlat ∧ Function.Surjective (PrimeSpectrum.comap …)` below, which is universe-free."

## R12 (P3) — Checks, Examples and `*Needs:*` lines are missing for most definitions and layers

**Location** README §0.4 (`Algebra.CongrFinitePresentation`), §1.1, §1.4 (`RingCon.IsSaturated`), §1.5 (`RingCon.localization`), §2.1, §2.3, §3.1–§3.2, §4.1, §4.2, §4.5, §6.1, §6.2, §6.5; Layers 0, 2, 3, 4, 5, 6; §1.1–§1.4 and every subsection of Layers 2–6.

**Claim** Each definition carries at least three discriminating Checks; each layer ends with `### Examples` and `### Dependencies`; each target has its own `*Needs:*` line.

**Witness** `**Checks.**` occurs in §0.1, §0.3, §1.2, §1.4, §2.2, §4.3, §5.1 only; `### Examples` in Layer 1 only; `*Needs:*` in §0.1–§0.4 and §1.5 only.

**Repair** Add the Checks, taking the values already computed in the text as a start: §0.4 `ℤ` over `ℕ` (`ℕ[y] ⧸ (1 + y ~ 0)`), `𝔹` over `ℕ`, a non-example; §1.5 `c = (1 ~ 2)` on `ℕ` localized at `2`; §2.1 `ℤ` over `ℕ` fails on `1·1 + 1·(−1) = 0` (forces `a = 0`), `M = 0` with `n = 0`, `M = R` with `n = 1`; §2.3 `ℕ[1/2] × ℕ[1/3]` over `ℕ` is not faithfully flat (`ℕ \ {1}` is not in the image) although `ℤ[1/2] × ℤ[1/3]` over `ℤ` is; §3.2 `A = 0` with the empty cover on both sides. Move the Pitfalls that are computed examples under `### Examples`, and add a `*Needs:*` line to each subsection.

## R13 (P3) — Locators: missing, misplaced, or not supported by the source

**Location** README line 178 ("`Subfunctor.sheafify` and `Subfunctor.range` (`Mathlib/CategoryTheory/Sites/Subsheaf.lean`)"); line 534 ("the presheaf `A ↦ Under A` is a stack (Toën–Vaquié, Corollary 2.11(2))"); line 692 ("This is Toën–Vaquié's notion of regular monomorphism made local"); lines 869, 962–965; §0.1–§0.3, §1.1, §1.5, §4.4, §5.1 (first three bullets), §6.1–§6.3.

**Claim** `Subfunctor.range` is in another file; Corollary 2.11(2) is about modules only; the source has no notion of regular monomorphism; Golan and Demazure–Gabriel are cited without a number; the listed sections carry no locator.

**Witness** `Mathlib/CategoryTheory/Subfunctor/Image.lean` line 35 (`def range`); TV05 lines 669–671 (the stack `A ↦ A-Mod`); TV05 has no occurrence of "régulier"; BJ24 lines 330–337 state the limits and colimits of `Mod(R)` and `CAlg(R)`.

**Repair** Line 178: cite `Subfunctor.range` from `Mathlib/CategoryTheory/Subfunctor/Image.lean`. Line 534: "… (Toën–Vaquié, Corollary 2.11(2)); the same for `A ↦ Under A` (Borger–Jun, Propositions 4.9 and 4.10, Remark 6.4)". Line 692: delete the sentence. §0.1–§0.2: cite Borger–Jun §2. Give section and page for Golan (§1.1–§1.2) and the numbered statement of Demazure–Gabriel I §1 used in §6.4, and a locator or "proved here" for §1.5, §4.4 and §6.1–§6.3.

## R14 (P3) — Shape and process narrative

**Location** README lines 189–196 (`### Matching-family prerequisite` under `## Exact supplier contracts`), 244–245 and 258 ("§0.2's matching-family submodule", "*Needs:* §0.2's matching-family construction" inside §0.2), 596–598, 646–653, 883, 919–937 (`## Shared interfaces and scope boundaries`), 965 ("followed in §6.4").

**Claim** A construction of this roadmap is not a supplier contract and §0.2 cannot need itself; instructions to a writer ("its proof must be checked in full rather than taken from the cited sources", "Do not impose …", "not an assumed supplier from a different Tau Ceti revision") are process narrative; ownership is stated once, in `## Scope and ownership`.

**Witness** Line 196: "This construction is part of §0.2, not an assumed supplier from a different Tau Ceti revision."; line 258 cites §0.2 from §0.2; lines 921–925 repeat lines 49–57.

**Repair** Move lines 191–194 into §0.2 as its first paragraph ("Define the matching families of a diagram `F` as the submodule of `∀ j, F.obj j` cut out by `F.map f (x i) = x j` …") and delete the subsection and both self-references. Line 596–598: "Borger–Jun (Remark 5.2) leave the equality open; the theorem above settles it." Rewrite lines 646–653 as statements ("An open immersion of sheaves need not be relatively representable by affines: …"). Fold lines 921–937 into `## Scope and ownership` and `## Conventions` and delete the section. Line 965: "the functor-of-points comparison for rings".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 Checks | pushout of `ℕ → ℤ`, `ℕ → 𝔹`; coequalizer of `x ↦ 1, 2` | `1⊗1 = 1⊗1 + 1⊗1` with an inverse gives `0`; classes of `1 ~ 2` on `ℕ` are `{0}`, `{≥1}` = `𝔹` | holds | none |
| §0.2 limits, colimits, pitfall | `ℕ → ℤ` in `ℕ`-modules | a map out of `ℤ` is fixed by the image of `1`, an additive unit: epi, not surjective; BJ24 lines 330–337 | holds | locator (R13) |
| §0.3 `epi_iff_isEpi`, Checks | `ℕ → ℤ`, `ℕ → ℚ≥0`, `ℕ[x] → ℕ[x,y]⧸(x+y~0)` | additive and multiplicative inverses are unique, so each map is epi; none surjective | holds | R07 |
| §0.4 `CongrFinitePresentation`; pitfall | `ℤ` over `ℕ`; zero-sum-free domain `A` | `ℕ[y]⧸(1+y~0) = ℤ`; nonzero `ℕ`-polynomial in nonzero values is nonzero, zero class `⊥`; TV05 line 619, BJ24 lines 738–800 | holds | R10, R12 |
| §1.1 `Ideal.gc_toRingCon` | `I = ℕ \ {1}`, `c = (1 ~ 2)`, `c = ⊤` | `I.toRingCon = ⊤` (`1 + 2 = 0 + 3`), closure `ℕ`; zero class of `1 ~ 2` is `⊥`; both sides of the connection agree | holds | R01 |
| §1.3 `toRingCon_zeroIdeal_of_isAddUnit` | `c = ⊤`; `ℕ → ℤ/n`; ring case | `⊤.zeroIdeal.toRingCon = ⊤`; `a + (b+e) = b + (a+e)` with `a+e, b+e` in the zero class; GG13 lines 353–362 | holds | none |
| §1.4 `range_comap_mk'` | `c = ⊥`, `c = ⊤`, `𝔹[x] → 𝔹`, `ℕ \ {1}` | all primes; none (`0 ∈ p`, `1 ∉ p`); `{⊥}` with `(x)` prime, so not closed; `zeroLocus = {I}`, quotient `0` | holds | none |
| §1.5 localized congruence | common denominators; `M`-saturated `c` | transitivity through `t m' a ~ t m b' ~ t m c'`; `ker` commutes via `(na, nb) ∈ ker f`; restriction of extension is `c` when saturated | holds | R12, R13 |
| §2.1 `Module.LimitFlat` vs BJ24 Corollary 3.6 | `M = 0`, `M = R`, `ℤ` over `ℕ` | `n = 0`; `n = 1`, `a = x`; relation `1 + (−1) = 0` forces `a₁ⱼ + a₂ⱼ = 0`, so `a = 0`: not flat | holds | R12 |
| §2.2 `limitFlat_iff_flat`, `LimitFlat.flat`, `IsLocalization.limitFlat`, Checks | ring case; `ℕ → ℕ ∪ {∞}` tensored with `ℤ`; `0 ∈ M` | relation `∑ (rᵢ − sᵢ) xᵢ = 0` both ways; `ℤ → 0` not injective; `S = 0` flat; BJ24 lines 382–392, 235 | holds | none |
| §2.3 criterion and going-down | `ℕ[1/2] × ℕ[1/3]` over `ℕ` | `span{2,3} = ℕ \ {1} ≠ ⊤`, the maximal ideal is not in the image, not faithfully flat: BJ24 Prop. 5.1 and DiklichZelich2026 lines 744–817 agree | holds | R11 |
| §2.3 last bullet | `ℤ`, `ℤ`, `ℤ/2` | product functor conservative; `ℤ × ℤ/2` not flat | false as stated | R03 |
| §3.1 `IsZariskiOpen`, pitfall | `ℕ → ℤ`; `R₁ × R₂ → R₁`; identity | epi and finitely presented, not flat; localization at `(1,0)`; all three conditions hold | holds | R10 |
| §3.2 the two precoverages | `A = 0`, empty family | Toën–Vaquié: empty product conservative iff `A = 0`; principal: `span ∅ = ⊤` iff `A = 0`; TV05 lines 628–646 | consistent | R12 |
| §3.3 `exists_away_cover` | `B = 0`, `f = id`, rings | `n = 0` with `⊥ = ⊤`; `g = 1`; open immersion of affines; proof read at DiklichZelich2026 lines 819–840 | holds; no one-tactic proof | none |
| §3.3 Corollary | a cover with finite faithfully flat subfamily | images `⋃ D(g_ik)` cover `PrimeSpectrum A`, so the `g_ik` span `⊤` and each `A[1/g_ik]` factors through `Aᵢ` | holds | R02 |
| §4.1 generic layer | `P` = isomorphisms; TV05 Lemma 2.14 | open subfunctors are `∅` and `X`; proof uses lines 732, 767, 775 | `HasDescent` undetermined | R04 |
| §4.3 `𝔸²_A \ {0}` | `A = 0`, `A ≠ 0` | empty scheme, affine; sections `A[x,y]`, point `(0,0)` missing | false at `A = 0` | R06 |
| §4.4 affine morphisms | identity, `Spec B → Spec A` | pullbacks along `Spec A' → Spec A` are `Spec (A' ⊗ B)` | holds | R13 |
| §4.5 `closedSubschemeOrderIso` | `c = ⊥`, `c = ⊤`, base change | identity; empty subscheme; `A' ⊗ A⧸c = A'⧸⟨c⟩`; larger `c`, smaller subscheme (order dual) | holds | R13 |
| §5.1–§5.2 group completion | `𝔹`, `ℚ≥0`, a non-ring `A` | `0`; `ℚ`; `A⧸(invertibles)` is nonzero and zero-sum-free, so `𝔹 ⊗ A ≠ 0`; TV05 lines 1150–1160 | holds | none |
| §5.3 direction of the adjunction | `Hom(i Y, X)` | equals `Hom_ℤ(Y, X × Spec ℤ)`: inclusion is the left adjoint, fully faithful; TV05 lines 1163–1165 | holds | none |
| §6.1 local semirings | `a + b = u` with `a, b` non-units | `a/u + b/u = 1` contradicts `IsLocalRing`; `ℝ≥0 → 𝔹` | holds | R12, R13 |
| §6.4 comparison theorem | rings; literature | reduces to the classical theorem; GG13 lines 447–450 and BJ24 lines 734–736 assert it without proof | not refuted; proof is the target | R13 |
| §6.5 congruence sheaves | `Spec A`, `c` and its localizations | `J(D(f)) = c.localization`; GG13 lines 530–543 | holds | none |

- Source locators checked against the text: 56, in TV05, BJ24, DiklichZelich2026, GG13, Mar07; all the sampled targets' locators are confirmed except those listed in R13.
- Library declarations opened at the pin: over 50 (among them `Mathlib/RingTheory/Flat/Basic.lean` lines 33–35 and 115, `Mathlib/RingTheory/Flat/Localization.lean` line 37, `Mathlib/Algebra/Category/Ring/Basic.lean` line 668, `Mathlib/RingTheory/Ideal/Maps.lean` line 750, `Mathlib/RingTheory/Spectrum/Prime/Topology.lean` lines 407–440); no `HasColimits CommSemiRingCat`, no limits of `SemimoduleCat`, no Bourne congruence or subtractive ideals in Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: 7, all in FunctorOfPoints at its open head (§0.1, §1.2, §2.1, §2.4 and the six names); none missing.
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at 851ac89: FAIL (`sorry-data=5`, `residue=2`, `readme-ids-missing=9`); every other check 0, build passes.
- Elaboration: `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else; `#check @name` types compared with the README (differences in R10); one-tactic probe (`simp`, `infer_instance`, `exact?`) closes none of the nine theorems.
- Overlap check: read FunctorOfPoints, CommRingFactorizationSystems; the generic open-immersion-site layer is shared in wording with FunctorOfPoints, owner SemiringSchemes §4.1 (R05); the comparison with Mathlib's `Scheme` is owned by FunctorOfPoints §2.4; nothing shared with CommRingFactorizationSystems.
- Source independence: 9 passages compared with 5 sources, none shared; largest share BJ24, 26 of 67 citations (TV05 25); contents compared with BJ24 and TV05: independent (Layers 2–5 follow the order flatness, topology, schemes, base change that their dependencies force; Layers 0, 1, 6 and §3.3, §4.5 have no counterpart).

Research link: Layers 2–4 instantiate the relative schemes of Toën–Vaquié (2009) for commutative monoids; §3.3 answers the question left open by Borger–Jun (2024, Remark 5.2) through Diklich-Zelich (2026, Theorem 1.3.10) and Marty (2007); §4.5 and §6.5 are the closed subschemes of Giansiracusa–Giansiracusa (2016). Rests on the README and the sources read.

## Not verifiable

- Demazure–Gabriel, *Groupes algébriques I*, Chapitre I §1 (README §6.4): text not read; no numbered locator is given to check.
- Golan, *Semirings and their Applications* (README References, §1.1–§1.2): text not read; cited without section or page.
- Katsov, *On flat semimodules over semirings* (README §2.1): paywalled; the attribution was checked only through BJ24 line 396.
- Ownership against the board's packages: the index lists two packages, neither on this subject; their texts were not read.

## Source issues

- **Misprint** in DiklichZelich2026 at Definition 1.3.3, printed page 21: the source says a faithful algebra is one for which a map is an isomorphism exactly when its base change is injective; it should be exactly when its base change is an isomorphism; affects nothing.
- **Misprint** in DiklichZelich2026 at the paragraph after Theorem 0.0.2, abstract: the source says the result was obtained independently by Florian Murty; it should be Florian Marty, the author of its reference [1]; affects nothing.
- **Misprint** in DiklichZelich2026 at Proposition 1.3.6, printed page 24: the source says to take any ideal `p` of `A` in the last step; it should be any prime ideal, since `A_p` is formed; affects nothing.
- **Gap** in DiklichZelich2026 at Claim 1.3.7, printed pages 23–24: the source says faithful flatness makes a map surjective once its base change is; it should factor through the image and use that base change preserves injections, since faithfulness is defined for isomorphisms; affects the proof.

## For the human reviewers

- Scope: the headline of §3.3 rests on DiklichZelich2026, a 2026 doctoral thesis read from its author's page, and on the preprints BJ24 and Mar07; BJ24 Remark 5.2 records the statement as open. Only TV05 and GG13 are journal articles.
- Licence: DiklichZelich2026 carries "© 2026 … All rights reserved" (line 14) and was fetched from the author's university page, which I classed as an author page.
- Licence: the pull request description says the folder was adapted by an AI tool from a "supplied draft" kept in another repository and pull request; that draft was not available to compare.
- The description ends "Draft for James Borger's reading and discussion. Do not mark ready or merge without his approval."
- Not tested: Demazure–Gabriel, Golan and Katsov were not read; none has a large share of the locators.
