# Review of SemiringSchemes (pull request #2466 at 04744a3)

**Verdict:** needs changes

## R01 (P2) — Layer G plans internal-module theory that the pinned Tau Ceti already has

**Location** `TauCetiRoadmap/SemiringSchemes/README.md` lines 139–140: "relative tensor products, scalar extension and the required coherence are targets there"; §G.0 lines 279–280 and 287–288; §G.1 line 322 ("identify coproducts over the tensor unit"); lines 144–146 name one Tau Ceti file only.

**Claim** The forgetful functor of internal modules creating limits and colimits, the balanced tensor product, the symmetric monoidal closed structure on `Mod C A` and binary coproducts of `CommMon C` are stated as targets; they exist at the Tau Ceti pin and must be cited, not planned.

**Witness** Pinned `TauCeti/CategoryTheory/Monoidal/Mod/Limits.lean:145` (`CategoryTheory.Mod.forgetCreatesLimits`), `Mod/Colimits.lean:189`, `Mod/Tensor.lean:121` (`Mod.monoidalCategory`), `Mod/Symmetric.lean:99`, `Mod/Closed.lean:157` (`Mod.monoidalClosed`), `CommMon.lean:123` (`CommMon.binaryCofanIsColimit`).

**Repair** Add `### From Tau Ceti` listing these with their hypotheses (coequalizers preserved by tensoring on both sides; `MonoidalClosed`, equalizers), plus `Mod.tensorπ`, `Mod.tensorDesc`, `Mod.internalHom`, `TauCeti.freeModAdjunction`. Delete G.0's first bullet and the closed-structure clause of its third. In G.1 define extension along `f : A ⟶ B` as `Mod.tensorObj` of `B` (restricted along `f`) with `M`; keep as targets only what the pin lacks: the adjunction with `Mod.comap f` (`Mod/Comap.lean` treats isomorphisms only), Beck–Chevalley, pushouts and general colimits of `CommMon C`, `CommMon (Mod C A) ≌ Under A`, the semiring dictionary.

## R02 (P2) — The comparison of congruence and categorical finite presentation is statable at the pins and absent

**Location** `TauCetiRoadmap/SemiringSchemes/Suggested.lean` lines 14–15: "the comparison of categorical and congruence finite presentation requires §G.0's semiring/internal-monoid equivalence".

**Claim** README §0.4 (lines 494–497) states this comparison in `Under (CommSemiRingCat.of R)`, with no internal monoid; it is what makes the concrete `RingHom.IsZariskiOpen`, hence `zariskiTopologyTV_eq_principal`, Toën–Vaquié's Definition 2.9. The reason given for omitting it is not true at the pins.

**Witness** A scratch copy with `Algebra.CongrFinitePresentation A B ↔ IsFinitelyPresentable.{u} (Under.mk (CommSemiRingCat.ofHom (algebraMap A B)))` for `(A B : Type u) [CommSemiring A] [CommSemiring B] [Algebra A B]` elaborates with one `sorry` warning.

**Repair** Add that statement as `theorem Algebra.congrFinitePresentation_iff_isFinitelyPresentable` in Layer 0, with a docstring, and delete the clause from the module docstring.

## R03 (P3) — `SemimoduleCat ℕ` and `zariskiTopology ℤ` exist in universe 0 only

**Location** README lines 95–96: "use `SemimoduleCat ℕ` as the Lean base"; line 291: "the equivalence `CommMon (SemimoduleCat ℕ) ≌ CommSemiRingCat`"; line 890; line 1033: "`TauCeti.CommAlgCat.zariskiTopology ℤ`".

**Claim** The roadmap's semirings are in `Type u`; the monoidal structure of `SemimoduleCat.{u} R` needs `R : Type u`, so the base as written gives `CommSemiRingCat.{0}` only. G.0 already writes `ModuleCat (ULift ℤ)` for rings.

**Witness** `Mathlib/Algebra/Category/ModuleCat/Monoidal/Basic.lean:156` with `R : Type u` (line 41). Scratch: `CommMon (SemimoduleCat.{u} ℕ)` fails (`MonoidalCategory (SemimoduleCat ℕ)` not synthesized); `CommMon (SemimoduleCat.{u} (ULift.{u} ℕ))` elaborates. FunctorOfPoints §2.4: `CommAlgCat.{u} (ULift.{u} ℤ) ≌ CommRingCat.{u}`.

