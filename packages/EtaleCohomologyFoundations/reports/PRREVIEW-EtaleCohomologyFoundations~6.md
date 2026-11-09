# Review of EtaleCohomologyFoundations (pull request #1891 at bdbf9b3)

**Verdict:** needs changes

Full review of the same head the previous review read (`bdbf9b3`, no change in the folder since). The two previous findings both concern the pull-request description. The description has not changed, so both still stand (R01, R02); R01 also gains a third owner. The full pass found seven P3 defects that earlier rounds missed:
- two supplier citations point at the wrong place (R03, R04);
- the README contradicts itself on the universe of `ℤ_ℓ,X` (R05);
- the base change of `f^!` does not name its source and target, and its natural reading is false (R06);
- two statements are narrower than their sources (R07);
- the prose of Gauss–Bonnet overclaims (R08);
- a block of §F.4.5 has no locator (R09).

The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with six `sorry` warnings and nothing else. Its six theorems are not padding: none closes with one tactic.

## Previous findings

- **Previous R01 (P3, the description does not name the SchemeAndStackFoundations revision) — not repaired.** The live description at `bdbf9b3` still reads "Merge order: this PR edits a roadmap on main and depends on no open roadmap PR". SchemeAndStackFoundations on main (`1bea835`) still has 0 occurrences of `toProEt`; the #1656 head (`1bfff38`) defines it at `README.md` line 4201. Carried as R02.
- **Previous R02 (P2, the point count has two owners) — not repaired.** The description still says "roadmaps citing EtaleCohomologyFoundations labels are unaffected, since no label changes". WeilConjectures (#1208) is unchanged at `029d8c2`. Carried as R01, which now also names DeligneWeightsAndPurity as a third owner.
- **Previous R03 (Milne locator) — still repaired.** README lines 1006–1008, against `milne-av` lines 2288 and 2305–2310.

## R01 (P2) — The point count over finite extensions has three owners, and the description says consumers are unaffected

Carried from previous R02.

**Location.**
- `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` line 13: "the count of points over the degree-`r` extension of a finite field from which a zeta series is formed is Scheme.Hom.pointCount of §F.10.1".
- §F.10.1, from line 1321.
- The description: "roadmaps citing EtaleCohomologyFoundations labels are unaffected".

**Claim.**
- This roadmap (merge order line 42) owns the count over the degree-`r` extension.
- Two later open roadmaps each build their own: WeilConjectures (line 125) and DeligneWeightsAndPurity (line 72).
- The README's own content is right. The conflict is settled only when the description states what the consumers change, and the description denies that anything changes.

**Witness.**
- WeilConjectures (#1208, `029d8c2`): `Suggested.lean` line 55, `extensionPointCount` on universe-0 `FiniteField.Extension`; `README.md` line 115 cites the dropped `VanishingCycles.numberOfRationalPoints`.
- DeligneWeightsAndPurity (#929, `5930b27`): `Suggested.lean` lines 65, 72, `finiteFieldPointCount`, `finiteFieldZeta`.

**Repair.** No README change. In the description, replace "unaffected" by the changes the consumers make:
- WeilConjectures' `extensionPointCount p X r` becomes Scheme.Hom.pointCount. At universe 0 the two agree by Scheme.Hom.pointCount_eq_numberOfRationalPoints applied to Mathlib's `FiniteField.Extension k p r`, which has degree `r` by `FiniteField.finrank_extension` (`Mathlib/FieldTheory/Finite/Extension.lean` line 81).
- WeilConjectures' citation of `VanishingCycles.numberOfRationalPoints` becomes Tau Ceti's `AlgebraicGeometry.Scheme.Hom.numberOfRationalPoints`, as README line 39 records.
- DeligneWeightsAndPurity's `finiteFieldPointCount f E` is Tau Ceti's `Scheme.Hom.numberOfRationalPoints E f`: the same `Nat.card` of the same subtype (`TauCeti/AlgebraicGeometry/RationalPoint/Count.lean` lines 43–44).
- DeligneWeightsAndPurity's `finiteFieldZeta` is formed from Scheme.Hom.pointCount, or taken from WeilConjectures.

## R02 (P3) — The description does not name the SchemeAndStackFoundations revision that alone defines §2.10's `ν`

Carried from previous R01.

**Location.**
- README line 11: "the comparison morphism `ν` … and the single change of coefficient universe are SchemeAndStackFoundations §2.10 (`Scheme.toProEt`)".
- The same citation at lines 46, 66, 1451–1465, 1524, 1545 and 1560.
- The description: "depends on no open roadmap PR".

**Claim.** What the README attributes to SchemeAndStackFoundations §2.10 exists only at an open revision: `Scheme.toProEt`, `ν^* ⊣ ν_*`, the change of universe and the naturality in `X`. That makes the revision a dependency, and the description denies having one.

**Witness.**
- SchemeAndStackFoundations on main (`1bea835`): §2.10 at `README.md` line 3631 states four other comparisons; `toProEt` occurs 0 times.
- At the #1656 head (`1bfff38`): `README.md` line 4201 defines `Scheme.toProEt X : X.Etale ⥤ X.ProEt`, and line 579 is its supplier row.

**Repair.** No README change. In the description's merge-order paragraph:
- Name the SchemeAndStackFoundations revision (#1656) as the one whose §2.10 supplies `Scheme.toProEt`, `ν^* ⊣ ν_*`, the coefficient-universe change and the naturality in `X`.
- State that this pull request merges after it.

## R03 (P3) — Descent of finite étale covers is cited to SchemeAndStackFoundations §§2.10 and 2.15, which state neither

**Location.**
- README line 344 (§F.0.2 `*Needs:*`): "SchemeAndStackFoundations §§2.10, 2.15 (finite étale sites and descent)".
- Supplier row, line 66: "§§2.9–2.11 module sheaves, finite étale sites, Hilbert 90 and Kummer".
- §F.0.1 `*Needs:*`, line 196: "§§2.1, 2.9–2.10".

**Claim.**
- §F.0.2 proves that finite étale covers descend along étale coverings and along limits (Stacks 01ZM, 07RP). The README attributes this to two sections that state neither.
- The finite étale covers themselves are Tau Ceti's package, cited separately.
- §F.0.1 uses no comparison between topologies, so its citation of §2.10 has nothing to point at.

**Witness.** On SchemeAndStackFoundations main:
- §2.10 (`README.md` line 3631) defines only the fppf, étale, Nisnevich and Zariski comparison morphisms.
- §2.15 (line 3867) is Gabber's theorem, Galois cohomology, cohomology limits and Hochschild–Serre.
- Stacks 01ZM and 07RP belong to §0.9's `finite_presentation_limits` (lines 859–866).

**Repair.**
- Line 344: "SchemeAndStackFoundations §0.9 (`finite_presentation_limits`, Stacks 01ZM, 07RP) and §1.1 (`qcoh_fpqc_descent`, effective descent of the affine covers)".
- Line 66: replace "§§2.9–2.11 module sheaves, finite étale sites, Hilbert 90 and Kummer" by "§2.9 module sheaves and `muEtale`, §2.11 Hilbert 90 and Kummer". §2.10 keeps its own clause in the same row.
- Line 196: "SchemeAndStackFoundations §§2.1, 2.9".

## R04 (P3) — `isNoetherianRing_algebra_iff` is cited from ModularCurves Layer 4D, which on main names it differently

**Location.** README lines 1233–1237: "ModularCurves Layer 4D's strict henselization `algebra R Ω` as a strictly henselian trait. … it is Noetherian (`isNoetherianRing_algebra_iff`)".

**Claim.**
- The backticked name exists only at an open revision (#1808), which also moves the statement to SchemeAndStackFoundations §0.12a. On main, ModularCurves Layer 4D states it under another name. So the citation holds neither on main nor at that head.
- The strict henselization and its maximal ideal are Tau Ceti declarations at the pin, and the supplier table does not name them.

**Witness.**
- ModularCurves on main, `Suggested.lean` line 577: `isNoetherianRing_strictHenselization_iff`.
- At the #1808 head, ModularCurves `README.md` line 134 moves it to SchemeAndStackFoundations §0.12a.
- At the pin: `TauCeti/RingTheory/StrictHenselization/Algebra.lean` line 75 and `MaximalIdeal.lean` line 80.

**Repair.**
- Line 1236: "(ModularCurves Layer 4D, `isNoetherianRing_strictHenselization_iff`; Stacks 06LJ)".
- Line 1234: "Tau Ceti's strict henselization `TauCeti.StrictHenselization.algebra R Ω` (ModularCurves Layer 4D)".
- Tau Ceti supplier row: add `TauCeti.StrictHenselization.algebra`, `TauCeti.StrictHenselization.henselianLocalRing` and `TauCeti.StrictHenselization.maximalIdeal_eq_map` (`TauCeti/RingTheory/StrictHenselization/`).

## R05 (P3) — `ℤ_ℓ,X` is Mathlib's `Scheme.ellAdicSheaf` "by definition", yet the pro-étale coefficients live in universe `u+1`; at the pin that sheaf is `Ab.{u}`-valued

**Location.**
- Line 46: "The pro-étale coefficients of §§F.4.3–F.4.5 live in universe `u+1`, as Mathlib's `Scheme.ellAdicSheaf` and `Scheme.EllAdicCohomology` do".
- Lines 1499–1500: "`ℤ_ℓ,X` is Mathlib's `Scheme.ellAdicSheaf ℓ`, `U ↦ C(U, ℤ_ℓ)`, by definition and not up to isomorphism".
- Line 1456: the coefficients are `ModuleCat.{u+1} Λ`.

**Claim.**
- Coefficient objects are module objects over `ℤ_ℓ,X` in universe-`u+1` abelian sheaves (line 1503).
- Mathlib's `ellAdicSheaf` is a universe-`u` sheaf, and the pinned Grothendieck abelian structure exists only for `Ab.{u+1}`.
- So "by definition" contradicts the universe convention, and line 46 misdescribes `ellAdicSheaf`.

**Witness.** In `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`:
- lines 64–65: `ellAdicSheaf … : Sheaf (ProEt.topology X) Ab.{u}`;
- lines 54–57: the Grothendieck abelian instance for `Ab.{u + 1}` only;
- lines 76–77: `EllAdicCohomology` takes `H n` after `AddCommGrpCat.uliftFunctor.{u + 1}`.

**Repair.**
- Lines 1499–1500: "`ℤ_ℓ,X` is `(sheafCompose _ AddCommGrpCat.uliftFunctor.{u+1}).obj (X.ellAdicSheaf ℓ)`, the sheaf whose `Sheaf.H` is `Scheme.EllAdicCohomology` by definition".
- Line 46: "as Mathlib's `Scheme.EllAdicCohomology` does (`Scheme.ellAdicSheaf` itself is `Ab.{u}`-valued and Mathlib lifts it once)".
- In the "exactly one place" sentences (lines 46 and 1484), name Mathlib's lift as the identification used for `ℤ_ℓ,X`.

## R06 (P3) — The base change of `f^!` is cited to Stacks 0GLE without its source and target, and its natural reading is false

**Location.**
- Lines 1806–1807: "with its composition isomorphisms and its base change along every morphism of the base (Stacks 0GLE)".
- Line 1858: "for `f^!` and its base change".
- Line 1851: the six-operation structure carries "base-change isomorphisms" as data fields.

**Claim.**
- Stacks 0GLE is the exchange `Rf^! ∘ Rg_* ≅ Rg'_* ∘ R(f')^!`, the adjoint of lower-shriek base change.
- The base-change map `g'^*f^! → f'^!g^*` is not an isomorphism along arbitrary `g`.
- An unnamed "base change along every morphism", stored as a data field, therefore reads as a false isomorphism.

**Witness.**
- `stacks-0F7H` line 2212 states 0GLE as `Rf^! ∘ Rg_* = Rg'_* ∘ R(f')^!`.
- Take `f = g = i : {0} → 𝔸¹_k` and `Λ = ℤ/n` with `n` invertible, so `X' = {0}`. Then `g'^*i^!Λ = Λ(−1)[−2]`, while `f'^!g^*Λ = Λ`.

**Repair.**
- Lines 1806–1807: "and the exchange isomorphism `Rf^! ∘ Rg_* ≅ Rg'_* ∘ R(f')^!` for every cartesian square (Stacks 0GLE)".
- Use the same wording at line 1858 and for the corresponding field of the six-operation structure (line 1851).
- Add a Check: for the origin `i : {0} → 𝔸¹` and `g = i`, the map `g'^*i^!Λ → f'^!g^*Λ` is `Λ(−1)[−2] → Λ`, which is not an isomorphism.

## R07 (P3) — Two statements are narrower than their sources

**Location.**
- (a) Lines 218–220: "Prove constructibleSheaf_iff_exists_global: when the underlying space of `X` is Noetherian, `F` is constructible exactly when one finite stratification of `X` works globally (Stacks 095E, 09YR)". The same restriction appears at line 54.
- (b) Lines 1885–1886: "the additional Gysin morphism for smoothable local complete intersection morphisms between regular schemes with ample bundles".

**Claim.**
- (a) Stacks 095E proves the equivalence for every quasi-compact quasi-separated `X`.
- (b) ILO XVI §2.5 constructs these Gysin morphisms without assuming the schemes regular.

**Witness.**
- (a) `stacks-0F1P` lines 5422–5427 (095E for quasi-compact quasi-separated `X`). `ℙ¹` over `k[x₁, x₂, …]` is quasi-compact and quasi-separated, but its underlying space is not Noetherian.
- (b) `ilo-travaux-de-gabber` lines 11316–11324: quasi-compact `ℤ[1/n]`-schemes with an ample line bundle, no regularity. The README's own singular-`Z` Check (line 1732) falls outside (b).

**Repair.**
- (a) Lines 219 and 54: "when `X` is quasi-compact and quasi-separated", with the Noetherian case kept as a Check.
- (b) Line 1886: "between quasi-compact `ℤ[1/n]`-schemes with an ample line bundle (ILO XVI, Definitions 2.5.1–2.5.4)". Regularity stays only in the absolute-purity clause.

## R08 (P3) — Gauss–Bonnet is called "an arbitrary-field identity", which fails over non-closed fields as written

**Location.** Lines 1912–1913: "This is an arbitrary-field identity for the stated smooth proper domain."

**Claim.** The target is stated over an algebraically closed `k` with `RΓ(X_et, ℚ_ℓ)` on the right. Over a non-closed field that right side is arithmetic cohomology, and the identity fails.

**Witness.** Take `X = Spec 𝔽_q`, so `d = 0`. Then `deg c_0(T_X) = 1`, while `RΓ(Spec 𝔽_q, ℚ_ℓ)` has `H⁰ = H¹ = ℚ_ℓ`, so `χ = 1 − 1 = 0`.

**Repair.**
- Replace the sentence by "The identity holds over every algebraically closed field of characteristic different from `ℓ`; over a general field it holds with `RΓ(X_k̄, ℚ_ℓ)`."
- Add a Check: on `Spec 𝔽_q` the arithmetic `χ` is `0` while `deg c_0 = 1`.

## R09 (P3) — Two theorems of §F.4.5's representation dictionary have no locator

**Location.** Lines 1621–1638: "Prove that `Dᵇ_c(X, ℚ̄_ℓ)` is the 2-colimit of `Dᵇ_c(X, E)` … define lisseRepresentationEquiv, an equivalence of categories". The paragraph ends at its `*Needs:*` line with no source.

**Claim.** Both statements are theorems, and neither carries a locator.

**Witness.**
- `bhatt-scholze-proetale` lines 2908–2918: Proposition 6.8.14 (1)–(2), the colimit over finite `F` and the rationalization equivalence.
- Line 3312: Lemma 7.4.7, continuous `E`-representations of the pro-étale `π₁` ≃ `Loc_X(E)`.
- Line 3289: Lemma 7.4.5.

**Repair.** Before the `*Needs:*` at line 1637, insert "(Bhatt–Scholze Proposition 6.8.14 (1)–(2) for the 2-colimit and rationalization; Lemmas 7.4.5 and 7.4.7 for lisseRepresentationEquiv)".

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate**, re-run at `bdbf9b3`: `gate EtaleCohomologyFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run at the same head adds `build=0`.
- **Outside the folder.** Nothing changed (`git diff --stat origin/main...HEAD` outside the folder is empty).
- **Dependency check** (`--movable`): `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - Every named supplier is on main and earlier than this roadmap: SchemeAndStackFoundations, EnhancedDerivedSheaves, DerivedModuleAlgebra, DGAInfinity, PadicMeasuresIwasawaAlgebras, StableReduction, ModularCurves, AlgebraicCurves, BelyiMaps, GrothendieckEulerForms, PerfectoidSpaces, and ProfiniteArithmetic (under `Completed/`).
  - The consumers in the README (FourierDeligneTransform, WeilConjectures, LefschetzPencilsAndVanishingCycles and the others) are named as downstream only.
- **Elaboration.** `lake env lean …/Suggested.lean` exits 0 with six `declaration uses sorry` warnings (lines 76, 120, 138, 153, 166, 180) and nothing else.
- **`#check @name` pass** on a scratch copy, for all eight declarations. Each elaborated type carries the binders its README statement needs:
  - `nagataCompactification`: `[CompactSpace S] [QuasiSeparatedSpace S] [IsSeparated f] [LocallyOfFiniteType f] [QuasiCompact f]`;
  - `EtaleFundamentalGroup`: in `Type (u+1)`, matching README line 367;
  - `arithmeticExactSequence`: `[IsAlgClosure k kbar] [CompactSpace X] [ConnectedSpace (pullback …)]`;
  - the four `VanishingCycles.*` theorems: `[IsSepClosed k]`, finite type (affine for Artin vanishing), the torsion-order hypothesis, and `(hℓ : (ℓ : k) ≠ 0)`.

  No section binder is lost, and the file did not need changing.
- **One-tactic probe.** On a scratch copy, each of the six sorried theorems was given `first | rfl | infer_instance | simp | trivial`. All six fail, so there is no padding.
- **Headline coverage.** The README's end theorems are Nagata; the arithmetic `π₁` sequence; the dimension, vanishing and finiteness theorems for finite and `ℓ`-adic coefficients; and the six operations with base change, Künneth, purity and duality.
  - Stated: the first three groups.
  - Not statable, and named in the docstring with what is missing; each claim checked at the pin:
    - no `Rf_*`, `RΓ` or `Rf_!`: Mathlib has only `Sheaf.H.map` along sheaf morphisms (`CategoryTheory/Sites/SheafCohomology/Basic.lean` line 112);
    - no `ℤ_[ℓ]`-module on `EllAdicCohomology` (`ElladicCohomology.lean` lines 76–82);
    - no constructible étale sheaves: Mathlib's `Topology.IsConstructible` is on sets only.

### Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `nagataCompactification` (G.2) | `𝔸¹_k → Spec k`; line with doubled origin; `⊔_ℕ Spec k`; identity; `𝔸¹_A → Spec A` with `A = k[x₁,x₂,…]` | `ℙ¹_k`; not separated, so `[IsSeparated f]` fails, and no compactification exists (open immersion ≫ proper is separated); not quasi-compact, so excluded; identity compactification; `ℙ¹_A` with `A` not Noetherian, covered exactly as in Stacks 0F41 (`stacks-0F41` line 4714) | true; hypotheses equal 0F41's | none |
| `EtaleFundamentalGroup`, `.map` (F.0.2) | `Spec K^sep → Spec K`; `S₁ ⊔ S₂`; `Spec 𝔽_{p²} → Spec 𝔽_p` | `Aut(fiber) ≃ₜ* Gal(K^sep/K)` (`FundamentalGroup.lean` line 219); restriction to `S₁` is an isomorphism (covers extend by `∅`); image index 2 (stabilizer of one of the 2 fibre points), not surjective; whiskering direction `fiber (x ≫ f) ≅ fiber (x ≫ f)` checked against `pullbackCompFiberIso` (`Fiber.lean` line 179) | true | none |
| `arithmeticExactSequence` (F.0.A2) | `X = Spec k`; `Spec 𝔽_{p²}/𝔽_p`; `𝔾_{m,ℚ}` at `1`; an algebraically closed overfield in char `p` | `1 → 1 → Γ_k ≅ Γ_k → 1`; `X_k̄` has 2 points, so `ConnectedSpace` fails and the false surjectivity (index 2) is excluded; `Ẑ(1) → π₁ → Γ_ℚ`, split; excluded by `IsAlgClosure` (SGA 1 IX Remarque 6.3, `sga1` line 7801) | true | none |
| `VanishingCycles.etaleCohomologicalDimension` (F.3.0) | `ℙ¹/k̄`, `ℤ/ℓ`; `Spec k̄`; `∅`; `Spec 𝔽_q`; `𝔸¹` in char `p`, `ℤ/p` | `H² = ℤ/ℓ(−1)` at `q = 2` (not `> 2`), `H³ = 0`; `H^{≥1} = 0`; `2·⊥ = ⊥ < 0` and `H⁰(∅) = 0`; `H¹ = ℤ/ℓ` excluded by `IsSepClosed`; hypothesis fails although `H² = 0` respects the bound | true | none |
| `VanishingCycles.affineArtinVanishing` (F.3) | `𝔸¹` in char `p`, `ℤ/p`; `ℙ¹`; `Spec ℝ`, `ℤ/2`; `𝔾_m/k̄`, `ℤ/ℓ` | `H¹ = k[t]/℘` (nonzero) at `q = 1 = dim`, `H² = 0`; not affine, `H² ≠ 0`; `Hⁱ = ℤ/2` for all `i`, excluded; `H¹ = ℤ/ℓ` at `q = dim`, `H² = 0`; 0F0V: `cd ≤ dim + cd(K)` (`stacks-0F1P` line 9332) | true | none |
| `VanishingCycles.finite_H_constantSheaf` (F.3) | `𝔸¹` in char `p`, `ℤ/p`; `𝔾_m/k̄`, `ℤ/ℓ`; `Spec ℚ`, `ℤ/2`; line with doubled origin over `k̄`; `M = 0` | `H¹` infinite, excluded by `(p : k) = 0`; `H⁰ = H¹ = ℤ/ℓ`; `ℚ^×/ℚ^{×2}` infinite, excluded; Mayer–Vietoris gives `H⁰ = ℤ/ℓ`, `H¹ = 0`, `H² = ℤ/ℓ` (non-separated case allowed, as line 1092 says); `Nat.card = 1` | true | none |
| `VanishingCycles.subsingleton_ellAdicCohomology` (F.4.4) | `ℙ¹/k̄` at `q = 2, 3`; `Spec 𝔽_p`; `∅`; `ℓ = p` on `𝔸¹` | `H² = ℤ_ℓ` allowed; `lim¹ ℤ/ℓⁿ = 0` (surjective) and `lim H³ = 0`, so `H³ = 0` (BS 5.6.2, `bhatt-scholze-proetale` line 1924); `H¹ = ℤ_ℓ` excluded; Mathlib instance (`ElladicCohomology.lean` line 84); `H³ = 0` without `hℓ` (unused-hypothesis note) | true | none |
| Invertibility (Conventions, line 50) | `Spec ℤ[1/6]` with `ℓ = 6, 5`; `∅`; `ℓ = 0` | `6` is a unit in every residue field, `5` vanishes at `(5)`; on `∅` the class holds for all `ℓ` while `(ℓ : k) ≠ 0` can fail, hence "nonempty" in Scheme.isInvertibleOn_iff_ne_zero; `ℓ = 0` holds iff `X = ∅`; `ringChar (Λ/I)` invertible implies `Λ/Iⁿ` is killed by its `n`-th power (line 1398) | true | none |
| `EtaleFundamentalGroup`, EtalePath (line 363) | `Spec 𝔽_p` with `x = y = Spec 𝔽̄_p`; `Spec 𝔽̄_p` vs `Spec Ω`, `Ω ⊃ 𝔽_p(t)` | EtalePath `x x` is a `Ẑ`-torsor; the fibre functors are isomorphic though no field isomorphism exists (transcendence degree 0 vs 1); 0BMY = Definition 58.3.6, 0BND = Theorem 58.6.2 (`stacks-0BMY` lines 221, 689) | true | none |
| Scheme Frobenius interfaces (line 452) | absolute Frobenius on `Spec 𝔽_{p²}`; tag list | Frobenius moves the scalars of `𝔽_{p²}`, its square fixes them; 03SM = 33.36.1, 0CC7 = .2, 0CC8 = .3, 0CC9 = Definition .4, 0CCA = .5, 0CCB = .6, 0CCG = Remark .11 (Stacks, Varieties, §33.36, read in the Stacks PDF) | true | none |
| Decomposition and inertia (line 492) | `z ↦ zⁿ` at `0` and `1`; `A = 𝔽₂(u)[[t]]`, `α² − tα − u` | `I = μ_n` (order `n`) at `0`, trivial at `1`; mod `t`, `α² = u`, so `f = 2` inseparable and `e = 1`; the other root `α + t ≡ α`, so `I = C₂` and `\|I\| = 2 ≠ e`; 09EE proof: `ef = \|I\|·\|Aut\|`, `2 = 2·1` (`stacks-09ED` lines 15570–15571); SGA 1 V §2 on pp. 92–96 (`sga1` lines 3788–3941) | true | none |
| One essentially small model (line 671) | the carrier of all statements | `Scheme.AffineEtale.sheafEquiv` and `isGrothendieckAbelian_sheaf_smallEtaleTopology` at the pin (`Sites/AffineEtale.lean` lines 140, 149); `Suggested.lean` uses only `smallEtaleTopology` | true | none |
| Bounded constructible and ctf (line 762) | `ℤ/2` over `ℤ/4` on a point; `⊕_{n≥0} Λ[n]` | `Torᵢ = ℤ/2` for all `i`, so unbounded Tor amplitude; constructible cohomology but not bounded; 095W and 03TQ (`stacks-0F1P` lines 6292, 6348): locally finite Tor dimension, which agrees with the README's global bound on quasi-compact `X` | true | none |
| Ring structure of a trait (line 1222) | `ℤ_(p)^h`; `𝔽_p(x)[t]^h`; ofStrictHenselization of `ℤ_(p)` | `𝔽̄_p`; `k(s)^sep ≠ k(s)^alg`, stalks equal; Noetherian local with `𝔪 = (p)` (Stacks Lemma 10.155.2 (4), tag 04GP) and `p` not nilpotent (flat), so a DVR; 06LJ (1)⇔(3) (`stacks-09ED` line 5346) | true | R04 (name) |
| Point counts, Scheme.Hom.pointCount (line 1321) | `Spec k`; `𝔸¹`; `ℙ¹`; `Spec 𝔽_{q²}`; `r = 0` | `1`; `qʳ`; `qʳ + 1`; `2` for even `r`, `0` for odd; `SplittingField 0 = k` (`natDegree 0`, `Construction.lean` line 213), count `#X(k)`; Mathlib's `FiniteField.Extension` lives in `Type` (`Extension.lean` line 48), which justifies the universe-`u` model; fixed points via `fromSpecFixedFieldEquiv` (`FixedField.lean` line 212) | true | R01 (description) |
| Classical/pro-étale comparison (line 1477) | bounded `K_n`; `μ_{ℓⁿ}` on `Spec ℚ` | `Rν_* Rlim ν^*K_n = Rlim Rν_*ν^*K_n = Rlim K_n` (BS 5.2.6 (2), line 1736); limit `0` in `Sh(X_et)` vs `ℤ_ℓ(1)` over `Spec ℚ̄` | true | R05 (universe) |
| Pro-étale coefficient ring objects (line 1498) | normalized systems with interval `[a,b]`; `E = ℚ_ℓ(√ℓ)`; `ℚ̄_ℓ,X` on `Spec 𝔽̄_p` | bounded on both sides, so 3.5.7 (4) (`D⁻`) and 5.2.6 (`D⁺`) both apply, the (B)-half argument of 5.5.4 (lines 1909–1913); `Λ_2 = 𝒪_E/ℓ` has length 2; sections `PadicAlgCl ℓ`, unbounded degrees excluded on quasi-compact `U` | true | R05 (universe) |
| Rational realization (line 1575) | nodal `ℙ¹/(0∼∞)`; normal `X`; `𝔾_m` | loop multiplier `ℓ`: `ℓ·ℓᵃℤ_ℓ ≠ ℓᵃℤ_ℓ`, no global lattice (BS Example 7.4.9, line 3326); normal implies geometrically unibranch, so BS 7.4.10 applies (line 3346); `H¹_c`, `H²_c` vs `H⁰`, `H¹` | true | R09 (locators) |
| Continuous actions (line 1650) | `X_{k^sep} = lim X_{k′}`; restriction to `𝔽_{qʳ}` | 09YQ needs quasi-compact quasi-separated `Xᵢ` and affine transition maps (`stacks-0F1P` line 3458), as the locator says; `Frob ↦ Frobʳ`; geometric Frobenius `q⁻¹` on `ℚ_ℓ(1)` | true | none |
| Regular-immersion classes (line 1727) | cusp `V(y² − x³, t) ⊂ 𝔸³`; Cartier `T = 0` | regular sequence, `Z` singular at `0`, codimension 2; LRZ Definition 3.3.2 (constant term of the monic relation of `cℓ(−E)`, `lrz-relative-poincare` line 1314), Proposition 3.2.5 (line 1277), Lemma 3.4.1 (line 1493) | true | none |
| F.5 Theorem (line 1804) | right adjoint; base change along `g = i : {0} → 𝔸¹`; dual of `ℤ_ℓ/ℓ` | 0G2C (`stacks-0F7H` line 2136); `g'^*i^!Λ = Λ(−1)[−2]` vs `f'^!g^*Λ = Λ`, but 0GLE form `i^!Rg_*Λ = Λ = Rg'_*Λ`; `Ext¹(ℤ/ℓ, ℤ_ℓ)[−1] = (ℤ/ℓ)[−1]` | 0G2C and Check true; "base change" unnamed | R06 |
| F.6 Theorem (line 1874) | `𝔸² → 𝔸¹ → S`; degree-2 point `y = 0, x² = 2` on `ℙ²_ℚ`; ILO XVI §2.5 | `Λ(1) ⊗ Λ(1) ≅ Λ(2)`; `E ≅ ℙ¹_{ℚ(√2)}`, `E·E = −2`; the source needs no regularity (`ilo-travaux-de-gabber` line 11321) | true, narrower than source | R07 (b) |
| constructibleSheaf_iff_exists_global (line 218) | `ℙ¹` over `k[x₁,x₂,…]`; `⊔_ℕ` components | quasi-compact quasi-separated, space not Noetherian: 095E gives the global stratification, the README's statement says nothing; the non-quasi-compact case fails (Check at line 203) | true, narrower | R07 (a) |
| Gauss–Bonnet (line 1901) | `ℙ²`; `ℙ¹ × ℙ¹`; abelian variety; `Spec 𝔽_q` | `3 = 3`; `4 = 4`; `0 = 0`; `deg c_0 = 1` vs arithmetic `χ = 0` | true over closed `k`; prose false | R08 |
| F.0.2 `*Needs:*` (line 344) | SchemeAndStackFoundations §§2.10, 2.15 on main | comparison morphisms only; cohomology limits only; 01ZM and 07RP are in §0.9 | mis-pointed | R03 |
| Stalk Frobenius, Frobenius class, Weil group (lines 252, 627) | `μ_5` over `𝔽_2`; `Spec 𝔽_q`; `ℤ[i, 1/2]` | `Φ(ζ) = ζ^{2⁻¹ mod 5} = ζ³`, arithmetic gives `ζ²`; Weil group `{(Φⁿ, n)} ≅ ℤ`; trivial class iff `p ≡ 1 mod 4` | true | none |
| Tate twists (line 402) | `ℤ/12` with `N = 24`; `ℤ/p` on `Spec 𝔽_p` | `μ_24 ⊗ ℤ/12 ≅ μ_12` (`ζ ↦ ζ²`, kernel `μ_2`) needs `6` invertible; `μ_p = 1` on reduced schemes, so `Λ(1) = 0` | true | none |
| Lower shriek, 0.8 Check (line 903) | `𝔸¹/k̄`, `Λ = ℤ/ℓ` | true `H²_c = Λ(−1)`; naive `R²Γ_c = colim_Z ⊕_{a∈Z} H²_a = ⊕_{a∈k} Λ(−1)`; the sum map has nonzero kernel | true | none |
| Local acyclicity Check (line 885) | `i_*𝔽_ℓ ⊗ j_*𝔽_ℓ` on `𝔸²` over `𝔸¹` | stalk `𝔽_ℓ` at `(0,0)`, zero elsewhere; nearby fibre cohomology `0` | true | none |
| Lisse direct image Check (line 1077) | Kummer `𝓛` with `T = −1` on `𝔽_3` | `H⁰ = 𝔽_3^{T}` = 0, `H¹ = 𝔽_3/(T − 1) = 𝔽_3/(−2) = 0`, so `Rj_*𝓛 = j_!𝓛` | true | none |
| Lattice Checks (lines 1261, 1269) | `⟨ℓ⟩ ⊂ GL_1(ℚ_ℓ)`; `[[1,a],[0,1]]` | `ℓ·ℓᵃℤ_ℓ = ℓᵃ⁺¹ℤ_ℓ`; `L = ℤ_ℓe₁ ⊕ ℓℤ_ℓe₂` stable, index `ℓ`, not homothetic to `ℤ_ℓ²` (index `ℓ^{2v(c)}`); `L^∨ = ℤ_ℓe₁^∨ ⊕ ℓ⁻¹ℤ_ℓe₂^∨` stable under `[[1,0],[−a,1]]` | true | none |

Remarks, no change requested:
- `arithmeticExactSequence` assumes only quasi-compactness, as SGA 1 IX 6.1 does (`sga1` lines 7736–7741). Stacks 0BTX assumes quasi-compact and quasi-separated (`stacks-0BMY` line 1768), and its limit step (0BTV) is where quasi-separatedness enters. No counterexample at the weaker hypothesis was found, so the cited generality stands.
- `subsingleton_ellAdicCohomology` and `etaleCohomologicalDimension` keep the prime-to-characteristic hypothesis, which the bounds do not need (`p`-cohomological dimension `≤ dim + 1 ≤ 2 dim` for `dim ≥ 1`).

### Library declarations opened at the pins

- **Mathlib** (`1b1ccf4b`):
  - `Sites/ElladicCohomology.lean` lines 54–87;
  - `Sites/AffineEtale.lean` lines 140–155;
  - `Sites/EtalePoint.lean` lines 63, 123;
  - `CategoryTheory/Sites/SheafCohomology/Basic.lean` lines 57, 112;
  - `FieldTheory/Finite/Extension.lean` lines 48–99;
  - `FieldTheory/SplittingField/Construction.lean` line 213.
- **Tau Ceti** (`2fd255d9`):
  - `AlgebraicGeometry/FiniteEtale/Fiber.lean` lines 117, 179;
  - `FiniteEtale/Galois/FundamentalGroup.lean` lines 199–240;
  - `RationalPoint/Count.lean` lines 43–61;
  - `RationalPoint/FixedField.lean` lines 212–262;
  - `FieldTheory/Finite/SepClosedSubfield.lean` lines 173, 190;
  - `Compactification/Basic.lean` lines 50–77, 115;
  - `RingTheory/StrictHenselization/Algebra.lean` line 75, `MaximalIdeal.lean` line 80, `Henselian.lean` line 45.

### Cross-roadmap citations resolved

- **SchemeAndStackFoundations on main.** §§0.3, 0.8, 0.9, 0.12–0.14, 0.21, 0.23–0.23a, 0.29, 1.1, 2.1, 2.2, 2.5, 2.7, 2.9–2.11, 2.15–2.17, 4.11, 5.3–5.5 all exist. Names resolved: `muEtale`, `universalHomeomorphismEtaleEquivalence`, `Sheaf.H.pullback`, `finite_presentation_limits`, `etale_cohomology_limits`, `relativeProj`, `normalBundle`, `deformationToNormalCone`, `projectiveBundle_dual_convention`, and the five `SchemeFrobenius.*` names (line 432).
- **EnhancedDerivedSheaves §§0.1–0.4** (lines 429–492): all six `ClassicalDerived.*` names.
- **DerivedModuleAlgebra** §§0.I.1, 0.2, 1.1–1.5, 1.T.1 and 1.E.0 (`PerfectComplex.IsPerfect`).
- **Other suppliers:** DGAInfinity Layer 5; PadicMeasuresIwasawaAlgebras §5.1; StableReduction Layer 4; ModularCurves 4D; AlgebraicCurves Layers 8 and 12; BelyiMaps §§12.5–12.6; ProfiniteArithmetic Layers 0–1 (`Completed/`); GrothendieckEulerForms Layers 2 and 5; PerfectoidSpaces P5.10–P5.12.
- **Open revisions:** R02 and R04 record the two citations whose content only an open revision defines.
- **Citations tool leads:** its 12 Lean-name leads are this file's four `VanishingCycles.*` theorems, EnhancedDerivedSheaves and SchemeAndStackFoundations names on main, and `Scheme.toProEt` (R02). None is missing where the README cites it.

### Ownership against open pull requests

Checked with `roadmaps grep`, by object, for every object this roadmap owns:
- the étale `π₁` as `Aut` of Tau Ceti's fibre functor;
- geometric points, EtalePath and the Weil group;
- constructible, locally constant and lisse predicates;
- adic systems and lower shriek;
- `IsInvertibleOn`;
- point counts.

Only R01's point count has another owner. ClassFieldTheory's `WeilGroup` is the Weil group of a field, a different object. FunctionFieldArithmetic's `pointCount` counts places of a function field. The overlaps tool lists no conflicting head and no dropped id.

## Not verifiable

- **SGA 4, SGA 4½, SGA 5, Huber (1996), Fujiwara (2002), Ribet (1976).** The manifest records these as uncertified, and no legal copy exists. Sampled targets that rest on them were checked through their Stacks, ILO or LRZ parallels: F.5, F.6 and the regular-immersion classes.
- **Li–Reinecke–Zavyalov page numbers.** The cached arXiv text has unreliable page markers (empty consecutive markers before §3). The pages cited for Proposition 3.2.5, Definition 3.3.2 and Lemma 3.4.1 (pp. 24–25, 27–28) were checked against its table of contents only (`lrz-relative-poincare` lines 24–26).
- **Bhatt–Scholze numbering.** Read as the cached author text; not compared with the Astérisque print.

## Source issues

- **Misprint** in stacks-03SW at Theorem 64.16.1 (tag 03UG), proof, Step 1, printed p. 19. The source writes the `U` summand as `T''(U, i⁻¹K)`, and writes `π*_x` for the global operator in two places. It should read `T''(U, j⁻¹K)`, and `π*_X` for the Frobenius acting on `RΓ_c(X_k̄, K)`. Affects nothing.
