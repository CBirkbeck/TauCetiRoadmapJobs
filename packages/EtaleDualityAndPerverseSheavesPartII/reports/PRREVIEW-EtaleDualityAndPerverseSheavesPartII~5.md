# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at ffdd816)

**Verdict:** needs changes

Incremental re-review of the 67 lines changed since d6c3ae4: the new pinned structure of §6.2, the regular term of §6.3, the construction-as-data paragraph of §6.6, the new EtaleCohomologyFoundations contract paragraph, the scope and Dependencies additions, the §0.8 wording repair and the Lean module header. One blocking finding: the new Layer 6 text consumes, by name, declarations and conventions of EtaleCohomologyFoundations that exist only in that roadmap's open revision pull request and not on main. The gate fails on two `letI` hygiene hits (P3). Two further P3 findings on justifying clauses.

## R01 (P3) — `letI` in the signatures of two theorems (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean:74` and `:99`: "(letI := f.toAlgebra Module.Finite (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A ∧ …" inside the conclusions of `cohenGabber_equalCharacteristic` and `cohenGabber_equivariant`.

**Claim:** The worker's gate reports `statement-hygiene=2`: a `letI` in the signature of each theorem; the gate fails on this head.

**Witness:** `scratch/gate.md` at ffdd816: "line 74: P3 `letI` in the signature of theorem `cohenGabber_equalCharacteristic`; line 99: P3 `letI` in the signature of theorem `cohenGabber_equivariant`". The text of both theorems is unchanged since 047baea; the rule is applied by the gate at this head.

**Exact repair:** Quantify the algebra structure instead of the ring map and let the conjuncts use it as an instance:

```lean
    ∃ _ : Algebra (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A,
      Function.Injective (algebraMap (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A) ∧
      (IsLocalRing.residue A).comp
        (algebraMap (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A) =
        MvPowerSeries.constantCoeff ∧
      Module.Finite (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A ∧
      Module.IsTorsionFree (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) A ∧
      Algebra.Etale (FractionRing (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)))
        (FractionRing (MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)) ⊗[
          MvPowerSeries (Fin d) (IsLocalRing.ResidueField A)] A)
```

and in `cohenGabber_equivariant` the same with the equivariance conjunct written with `algebraMap … A` in place of `f`. Tested: a scratch copy of both theorems in this form elaborates at the pins with `sorry` as the only warning (exit 0). The elaborated types are the ones of `scratch/signatures.md` with the local instance replaced by the bound one; no hypothesis is lost.

## R02 (P2) — Layer 6 consumes EtaleCohomologyFoundations declarations that exist only in its revision pull request

**Location:** `README.md:25` ("EtaleCohomologyFoundations §F.5 owns dualizingComplex a = a^!Λ_S for every compactifiable a … §0.9 owns cycleClassMap and IsPure"); `README.md:110` ("the integer twists … defined on every scheme without hypothesis … under `Scheme.IsInvertibleOn n X` … the morphism cycleClassMap i c … the predicate IsPure i c … dualizingComplex a"); `README.md:1098` ("`Scheme.IsInvertibleOn n X` of the EtaleCohomologyFoundations conventions"); `README.md:1100`, `1132`, `1134`, `1208`, `1364`.

**Claim:** The pinned structure of §6.2, the regular term of §6.3 and the Checks of §6.6 are built on `Scheme.IsInvertibleOn`, cycleClassMap, IsPure and dualizingComplex, cited as EtaleCohomologyFoundations §§F.0.3, 0.9 and F.5, and on §F.0.3's twists "defined on every scheme without hypothesis".