**Repair** Write `SemimoduleCat.{u} (ULift.{u} ℕ)` at lines 96, 290–291 and 890, and `TauCeti.CommAlgCat.zariskiTopology (ULift.{u} ℤ)` at line 1033; in the G.0 Check replace "(with universe lifts as required)" by "the tensor unit corresponds to `ULift ℕ`, respectively `ULift ℤ`".

## R04 (P3) — Backticked names of this roadmap's own that `Suggested.lean` does not declare (gate: `readme-ids-missing`, 9)

**Location** README lines 470, 494, 540, 553, 720: `CommSemiRingCat.regularEpi_iff_surjective`, `Algebra.congrFinitePresentation_iff_isFinitelyPresentable`, `RingCon.zeroIdeal_mono`, `Ideal.toRingCon_sup`, `Ideal.toRingCon_iSup`, `RingCon.isSubtractive_zeroIdeal`, `Module.limitFaithfullyFlat_iff_surjective_comap`.

**Claim** Unchanged since the previous review (its R07): a backticked name of the roadmap's own claims a declaration in `Suggested.lean`; these do not exist there, and the gate fails.

**Witness** Gate at 04744a3: `readme-ids-missing=9`, every other check 0. The other two names, `Algebra.isEpi_iff_forall_one_tmul_eq` (line 186) and `PrimeSpectrum.isClosedEmbedding_comap_of_surjective` (line 596), are Mathlib's (`Mathlib/Algebra/Algebra/Epi.lean:31`; `Mathlib/RingTheory/Spectrum/Prime/Topology.lean`, section at 407–440).

**Repair** State the facts in prose without the names (line 470: "A morphism of `CommSemiRingCat` is a regular epimorphism if and only if it is surjective; …"); line 494 is settled by R02. Do the same for the undeclared names the gate does not list (`Ideal.toRingCon_eq_ringConGen`, `RingHom.ker_eq_zeroIdeal`, `RingCon.zeroIdeal_toRingCon`, `RingHom.CongrFinitePresentation`, `RingHom.LimitFlat`, `limitFaithfullyFlat_pi_away_iff`, `Module.LimitFaithfullyFlat.comonadic`, and those of Layers 3–6).

## R05 (P3) — `Suggested.lean` keeps definitions no theorem uses, and six of its names are absent from the README

**Location** `Suggested.lean` lines 40–41 (`Relative.Affine`), 53–55 (`Relative.extendScalars`), 58–61 (`Relative.IsZariskiOpen`); also `restrictScalars`, `restriction_isRightAdjoint`, `JointlyConservative`.

**Claim** A definition stays only to make a headline statable: no theorem of the file mentions `Affine`, `extendScalars` or `Relative.IsZariskiOpen`. Every Lean name must appear in the README: none of the six does.

**Witness** `grep` of the README for each of the six names: 0 hits. In the file, `Affine` occurs once (its definition); `extendScalars` only inside `Relative.IsZariskiOpen`; the latter nowhere else.

**Repair** Delete `Relative.Affine`, `Relative.extendScalars` and `Relative.IsZariskiOpen` from `Suggested.lean` (G.0, G.1 and G.3 keep them as prose targets). Name the kept three where the README states them: `restrictScalars` and `restriction_isRightAdjoint` in §G.1, `JointlyConservative` in §3.2 (whose "faithfully flat product" then reads "a finite subfamily that jointly detects bijectivity after extension of scalars, as in §2.3's last bullet").

## R06 (P3) — `Suggested.lean`: generality of the Layer G statement, docstrings

**Location** `Suggested.lean` lines 48–50 (`[MonoidalClosed C] [HasLimits C] [HasColimits C]`), lines 5–21 (module docstring), and the declarations at lines 69, 73, 89, 92, 95, 101, 114, 117, 120, 125.

**Claim** README §G.1 constructs the left adjoint from reflexive coequalizers preserved by tensoring and says "This construction does not need closedness or all colimits"; the Lean hypotheses differ and `[HasLimits C]` plays no part. Ten declarations have no docstring; the module docstring does not say that README.md is the roadmap, and omits §6.2–§6.3.

**Witness** The statement elaborates unchanged with `[MonoidalClosed C] [HasColimits C]` only (scratch, one `sorry` warning). Unchanged from the previous review's R09 for the docstrings.

**Repair** Drop `[HasLimits C]`, and say in §G.1: "The Lean statement assumes a closed base with all colimits; the form under reflexive coequalizers preserved by tensoring is the target." Docstring: "…: target signatures. The roadmap is README.md; this file is not the roadmap. … Not statable at the pins: … the semiring structure sheaf and the Γ–Spec adjunction (§6.2–§6.3), for lack of `LocallySemiringedSpace`." Add a docstring stating the mathematics to each of the ten declarations.

## R07 (P3) — Checks, Examples and `*Needs:*` lines are still missing for most definitions and layers

**Location** README §0.4, §1.1, §1.5, §2.1, §2.3, §3.1, §3.2, §3.4, §4.1, §4.2, §4.5, §6.1, §6.2, §6.5 (no `**Checks.**`); Layers G, 0, 2, 3, 4, 5, 6 (no `### Examples`; Layer G no `### Dependencies`); §1.1–§1.4, §2.1–§2.4, §3.1–§3.5, §4.1–§4.5, §5.1–§5.4, §6.1–§6.5 (no `*Needs:*`).

**Claim** Each definition carries at least three discriminating Checks, each layer ends with `### Examples` and `### Dependencies`, each target has its `*Needs:*` line. Since the previous review (its R12) only Layer G and §5.0 gained them.

**Witness** `**Checks.**` or `**Check.**` occurs in §G.0–§G.3, §0.1, §0.3, §1.2, §1.4, §2.2, §4.3, §5.0, §5.1 only; `### Examples` at line 621 only; `*Needs:*` in Layer G, §0.1–§0.4, §1.5, §5.0 only.

**Repair** Add Checks, for instance: §0.4 `ℤ = ℕ[y] ⧸ (1 + y ~ 0)`; the zero algebra with `n = 0` and the pair `(1, 0)`; `ℕ[x₁, x₂, …]` as non-example. §1.5 `c = (1 ~ 2)` on `ℕ` at powers of `2`: quotient `𝔹`. §2.1 `ℤ` over `ℕ` fails on `1·1 + 1·(−1) = 0` (forces `a = 0`); `M = 0` with `n = 0`; `M = R` with `n = 1`. §2.3 `ℕ[1/2] × ℕ[1/3]` over `ℕ` is not faithfully flat (`span {2, 3} = ℕ \ {1}`) although `ℤ[1/2] × ℤ[1/3]` over `ℤ` is; `ℤ`, `ℤ ⧸ 2` over `ℤ` as the non-flat conservative family. §3.2 `A = 0`: the empty family covers in both precoverages; `A ≠ 0`: in neither. §6.1 `ℕ` is local (units `{1}`), `ℕ × ℕ` is not. Move computed Pitfalls under `### Examples` and add the `*Needs:*` lines.

## R08 (P3) — Locators missing or pointing at names the pin does not have

**Location** README line 1114 ("Mathlib's proofs of `toBasicOpen_injective` and `toBasicOpen_surjective`"); line 1141 ("as for rings in Demazure–Gabriel I §1"); lines 1213–1216 (Katsov–Nam–Zumbrägel "§5"; Golan with no section or page); line 1218 ("followed in §6.4"); §0.1–§0.3, §1.5, §4.4, §6.1–§6.3 (no locator).