**Witness:** EtaleCohomologyFoundations is on main. On main, `README.md:231–247` (§F.0.3) defines the twists "for `N` invertible on `X`"; `README.md:1120–1143` (§0.9) provides `ClassicalAlgebraic.cycleClasses` and `ClassicalAlgebraic.lciCycleClass` with the class `cl_Z ∈ H_Z^(2c)(X, Λ(c))` and names no cycleClassMap and no IsPure; `README.md:1179–1199` (§F.5) provides `VanishingCycles.etaleExceptionalInverseImage` and `D_X K = RHom(K, a_X^!Λ)` for separated finite-type field schemes and names no dualizingComplex; `README.md:15–25` (Conventions) name no `Scheme.IsInvertibleOn`. The pinned Tau Ceti has no `IsInvertibleOn` either (grep over `.lake/packages/TauCeti/TauCeti`, 0 hits). Every one of these names and claims occurs in the revision pull request of EtaleCohomologyFoundations, #1891: `README.md:23` (`Scheme.IsInvertibleOn`), `:389–392` (twists "carry no hypothesis"), `:1635–1636` (cycleClassMap, IsPure as `IsIso (cycleClassMap i c)`), `:1722–1723` (dualizingComplex for every compactifiable `a`). A pull request that revises an existing roadmap is never a dependency: the roadmap is cited as it is on main. `roadmaps grep --fixed` for `cycleClassMap`, `IsPure i`, `dualizingComplex a` and `IsInvertibleOn` finds them in #1891 and this roadmap only (and `IsInvertibleOn` in VStackSheavesAndLisseCategories #1230, another consumer of #1891).

**Exact repair:** State the same mathematics on main's names, which supply every ingredient. (1) In §6.2 and the contract paragraph: the pinning target is the integer twist `VanishingCycles.etaleTateTwists` of §F.0.3 with n invertible on X, which is the standing hypothesis of the structure anyway (ILO XVII 2.1.2 defines the notions only for ℤ[1/n]-schemes); replace "defined on every scheme without hypothesis" by "for n invertible on X", and replace the class `Scheme.IsInvertibleOn n X` by the prose hypothesis "n invertible on X" (or the class the implementer chooses), since no such class exists on main or at the pin. (2) In §6.3: build the pinning from the class `cl_x` of `ClassicalAlgebraic.lciCycleClass` (§0.9 on main, regular immersion of the closed point, codimension c) through the adjunction of §0.7's support functor, which gives the morphism Λ_x → i^!Λ_X(c)[2c] directly; state its invertibility as the absolute-purity theorem of LefschetzPencilsAndVanishingCycles §0.10 (its "pointwise pure" predicate, `README.md:708–709` at its head, is this map being an isomorphism), without the names cycleClassMap and IsPure, or define those two names here in §6.3 as this roadmap's own. (3) In the scope paragraph, §6.2, the §6.6 Check and the Dependencies line: the relative object is a^!Λ_S of `VanishingCycles.etaleExceptionalInverseImage` (§F.5 on main), on the finite-cohomological-dimension domain with the separated finite-type noetherian geometry of §F.2.4 that `README.md:107` already uses; drop the name dualizingComplex and the clause "which that roadmap defines for every compactifiable a without a dimension or field hypothesis". (4) In §6.2, "the derived category of `Sheaf X.smallEtaleTopology (ModuleCat Λ)` fixed by the EtaleCohomologyFoundations conventions": main's conventions (`README.md:17`) fix Mathlib's vocabulary but name no carrier; either drop "fixed by the EtaleCohomologyFoundations conventions" or state the carrier as this roadmap's choice (Mathlib's `Scheme.smallEtaleTopology` exists at the pin, `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`). Tested on the instances that refuted the original: with (2), the §6.3 Checks on the trait (Kummer class of π ↦ 1, independent of π ↦ uπ) and at c = 0 (coefficient unit) read off main's §0.9 Checks ("the divisor T = 0 on A¹ has localized class given by the Kummer connecting image of T"; "for c = 0, use the coefficient unit"); with (3), the §6.2 Check on smooth purity uses only `VanishingCycles.smoothPurity` and the composition law of `etaleExceptionalInverseImage`, both on main (`README.md:1181, 1202`).

## R03 (P3) — A §6.3 Check attributes a composition law for lci cycle classes to EtaleCohomologyFoundations §0.9 beyond its scope

**Location:** `README.md:1142`: "The cycle-class pinnings satisfy the field because cycle classes compose along regular immersions (EtaleCohomologyFoundations §0.9)."

**Claim:** On a strict regular surface the compatibility field of the cycle-class pinnings follows from a composition law of §0.9.

**Witness:** EtaleCohomologyFoundations on main, `README.md:1122`: "composition of regular immersions" is proved for `ClassicalAlgebraic.cycleClasses`, whose scope is regular immersions "between schemes smooth over a common base"; `README.md:1135` (`ClassicalAlgebraic.lciCycleClass`, the class used by §6.3 for a general regular local scheme) lists Cartier agreement, coefficient reduction, transverse pullback and agreement with `cycleClasses` in its smooth-pair scope, and no composition law. A strictly henselian excellent regular local ring of dimension 2 need not be smooth over any base. The §6.3 theorem itself proves the field by the trait reduction (ILO XVII 2.4.2.1 and 2.4.3.3–2.4.3.4, `README.md:1120`), not by composing classes.

**Exact repair:** Replace the clause by "The cycle-class pinnings satisfy the field by the theorem above: the compatibility at an immediate specialization is checked on the normalization of the closure of the codimension-one point, a strictly henselian trait, where it is the Kummer computation of the first Check (ILO XVII 2.4.2.1, 2.4.3.3)". Tested on the instance of the Check: on the trait C̃ the two pinnings are the Kummer pinning at s and the identity at η, and the factor 2 ≠ 1 in ℤ/5 is detected there.

## R04 (P3) — The §0.8 small-site justification needs X quasi-separated

**Location:** `README.md:324`: "since every Zariski covering is refined by affine opens and proper morphisms are of finite type, every covering sieve of a finite-type X-scheme contains a composite of generating families whose members are of finite type over X."

**Claim:** For every scheme X, affine opens of a finite-type X-scheme are of finite type over X.

**Witness:** §0.8 imposes nothing on X (`README.md:322`: "No noetherianity is imposed on 𝒮"; Conventions: no separatedness unless stated). Let X be 𝔸^∞_k = Spec k[x₁, x₂, …] with the origin doubled, U₁ and U₂ its two affine copies, Y = X (of finite type over X by the identity). U₁ is an affine open of Y, and U₁ ∩ U₂ = 𝔸^∞ ∖ {0} is not quasi-compact (the D(xᵢ) have no finite subcover), so U₁ → X is not quasi-compact, hence not of finite type: the affine refinement of the Zariski covering {U₁, U₂} of Y has members outside the small category. For X quasi-separated the clause is right: a morphism from a quasi-compact scheme to a quasi-separated scheme is quasi-compact (cover the source by finitely many affines over affines of X; preimages of a quasi-compact open are then finite unions of preimages under affine morphisms of quasi-compact opens).

**Exact repair:** Begin the bullet with "For X quasi-separated," and add after it "Layers 2–5 use the small site only over noetherian X". Tested on both instances: for Spec k[x₁, x₂, …] (quasi-separated, the instance of the previous report) the covering {U, id_X} is still refined by {id_X}; the doubled-origin X is excluded by the hypothesis.

## Previous findings

- R01 — repaired: `README.md:324` carries the prescribed clause "since every Zariski covering is refined by affine opens and proper morphisms are of finite type, every covering sieve of a finite-type X-scheme contains a composite of generating families whose members are of finite type over X". The clause is right for quasi-separated X and not for every X: R04 of this report.
- R02 — repaired: `README.md:21` reads "ArcTopologyAndDescent §1.3 owns the h-topology on finitely presented schemes over a qcqs base, the finitely presented v-covers of Bhatt–Scholze, generated by fppf coverings and abstract blowup covers; EnhancedDerivedSheaves §E2.8 owns its perfection on perfect 𝔽_p-schemes", the prescribed wording; it matches EnhancedDerivedSheaves on main (`README.md:2399`, `perfectHTopology`) and ArcTopologyAndDescent §1.3 at its head (`README.md:282–296`).

## Verified sound

**Scope of this pass.** I read the diff in full and every passage it touches or that cites it: the scope paragraph (`README.md:21, 25`), the EtaleCohomologyFoundations contract (`README.md:101–110`), §0.8's first interface bullet, §6.1 (unchanged, read for the transition maps the new field uses), §6.2 in full, §6.3 in full, §6.4's first paragraph, §6.6 in full, §6.7, §6.11, the Layer 6 Examples and Dependencies, the References entry for ILO14, and `Suggested.lean` in full. No seeded sample target falls in the changed text except §6.11, which the diff does not touch and whose text, locators (ILO14 lines 12220, 12835; CS24 line 1367) and Checks are unchanged since 047baea; the verification of the sample at 047baea stands.

**Gate and dependency direction.** The worker's gate at ffdd816: every scanner 0 except `statement-hygiene=2` (R01), `build=0`, `outside-folder=0`, `depcheck=0`, FAIL. `git diff --name-only origin/main...HEAD` outside the folder: 0 paths (the long list in `scratch/changes.md` is the merge of main into the branch, not the pull request's edits). The required dependency check, complete output:

```text
depcheck: 239 roadmaps, 2344 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The new citations are EtaleCohomologyFoundations (main), SchemeAndStackFoundations (main) and LefschetzPencilsAndVanishingCycles (earlier in the merge order); inside the roadmap the new paragraphs of §§6.2, 6.3 and 6.6 cite §§5.1, 6.1, 6.2, 6.3, 6.5 only, in build order.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` from the pull-request checkout: 4.7 s, exit 0, exactly six `declaration uses sorry` warnings (lines 65, 87, 178, 222, 259, 277) and nothing else. The header is now `module` / `public import Mathlib` / `@[expose] public section`; no Tau Ceti module is imported. The nine declarations are textually unchanged below the header, so the `#check @name` comparison of the review at 047baea stands; `scratch/signatures.md` lists 0 dropped binders. The docstring's new bullet (the pinned structure of §6.2 is not statable at the pins) is right: `etaleTateTwists`, the support functor and `i^!` are absent from the pinned Tau Ceti (grep, 0 hits), and Mathlib's `Scheme.smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`) alone does not give RΓ_x. One-tactic probes: unchanged statements, the probes at 047baea stand.

**Source checks this round.** ILO14 is the arXiv v1 text; its page markers run six ahead of the printed pages (file page 269 = printed 263).