**Claim** At the pin the two lemmas are named `toBasicOpenₗ_injective` and `toBasicOpenₗ_surjective`; Katsov–Nam–Zumbrägel is cited nowhere in the text; Golan and Demazure–Gabriel carry no checkable locator; the listed sections cite nothing (previous review's R13, partly repaired).

**Witness** `Mathlib/AlgebraicGeometry/StructureSheaf.lean:421` and `:486` (`toBasicOpenₗ_injective`, `toBasicOpenₗ_surjective`); no declaration `toBasicOpen_injective` at the pin. BJ24 lines 330–337 state the limits and colimits of `Mod(R)` and `CAlg(R)`.

**Repair** Line 1114: use the two pinned names. §0.1–§0.2: cite Borger–Jun §2. Delete the Katsov–Nam–Zumbrägel entry or cite it where it is used. Give section and page for Golan (Bourne congruence, k-ideals) and the numbered statement of Demazure–Gabriel I §1 used in §6.4; line 1218: "the functor-of-points comparison for rings". Give a locator or "proved here" for §1.5, §4.4, §6.1–§6.3.

## R09 (P3) — Process narrative and supplier-contract shape

**Location** README line 149 ("The compiled `Suggested.lean` consumes these interfaces directly."); lines 685–688 ("The prototype states …; its definitions and comparisons must record those transports."); lines 806–807 ("they are not supplier instances assumed here"); lines 882–884 ("not an undefined notion of finite presentation on an arbitrary site"); line 302–303; line 1155; heading line 231.

**Claim** These sentences answer an earlier discussion instead of stating mathematics; a reader cannot tell what they exclude without that discussion. The supplier heading is `### From TauCetiRoadmap.FunctorOfPoints`, and Tau Ceti's file is listed under `### From Mathlib`.

**Witness** Line 883: "The generic site theorem assumes the displayed source-locality property, not an undefined notion of finite presentation on an arbitrary site." The sentence before it already states the hypothesis.

**Repair** Delete line 149, lines 882–884 from "The generic site theorem", the clause of lines 302–303 after "additivity", and line 1155's "The construction and comparison in this layer are required proof targets;". Lines 685–688: "The Lean statement takes all three in one universe `u`; the statement for test semimodules in a larger universe follows by universe lifts and the finite-free criterion." Lines 805–807: "Marty (Theorems 3.7 and 3.8) proves the same in a strong relative context; that route needs his context hypotheses for commutative monoids." Rename the heading at line 231; move lines 144–146 under `### From Tau Ceti` (R01).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.4 `CongrFinitePresentation` | zero algebra; `ℤ` over `ℕ`; two presentations | `n = 0`, kernel `⊤ = gen (1,0)`; `ℕ[y]⧸(1+y~0)`; kernel is the image of a finitely generated kernel; TV05 line 619, BJ24 lines 738–800 | holds | R02, R07 |
| §1.1 `Ideal.gc_toRingCon` | `I = ℕ \ {1}`, `c = (1 ~ 2)`, `c = ⊤` | `toRingCon I = ⊤` (`1+2 = 0+3`), GG13 lines 359–362; zero class of `1~2` is `⊥`; both sides agree | holds; not one tactic | R07 |
| §1.3 `toRingCon_zeroIdeal_of_isAddUnit` | `c = ⊤`; `ℕ → ℤ/n` | `⊤`; `a + (b+e) = b + (a+e)` with `a+e`, `b+e` in the zero class | holds | none |
| §1.4 `range_comap_mk'` | `c = ⊥`, `c = ⊤`, `𝔹[x] → 𝔹` | all primes; none (`0 ∈ p`, `1 ∉ p`); `{⊥}`, not closed since `(x)` is prime; GG13 lines 544–549 | holds | none |
| §0.3 `epi_iff_isEpi` | `ℕ → ℤ`; `ℕ → ℕ[x]` | `ℤ ⊗ ℤ → ℤ` bijective; `x ⊗ 1 ≠ 1 ⊗ x` | holds | none |
| §2.1 `limitFlat_iff_preservesFiniteLimits` | `M = 0`, `M = R`, `ℤ` over `ℕ` | `n = 0`; `n = 1`; `a₁ⱼ + a₂ⱼ = 0` forces `a = 0`, not flat; BJ24 lines 445–451, 478–483 | holds | R07 |
| §2.2 `LimitFlat.flat`, `limitFlat_iff_flat`, `IsLocalization.limitFlat` | `ℕ → ℕ ∪ {∞}` tensored with `ℤ`; rings; `0 ∈ M` | `ℤ → 0` not injective; relation `∑ (rᵢ − sᵢ) xᵢ = 0` both ways; `S = 0`; BJ24 lines 382–392 | holds | none |
| §G.1 `restriction_isRightAdjoint` | `f = 𝟙`; `ℕ → ℤ` | `Mod.comap (𝟙 A) ≅ 𝟭`; left adjoint `ℤ ⊗[ℕ] −`; elaborates without `[HasLimits C]` | holds | R01, R06 |
| §G.2 covers | `ℤ → ℤ`, `ℤ → ℤ/2` | jointly conservative through the first member, second not flat; TV05 lines 307–347, 414 | consistent with §2.3 | none |
| §3.2 the two precoverages | `A = 0`; `A ≠ 0`, empty family; `R₁ × R₂` | both cover; neither (`span ∅ = ⊥`, some `φ` not bijective); projections, `e₁, e₂` span `⊤`; TV05 lines 628–646 | consistent | R05, R07 |
| §3.3 `exists_away_cover` | `B = 0`; `f = id`; `g = 0` | `n = 0`, `⊥ = ⊤`; `g = 1`; excluded unless `B = 0` (`span {0} = ⊥`); DiklichZelich2026 lines 819–840 | holds | none |
| §3.3 `zariskiTopologyTV_eq_principal` | principal ≤ TV; TV ≤ principal | BJ24 lines 663–664; images cover `PrimeSpectrum A` (DiklichZelich2026 line 807), members covered by `A[1/g]` | holds | R02 |
| §4.1 generic layer | `P` = isomorphisms; converse of TV05 Lemma 2.14 | opens are `∅` and `X`; `Yᵢ ≅ Yᵢ ×_Y Z → Z` in `P` by base change, so the stated source-locality suffices; TV05 lines 728–777 | holds | R09 |
| §4.2 scheme category | `Spec 0`; affines | initial sheaf (empty cover of `0`); `Spec (B ⊗[A] C)`; TV05 lines 862–863 | holds | R07 |
| §4.3 examples | `A = 0`, `A ≠ 0`; `ℙ¹_𝔹` | empty affine; sections `A[x,y]`, point `(0,0)` missing; sections `𝔹`, three `𝔹`-points against one | holds | none |
| §4.4 affine morphisms | identity; `Spec B → Spec A`; `𝔸² \ {0} → 𝔸²` | affine; pullback `Spec (A' ⊗[A] B)`; not affine for `A ≠ 0` | holds | R08 |
| §5.1 group completion | `𝔹`, `ℚ≥0`, non-ring `A` | `0`; `ℚ`; `𝔹 ⊗ A ≠ 0` (BJ24 lines 116–117); `ℤ` not initial | holds | none |
| §5.2 Zariski data | `ℤ ⊗ A`-module `N`; `ℤ → ℤ[1/2]`, `ℤ → ℤ/2` | `N ⊗[A] B` is a group, TV05 lines 1150–1160; open immersion; not flat | holds | none |
| §5.3 adjunction | `Hom(Spec R, Spec A)`, `R` a ring | `Hom(A, R) = Hom(ℤ ⊗[ℕ] A, R)`: inclusion is the left adjoint; TV05 lines 1163–1165 | holds | R03 |
| §5.4 comparison | `A = 𝔹`; `A` a ring | empty scheme; `ℤ ⊗[ℕ] A = A`, so `ofScheme ⋙ toScheme ≅ 𝟭` | holds | none |
| §6.1 local semirings | `a + b = u`; `ℕ`; `ℝ≥0 → 𝔹` | `a/u + b/u = 1` contradicts `IsLocalRing`; units `{1}`, local; quotient of a semifield | holds | R07, R08 |
| §6.2 structure sheaf | `R = 0`, `𝔹`, `ℕ` | empty space, `Γ = 0`; one point, `Γ = 𝔹`; `Γ(D(2)) = ℕ[1/2]`, stalk `ℕ` at `ℕ \ {1}` | holds | R08 |
| §6.3 Γ–Spec | `Spec 𝔹 → Spec ℕ`; unit on `Spec ℕ` | one map, image the prime `{0}`; non-units of the stalk at `ℕ \ {1}` pull back to `ℕ \ {1}` | holds | R08 |

- Source locators checked against the text: 61, in TV05, BJ24, DiklichZelich2026, GG13, Mar07 (Mar07 lines 673–682 and 738–739 for Theorems 3.7, 3.8, 3.13); all confirmed except those in R08.
- Library declarations opened at the pin: over 60, among them `Mathlib/CategoryTheory/Monoidal/Mod.lean:406`, `Mathlib/CategoryTheory/Functor/ReflectsIso/Jointly.lean:33`, `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`, `Mathlib/RingTheory/Flat/Basic.lean:33–35`, `Mathlib/Algebra/Category/Ring/Limits.lean:255`, and the Tau Ceti files of R01; no `CommSemiRingCat`, `SemimoduleCat` or `RingCon` development in Tau Ceti.
- Cross-roadmap citations resolved: 7, all in FunctorOfPoints at its open head (§0.1, §1.2, §2.1, §2.4 and the six names); its Scope names SemiringSchemes §4.1 as owner of the generic layer.
- Dependency check: `depcheck: 261 roadmaps, 2595 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at 04744a3: FAIL on `readme-ids-missing=9` (R04) only; build passes; nothing changed outside the folder.
- Elaboration: 11 `sorry` warnings and nothing else; the elaborated types of all 25 declarations compared with the README (no section binder lost; differences in R03, R06); the probe `first | rfl | infer_instance | simp | exact?` closes none of the 11 theorems.
- Previous review: R01–R06, R08, R10, R11 repaired at this head; R07 not (R04 here); R09, R12, R13, R14 partly (R06–R09 here). The pull request's text agrees with this head (pins, files, supplier).

Overlap check: read FunctorOfPoints, CommRingFactorizationSystems, QuasicoherentSheavesOnPrestacks, ClassifyingTopoi, SchemeAndStackFoundations; the generic open-immersion-site layer is owned by SemiringSchemes §4.1 and the comparison with Mathlib's `Scheme` by FunctorOfPoints §2.4, each cited by the other; nothing shared with the rest (their descent is for rings, schemes or animated rings).

Source independence: 11 passages compared with 5 sources, none shared; largest share BJ24, 26 of 69 locators (TV05 25); contents compared with BJ24 and TV05: independent (TV05 §2.1–§2.5 fall in §G.2, §G.3, §4.1, §5.0 in the order that the `*Needs:*` lines of §G.3 and §5.0 force; Layers 0, 1, 6 and §3.3, §4.5 have no counterpart).

Research link: Layers G, 4, 5 are the relative schemes of Toën–Vaquié (2009) for commutative monoids; §3.3 settles the question of Borger–Jun (2024, Remark 5.2) by Diklich-Zelich (2026, Theorem 1.3.10) and Marty (2007); §4.5 and §6.5 are the closed subschemes of Giansiracusa–Giansiracusa (2016). Rests on the README and the sources read.

## Not verifiable

- Demazure–Gabriel, *Groupes algébriques I*, Chapitre I §1 (README §6.4): text not read; no numbered locator to check.
- Golan, *Semirings and their Applications* (README References): text not read; cited without section or page.
- Katsov, *On flat semimodules over semirings* (README §2.1): paywalled; the attribution was checked only through BJ24 line 396.
- Katsov–Nam–Zumbrägel (README References, "§5"): not read; the README text cites it nowhere.
- Ownership against the board's packages: the index lists two packages, neither on this subject; their texts were not read.

## Source issues

- **Misprint** in DiklichZelich2026 at Definition 1.3.3, printed page 21: the source says a faithful algebra is one for which a map is an isomorphism exactly when its base change is injective; it should be exactly when its base change is an isomorphism; affects nothing.
- **Misprint** in DiklichZelich2026 at the paragraph after Theorem 0.0.2, abstract: the source says the result was obtained independently by Florian Murty; it should be Florian Marty, the author of its reference [1]; affects nothing.
- **Misprint** in DiklichZelich2026 at Proposition 1.3.6, printed page 24: the source says to take any ideal `p` of `A` in the last step; it should be any prime ideal, since `A_p` is formed; affects nothing.
- **Gap** in DiklichZelich2026 at Claim 1.3.7, printed pages 23–24: the source says faithful flatness makes a map surjective once its base change is; it should factor through the image and use that flat base change preserves injections, since faithfulness is defined for isomorphisms; affects the proof.
- **Misprint** in DiklichZelich2026 at Claim 1.3.11, printed page 25: the source says the colimit algebra is the colimit of itself; it should be the colimit of the algebras `A_i`; affects nothing.
- **Misprint** in TV05 at the proof of Corollaire 2.22, page 27: the source says the equivalence relation satisfies the conditions of Proposition 2.21; it should be Proposition 2.18, as the same proof says three lines later; affects nothing.
- **Misprint** in BJ24 at §2, page 8: the source says the cancellation implication for a commutative monoid `M` holds in `R`; it should be in `M`; affects nothing.

## For the human reviewers

- Scope: the headline of §3.3 rests on DiklichZelich2026, a 2026 doctoral thesis read from its author's page, and on the preprints BJ24 and Mar07; BJ24 Remark 5.2 records the statement as open. Only TV05 and GG13 are journal articles.
- Licence: DiklichZelich2026 carries "© 2026 … All rights reserved" (line 14) and was read from the author's university page, classed here as an author page.
- Licence: the description says an AI tool adapted the folder from a "supplied draft" kept in another repository and pull request; that draft was not available to compare.
- The description says "Do not merge without his explicit approval" (James Borger's) and that the revision "does not claim to discharge every finding of the AI review".
- Not tested: Demazure–Gabriel, Golan, Katsov and Katsov–Nam–Zumbrägel were not read; none has a large share of the locators.