| Target / passage | Text checked | Outcome |
| --- | --- | --- |
| 6.2 pinned structure: Définition 2.1.2 | ILO14 lines 12581–12601 (file page 269, printed 263): putative = K ∈ D⁺(X_ét, Λ) with, for every x ∈ X, an isomorphism RΓ_x(K) ≅ Λ(δ(x))[2δ(x)] in D⁺(x_ét, Λ); potential = for every immediate specialization y → x the square with sp_(y→x) : RΓ_y(K) → RΓ_x(K)(1)[2] commutes; lines 12602–12610: defined only for noetherian excellent ℤ[1/n]-schemes with a dimension function | Agrees with the two data fields and the one Prop field; the README's spelled-out square (stalk of pin y, then the lisse specialization of Λ(δ(y)); sp, then pin x twisted by (1)[2] and twist addition) is the diagram at lines 12593–12599 with δ(y) = δ(x) + 1. The standing hypotheses are the class arguments. |
| 6.2 Remarque 2.1.3 | lines 12611–12613: on connected X two potential structures on one K agree at all points once they agree at one | Supports the §6.6 Check "exactly one isomorphism … the identity is the only automorphism" on connected regular X. |
| 6.2 étale restriction: Proposition 2.2.1 | lines 12623–12636 (printed 264): for étale f : Y → X with δ_Y = δ_X ∘ f, f^*K is putative via g^*RΓ_x(K) ≅ RΓ_y(f^*K), potential if K is | Agrees with "restriction along an étale h : U → X for δ ∘ h, transporting the pinnings by étale base change of supports". |
| 6.3 regular term: Proposition 2.4.4.1 | line 12835 (file page 273, printed 267): the putative complex Λ of 2.4.1.1 on a regular excellent X with −codim is potential; 2.4.1.1 at line 12669 (printed 265) builds the pinnings from purity | Agrees; the README's "the compatibility field is the theorem above" is this proposition. |
| 6.6 construction and uniqueness: Théorème 5.1.1 | lines 13878–13885 (file page 293, printed 287): K_X exists, unique up to unique isomorphism, Λ → τ_(≤0)RHom(K_X, K_X) an isomorphism, K_X ∈ Perv^(−2δ) | Agrees with the four statements of the paragraph; "unique isomorphism" is in the category of potential complexes, as the README's category of §6.2. |
| 6.7 (cited by 6.2's relative case) | line 13512 (printed 280), Proposition 4.1.1 | Unchanged target; the locator holds. |

**Library and supplier citations resolved this round.**

| Citation | Where found | Outcome |
| --- | --- | --- |
| `VanishingCycles.etaleTateTwists` (§F.0.3) | EtaleCohomologyFoundations main `README.md:233`, `Suggested.lean:497` | Exists; twists for N invertible on X (R02 on the "no hypothesis" clause). |
| `ClassicalAlgebraic.supportLocalization` (§0.7) | main `README.md:443`, `Suggested.lean:512` | Exists; `i^!` and both localization triangles for any ring Λ, no invertibility. |
| `ClassicalAlgebraic.lciCycleClass` (§0.9) | main `README.md:1135`, `Suggested.lean:515` | Exists; cl_Z ∈ H_Z^(2c)(X, Λ(c)) for regular immersions between locally noetherian schemes, c = 0 the coefficient unit. |
| `VanishingCycles.smoothPurity` (§F.6) | main `README.md:1202`, `Suggested.lean:556` | Exists; f^!Λ ≅ Λ(d)[2d] for smooth f of relative dimension d. |
| `VanishingCycles.etaleExceptionalInverseImage` (§F.5) | main `README.md:1181` | Exists; right adjoint to Rf_! on the finite-cohomological-dimension domain of F.2. |
| cycleClassMap, IsPure (§0.9), dualizingComplex (§F.5), `Scheme.IsInvertibleOn` (Conventions) | not on main; #1891 `README.md:23, 389–392, 1635–1636, 1722–1723` | R02. |
| `IsExcellentScheme X` (SchemeAndStackFoundations §0.21) | main `README.md:1426–1427` | Exists, with `.locallyNoetherian`, `.isUniversallyCatenary`. |
| LefschetzPencilsAndVanishingCycles §0.10 | head of #873, `README.md:701–709` | Exists; "pointwise pure" = Λ(−d)[−2d] → i_x^!Λ an isomorphism at every regular local point, the statement §6.3 inverts. |
| EtaleDualityAndPerverseSheaves §§0.1, 0.2 | head of #1040, `README.md:109, 149` | Exist (self-injective coefficients; duality beyond finite Tor dimension); no potential dualizing complex is stated there (grep "potential dualizing", 0 hits), so §6.2's structure has one owner. |
| Mathlib `Scheme.smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50` at the pin | Exists. |
| Tau Ceti `Module.Baer.zmod_self` (`README.md:17`, unchanged) | `.lake/packages/TauCeti/TauCeti/Algebra/Module/ZMod/Injective.lean:50` | Exists. |

**Adversarial table.** New rows carry computed values; untouched statements carry forward the rows of the reviews at 047baea, f7fc49c and d6c3ae4, cited by target. Λ = ℤ/n, n invertible where required; complexes cohomologically graded, Λ(−d)[−2d] in degree 2d.

| Statement | Instances tried | Values on each side; wrong model | Result / change |
| --- | --- | --- | --- |
| 6.2 structure: two data fields | Spec k̄, δ ≡ 0; strict trait, δ(s) = 0, δ(η) = 1 | Spec k̄: one point, i^! = id, pin : Λ ≅ Λ(0)[0] = Λ. Trait with K = Λ(1)[2]: pin_η : Λ(1)[2] ≅ Λ(1)[2]; pin_s : RΓ_s(Λ(1)[2]) = H²_s(Λ(1)) in degree 0 ≅ Λ by Kummer. Wrong model "pinnings only at closed points" would not see the generic pinning that §6.6's uniqueness Check uses. | Correct. |
| 6.2 potential field, direction and twist | strict trait, K = Λ(1)[2], ȳ = η̄ ⇝ x̄ = s | Left route: RΓ_η̄(K) = Λ(1)[2]_η̄ → Λ(1)_s̄[2] by the lisse specialization. Right route: sp : RΓ_η̄(K) → RΓ_s(K)(1)[2] = Λ(1)[2]; pin_s twisted by (1)[2]: Λ(0)(1)[0 + 2]; twist addition Λ(0) ⊗ Λ(1) ≅ Λ(1). Both land in Λ(1)[2] with δ(η) = δ(s) + 1 = 1. The ILO square (lines 12593–12599) has the same two legs. Wrong model (twist on the source side, RΓ_ȳ(K)(1)[2] → RΓ_x̄(K)) would need δ(y) = δ(x) − 1, contradicting the law of δ. | Correct. |
| 6.2 class arguments versus statement hypotheses | X locally noetherian excellent, not quasi-compact (⊔ of infinitely many Spec k) | The structure's class arguments are excellence (locally noetherian by `IsExcellentScheme.locallyNoetherian`) and invertibility; the definition is pointwise and the field is local on X_(x̄), so the structure is meaningful there; the §6.2 statement sentence and ILO 2.1.2 say "noetherian", and §6.6 (normalization, finite stratification) needs it. | Wider than the statement sentence by quasi-compactness only, harmless for a definition; no change. |
| 6.2 category of putative complexes | Spec k̄, δ ≡ 0, n = 5; the trait with Λ(1)[2] | Morphisms (Λ, id) → (Λ, id): u ∈ End(Λ) = ℤ/5 with id ∘ u = id, so u = 1: one automorphism. Forgetting the pinnings: units of ℤ/5 are {1, 2, 3, 4}, four automorphisms. Trait: Aut_D(Λ(1)[2]) = (ℤ/n)ˣ; commuting with pin_η = id forces u = 1. | Correct (Checks 4 of §6.2 and 1–2 of §6.6). |
| 6.2 twist-shift operation | regular X, δ = −codim, k = d | K(k)[2k] for δ + k: at x of codimension c the pinning RΓ_x(Λ)(k)[2k] ≅ Λ(−c)(k)[−2c + 2k] → Λ(k − c)[2(k − c)] by twist addition; δ(x) + k = k − c. | Correct. |
| 6.2 Check 1: smooth purity agreement | a : X → Spec k smooth of pure dimension d, x a k-rational point; n = 2 and n = 3 | δ(x) = 0 = (−d) + d. Regular pinning at x: i_x^!Λ ≅ Λ(−d)[−2d] via cl_x; after (d)[2d]: i_x^!(Λ(d)[2d]) ≅ Λ, cl_x ↦ 1. Transport along a^!Λ ≅ Λ(d)[2d] (trace Tr_a : Ra_!Λ(d)[2d] → Λ) gives i_x^!a^!Λ ≅ Λ sending the point class to Tr_a(cl_x) = 1 (point classes have trace +1, EtaleCohomologyFoundations Conventions line 23), which is the composition isomorphism i_x^!a^!Λ ≅ (a ∘ i_x)^!Λ = id^!Λ = Λ. Trace −1 normalization: pinning −1 · (the above); −1 = 1 for n = 2, −1 ≠ 1 for n = 3. | Correct, including "once n ≥ 3". |
| 6.2 Check 2: 𝔸¹_k | δ(η) = 1, δ(0) = 0 | Twist-shift by (1)[2] of (Λ, cycle pinnings): object Λ(1)[2]; at η, c = 0, pinning id ⊗ Λ(1)[2] = id; at 0, H²_0(𝔸¹, Λ(1)) ≅ Λ with the Kummer class of the coordinate ↦ 1 (EtaleCohomologyFoundations main §F.6 Check line 1216: "the point zero in 𝔸¹ has supported H²(Λ(1)) = Λ, generated by its cycle class"; §0.9 Check line 1129). Through smoothPurity for 𝔸¹_k (d = 1) it is the composition pinning as in Check 1. | Correct. |
| 6.2 Check 3: strict regular surface | δ = −codim; closed point c = 2 | Target Λ(−2)[−4] = ℋom(Λ(2), Λ)[−4], concentrated in degree 4 (Conventions). A structure with only tensor powers Λ(m), m ≥ 0, has no object Λ(−2). With δ(x) = 0 (§6.11) the target is Λ(0)[0] = Λ. | Correct. |
| 6.2 relative case: a^!Λ_S for compactifiable a over regular excellent S | S = Spec k, X separated of finite type; S a strict trait | §6.7(2) with δ_S = −codim on S regular (§6.3) and δ_X(x) = δ_S(a(x)) + trdeg: over Spec k, δ_X = dim of closure; over a trait, δ_X(x) = trdeg − (0 or 1). The object a^!Λ_S exists on main as `etaleExceptionalInverseImage` for separated finite-type a over noetherian S (F.2.4 geometry); the name dualizingComplex does not. | Mathematics correct; naming is R02. |
| 6.3 regular term: pinning from the class | strict trait, π; c = 0; strict regular surface | c = 1: cl_s ∈ H²_s(Λ(1)) is the Kummer boundary of π; adjoint Λ_s → i^!Λ(1)[2]; invert (purity), twist by (−1)[−2], projection formula i^!(Λ(1)) ⊗ Λ(−1) ≅ i^!Λ: pinning i^!Λ ≅ Λ(−1)[−2] with cl_s ↦ 1. cl_(uπ) − cl_π = ∂(u) = 0 since δ(u) ∈ H¹(η, Λ(1)) comes from H¹(X, Λ(1)) and the boundary kills it. c = 0: lciCycleClass is the coefficient unit, pinning = id_Λ. Surface: the Λ = ℤ/5 modification by 2 at the closed point breaks the square by the factor 2 ≠ 1. | Correct (R03 on the justifying clause of the third Check only). |
| 6.3 "smooth-pair purity and absolute purity pin with one class" | closed point with separable residue field of X smooth over k | EtaleCohomologyFoundations main §0.10: `smoothBoundaryPurity` i^!Λ_X ≅ Λ_Z(−c)[−2c] "with its counit carrying the class of Section 0.9"; so the smooth-pair isomorphism is the inverse of the class map, the same map §6.3 inverts. | Correct. |
| 6.6 construction as data | regular connected X; trait; ∅ | Inputs regular locus (open by J-2, excellence), normal locus, finite normalization (Nagata, excellence), perverse extension (§6.5): all canonical, no choice. Uniqueness: Hom in the §6.2 category between two potential terms is a singleton (5.1.1). Regular connected X: the unique isomorphism to (Λ, cycle pinnings); automorphism u ∈ Λˣ of Λ_X moves pin_η = id unless u = 1. Trait: Hom(K_X, Λ(1)[2] with Kummer pinning) a one-element type while Aut_D = (ℤ/n)ˣ. ∅: D(∅) is the zero category, pinnings indexed by ∅, the unique isomorphism 0 → 0. | Correct. |
| 6.6 Check K_X for finite type over a field | X separated finite type over k, δ = dim of closure | a^!Λ with the pinnings of §6.7(2) from the regular term on Spec k (δ_k ≡ 0, pinning id): unique isomorphism K_X ≅ a^!Λ by uniqueness; "rather than equalities of objects" is right since K_X is built by normalization and cones. | Correct; the name is R02. |
| Scope paragraph (line 21, repaired) | ArcTopologyAndDescent §1.3 at its head; EnhancedDerivedSheaves §E2.8 on main | §1.3: fp v-covers on fp S-schemes, fppf + abstract blowups; §E2.8: `perfectHTopology` on perfect 𝔽_p-schemes; §0.8 here: proper surjective + Zariski on all schemes. | Correct; previous R02 repaired. |
| Scope paragraph (line 25, new) | EtaleCohomologyFoundations main §§F.5, F.0.3, 0.9 | §F.5 on main owns `etaleExceptionalInverseImage` and field-scheme duality, no "dualizingComplex for every compactifiable a"; §0.9 owns lciCycleClass, no cycleClassMap/IsPure. "Layer 6 introduces no exceptional inverse image and no twist of its own" is consistent with §§6.2–6.3. | R02. |
| Contract paragraph (line 110, new) | each named declaration at main | Four of the names exist (`etaleTateTwists`, `supportLocalization`, `smoothPurity`; `lciCycleClass` at line 1132); `Scheme.IsInvertibleOn`, cycleClassMap, IsPure, dualizingComplex and "defined on every scheme without hypothesis" do not. | R02. |
| 0.8 small-site bullet (line 324, repaired) | X = Spec k[x₁, x₂, …], U = X ∖ V(x₁, x₂, …); X = 𝔸^∞_k with doubled origin | Quasi-separated X: {U → X, id} is refined by {id}, of finite type; affine opens of finite-type X-schemes are quasi-compact over X. Doubled origin: U₁ affine open of Y = X, U₁ ∩ U₂ = 𝔸^∞ ∖ {0} not quasi-compact, U₁ → X not quasi-compact, not of finite type. | R04 (P3): add "X quasi-separated". |
| Layer 6 Dependencies addition | Needs lines of §§6.2, 6.3 | §F.0.3, §0.9, SchemeAndStackFoundations §0.21 are the new inputs of §§6.2–6.3 and nothing else cites them; the line records exactly those. | Correct. |
| Lean module header and docstring | `lake env lean`; grep of the pins | `module` / `public import Mathlib` / `@[expose] public section` elaborates; the new docstring bullet names the missing carriers (twists, support functor, internal Hom, general-base `f^!`), none at the pin. | Correct. |
| 0.1–0.7, 0.8 (other bullets and Checks), 1.1–1.7, 2.1–2.4, 3.1–3.6, 4.1–4.2, 5.1–5.8 | as in the reviews at 047baea, f7fc49c and d6c3ae4 | values recorded there | unchanged, carried forward |
| 6.1, 6.4, 6.5, 6.7–6.12 (statements), 7.1–7.3, 8.1–8.6 | as in the review at 047baea | values recorded there | unchanged, carried forward |
| The six Lean headlines and three structures | as in the review at 047baea; signatures unchanged at this head | 0 dropped binders; one-tactic probes failed to close at 047baea | unchanged, carried forward (R01 is form, not content) |

**Declared gaps.** The five gap slugs and their contracts are untouched by the diff; the previous reports' checks stand. No new gap is declared; R02's repair needs none, since main's §§0.7, 0.9, F.0.3 and F.5 supply the ingredients.

**Ownership against open work.** The new objects are the structures PutativeDualizingComplex and PotentialDualizingComplex on (X, δ), their category, the regular term and potentialDualizingComplex. `roadmaps grep --fixed` for `PutativeDualizingComplex`, `PotentialDualizingComplex` and `potentialDualizingComplex` over the 459 open pull requests and main hits this roadmap only; EtaleDualityAndPerverseSheaves at #1040 states no potential dualizing complex; EtaleCohomologyFoundations (main and #1891) stops at a^!Λ_S and the Verdier layer and names Gabber's pinned structure nowhere. This roadmap is the owner. The WeilConjectures board package, which the commit message names, has no README in the board checkout given to me (reports only), so its consumption of these names was not checked; it is a consumer in any case. Ownership was checked against the open pull requests whose files this brief gives; the others were not searched.

## Not verifiable

- **Ill03** and **Epp73** remain settled as uncertified; nothing in the diff touches them.
- The WeilConjectures package README on its board pull request was not read (not in the checkout given); whether its design cites §6.2's names exactly as written here is unverified and does not affect this review.

## Source issues

- none
