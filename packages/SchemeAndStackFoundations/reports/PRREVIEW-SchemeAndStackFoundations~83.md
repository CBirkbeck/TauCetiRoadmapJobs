# Review of SchemeAndStackFoundations (pull request #1656 at 9f9266a)

**Verdict:** needs changes

This is a full review. The folder changed by 8,912 lines since `73bec93`, almost all from merging main's rewrite of the folder (now on main as `c20f72af`). Against main the pull request adds 1,220 lines and removes 323, in `README.md` and `Suggested.lean` only. The previous review (of `73bec93`) was accepted with no findings, so there is nothing to carry. The JacobianChallenge mutual-supply point that the reviews of the merged sibling revision settled (repair report H01) is not re-raised. There are four findings, all P3: none is blocking. The gate passes, `Suggested.lean` elaborates, the dependency check is clean, and nothing in `Suggested.lean` is padding.

## R01 (P3) — §0.7a names §4.18's `generic_projection` as its consumer, but §4.18 does not consume it

- **Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1097–1099`: "the general linear projection of §4.18 (`generic_projection`) needs parameters that are linear forms in the given coordinates. This subsection supplies the linear form of the theorem." The consumer side is `README.md:7372–7380` (`generic_projection`), the §4.18 *Needs:* line at `:7425–7426`, and Layer 4's Dependencies at `:7729–7732`.
- **Claim.** The edge §0.7a → §4.18 is recorded only on the supplier's side. The route for `generic_projection` does not name its input. The §4.18 *Needs:* line lists "§4.11, §4.13, §4.15, §4.16, §4.17; StableReduction Layers 1, 3, 4; …". Layer 4's Dependencies list §0.9, §§0.17–0.21 and §0.23 from Layer 0. An implementer of §4.18 is not pointed to the theorem added for this purpose, and the build order misses the edge.
- **Witness.** In the README, "0.7a" occurs only at lines 539, 1089 and 1098. None of these is in §4.18 or in Layer 4's Dependencies.
- **Repair.** In `generic_projection`, derive the finite projection from §0.7a's `exists_linear_normalization`. Apply it to the homogeneous coordinate ring `k[x_0, …, x_N]/I_X` with its degree-one generators. This gives `d + 1` linear forms `y_i` over which that ring is module-finite, so `V(y_0, …, y_d) ∩ X = ∅` and projection from this centre is finite onto `ℙ^d_k`. Then add §0.7a to the §4.18 *Needs:* line and to Layer 4's Dependencies. Test it on the twisted cubic `[s³ : s²t : st² : t³] ⊂ ℙ³`: `y_0 = x_0`, `y_1 = x_3` works, since `(s²t)³ = (s³)² t³` is integral over `k[s³, t³]`. The centre `x_0 = x_3 = 0` misses the curve, and the map `[s³ : t³]` is finite of degree 3.

## R02 (P3) — `Curve.isAffine_or_isProper` drops quasi-compactness beyond its README target and its locators

- **Location.** `Suggested.lean:734–739` takes `[LocallyOfFiniteType (X ↘ Spec (.of k))]` and no `QuasiCompact`. `README.md:5667–5670` justifies this: "an integral separated scheme of dimension one locally of finite type over a field is quasi-compact, since its normalization is an open subscheme of the regular projective curve". The target itself, `README.md:5640–5641`, is "a curve `X` over `k`".
- **Claim.** The README target and Layer 3's convention at `:5618–5619` ("an integral separated `k`-scheme of finite type of dimension one") assume finite type, so the Lean statement is more general than the README. The quasi-compactness step that bridges the two is neither a target nor located. The statement is true: the normalization's affine charts are opens of the projective model, and the glued map is injective by the valuative criterion for the separated normalization. But the route has an input with no owner.
- **Witness.** Stacks 0A27 (Lemma 33.43.10) is stated for "a curve over k", and Definition 33.43.1 (0A23) makes a curve a variety. Definition 33.3.1 (020D) requires a variety to be separated and of finite type. Separatedness does the work: the affine line with infinitely many doubled points is integral, of dimension 1 and locally of finite type, but it is neither separated nor quasi-compact.
- **Repair.** Do one of the following:
  - Restore `[QuasiCompact (X ↘ Spec (.of k))]`, which matches "a curve" and 0A27.
  - Keep the general form, restate the §3.1 target for integral separated schemes of dimension one locally of finite type, and add the quasi-compactness lemma as a §3.1 target with its route. On each nonempty affine open of the normalization, the inclusion into the nonsingular projective model is given by Stacks Theorem 53.2.6 (0BY1) and Lemma 53.2.1 (0BXY). The glued map is injective by the valuative criterion of separatedness, so it is an open immersion into a Noetherian scheme. Add the doubled-points line as a Check that separatedness is needed.

## R03 (P3) — §0.19 cites the definition of `(S_n)`-quasi-excellence to the wrong section

- **Location.** `README.md:1899–1901`: "`Scheme.IsSnQuasiExcellent n X`: the same with `(S_n)` in place of Cohen–Macaulay (Česnavičius 2021, Definition 1.2 and the sentence after it, p. 2; §2.8, pp. 6–7)".
- **Witness.** `cesnavicius-2021` line 237: §2.8 is "Openness of the (S_n)-loci" and defines no quasi-excellence. Line 268: "2.10. (S_n)-quasi-excellence", which is the definition, on p. 7.
- **Repair.** Cite "§2.10, p. 7" for `IsSnQuasiExcellent`. If §2.8 is meant for the openness of the `(S_n)` and Cohen–Macaulay loci that the definition implies, say so in a clause.

## R04 (P3) — §3.4: `picard_excision_sequence` is cited to a Chow-cycle lemma in a narrower setting, and two definition tags are labelled as sections

- **Location.** `README.md:5892–5894`: "the sequence `ℤ → Cl(X) → Cl(U) → 0` is exact, with `1 ↦ [D]`, and `Pic(X) → Pic(U)` is surjective for `X` locally factorial (Stacks, Lemma 02RX)". `README.md:5878`: "Source: Stacks, §§31.27–31.28 (0BE4, 0BE6)".
- **Witness.** Stacks 02RX is Lemma 42.19.3 (book line 177036). In Situation 42.7.1, for `X` locally of finite type over `(S, δ)`, it says that `α|_U ∼rat β|_U` implies `α ∼rat β + i_*γ`. That is a statement about cycles and rational equivalence, not about the Weil class group of an integral locally Noetherian `X`. In the same book, 0BE4 is Definition 31.27.7 and 0BE6 is Definition 31.28.4.
- **Repair.** Give the excision sequence a locator at its generality, or prove it in the README. A source such as Hartshorne 1977, II, Proposition 6.5 can be cited, with its standing hypothesis (*) stated. The elementary argument covers the integral locally Noetherian case: a prime divisor of `U` is the trace of its closure, and a divisor whose trace on `U` is `div_U(f)` differs from `div_X(f)` by a multiple of `[D]`. Keep 02RX only as the cycle-level form for schemes locally of finite type over a field. Write "Definition 31.27.7 (0BE4), Definition 31.28.4 (0BE6)". The Check at `:5939–5941` is the right test: for `X = 𝔸¹`, `D = {0}`, the sequence is `ℤ → Cl(𝔸¹) = 0 → Cl(𝔾_m) = 0 → 0`, with kernel `ℤ`.

## Verified sound

### Gate, dependency check, elaboration, probe, signatures

- **Gate.** The worker's gate at `9f9266a` has every counter at 0, including `build=0`, result OK. My re-run of `gate … SchemeAndStackFoundations --base origin/main` has every text counter at 0, result OK, exit 0.
- **Dependency check**, verbatim: `depcheck: 225 roadmaps, 2087 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 `declaration uses 'sorry'` warnings and no other diagnostic. The manifest is identical to main's: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- **One-tactic probe.** I replaced every `sorry` in a scratch copy by `first | rfl | infer_instance | simp | trivial`. All 48 theorems fail, one error each, so none is one-tactic padding. Every declaration that the Lean file adds or changes (`exists_linear_normalization`, `isAffine_or_isProper`, `vectorBundleDegree_pullback`) is a real theorem.
- **Signatures.** I ran `#check @` on the three changed declarations in the probe file and compared each with the README. They match, apart from the generality point of R02. For the other 99 declarations, `signatures.md` reports no lost section binder. The file is otherwise unchanged from main except for its imports.
- **`vectorBundleDegree_pullback`.** I opened Mathlib `Scheme.Hom.finrank` (`Morphisms/FlatRank.lean:89`). It is `IsAffine.finrank` of the base change to an affine chart, that is `RingHom.finrank` (`Flat/Rank.lean:139`, `Module.rankAtStalk`). For a finite dominant `f` of integral curves this is `[K(X) : K(Y)]` at the generic point. Tau Ceti `FixedRank.vectorBundleDegree` is valued in `ℤ` (`VectorBundle/Degree.lean:82`).

### Declarations opened at the pins

- **`#check` file.** 54 names elaborate. In Mathlib: `Scheme.Hom.finrank`, `.fiber`, `.asFiber`, `MorphismProperty.Over.pullback`/`pullbackComp`/`pullbackCongr`/`changeProp`/`changeProp_obj_left`/`_obj_hom`, `Etale.of_comp`, `IsFinite.SpecMap_iff`, `ModuleCat.uliftFunctor`, `AddCommGrpCat.uliftFunctor`, `sheafCompose`, `GrothendieckTopology.over`, `Scheme.ProEt(.topology)`, `Scheme.EllAdicCohomology`, `Scheme.ellAdicSheaf` (valued in `Ab.{u}`, lifted for cohomology), `Functor.sheafAdjunctionContinuous`, `Bicategory.Adj`, `Scheme.Modules.pseudofunctor`, `IsGrothendieckAbelian`, `Scheme.Etale.forget`, `MvPolynomial.funext`, `Algebra.adjoin_range_eq_range_aeval`, `Module.Finite.base_change`/`trans`, `RingHom.IsIntegral.to_finite`, `Ideal.exists_ideal_over_prime_of_isIntegral`, the `ModuleCat.depth` API, `IsAffineOpen.isLocalization_stalk`, `Scheme.IdealSheafData`, `Scheme.BirationalOver`, `IsDiscreteValuationRing.eq_unit_mul_pow_irreducible` and `exists_finite_inj_algHom_of_fg`. In Tau Ceti: `StrictHenselization.algebra`/`toTarget`/`existsUnique_lift`/`lift`, `ringKrullDim_eq_of_injective_of_isIntegral_mvPolynomial`, `FixedRank.vectorBundleDegree` and `Scheme.Hom.functionFieldMap`.
- **Line numbers.** 25 new file:line citations were checked line by line, all correct: `Lift.lean:142`, `Local.lean:60/85`, `StrictHenselization/Lift.lean:105`, `BaseChange.lean:506`, `MorphismProperties.lean:108`, `Extension.lean:51/62`, `EtaleCoordinates.lean:86/98`, `FormallyUnramified.lean:132`, `Diagonal.lean:86`, `Japanese.lean:210`, `UniversallyJapanese.lean:95/140`, `Syntomic/CohenMacaulay.lean:41/66`, `Stack/Basic.lean:37`, `QuasiSeparated.lean:169/198`, `StructureSheaf.lean:217`, `Geometric.lean:221/248`, `GenusOne.lean:147` and `Elliptic/Basic.lean:97`. I also ran a mechanical pass over all 170 new `name (…:line)` pairs in the diff. Every miss came from how I extracted the pairs (several names sharing one locator list, or a citation on an unchanged context line), and each was resolved by hand. The Mathlib depth lines `:66, :96, :102, :124, :265, :280, :301, :337, :359, :369` are correct.
- **Statements read.**
  - `LinearMap.bijective_of_depth` (`Bijectivity.lean:120`) carries `@[stacks 0AV8 "The finite-source hypothesis is omitted."]`, as the README says.
  - `Descent.qcohPseudofunctor_not_isGroupoid` (`:202`) assumes `[Nonempty T]`, as the §1.1 Check now says.
  - `IsFiniteEtaleSplit.of_henselianLocalRing` assumes `[IsSepClosed (ResidueField R)]`.
  - `nonempty_unique_algHom_of_isNeighbourhood` (`Section.lean:294`).
  - `depth_localizedModule_eq_zero_iff` needs no finiteness, as the README says.
- **No linear Noether normalization at the pins.** Mathlib `NoetherNormalization.lean` has only Nagata's substitution (`:243`, `:279`, `:292`), and Tau Ceti has no linear form, so §0.7a duplicates nothing.

### Seeded sample (all 15 targets)

The Stacks locators were checked mechanically against the book text (`stacks.math.columbia.edu/download/book.pdf`, version ed88ff78; PDF page = printed page):

- All 670 `number (tag)` pairs in the README agree. The 47 that needed attention were hand-resolved: 36 named results with the tag after a title, and 11 lemma ranges cited by their section tag.
- All 36 `(tag), p. N` page numbers match.
- Of the 11 multi-tag lists, all agree except the §3.4 pair in R04.

| Target | Checked against the source | Outcome |
|---|---|---|
| 0.5 | 064Q, 064T ((1) finite, (2) finitely presented; Tau Ceti `zero_iff`, `one_iff` use homological indexing), 064V, 066E, 08E5, 08E7; Tau Ceti `PseudoCoherent/Basic.lean:89/127/133/205/217/391`, `Descent.lean:121/164`, sheaf `Basic.lean:81/167/171/201/206/229` | As cited |
| 0.8 | 0AUW, 0578 (finite type, irreducible base), 0579, 0559, 055B, 055G, 055I, 054C, 005K, 038F, 01UA, 054L, 04KV, 056T, 033N, 057G, 055U; EGA IV₃ (9.7.7) line 3109 p. 79, (9.9.4) line 3714 p. 93, (9.9.5) line 3744 p. 94, (12.2.4)(v),(viii) line 7512 p. 183 (printed = PDF + 1) | As cited |
| 0.13 | 097I, 05UT, 0AGU, 0DYE (`V(J) = V(IB)`, integral), 0H7Q, 0A04 (filtered); `bhatt-scholze-2014` Prop 2.3.3 (4) line 518; `clausen-mathew-morrow-2021` Remark 3.19 line 911 p. 22 | As cited. 0AGU states flatness and `A/I^n ≅ A^h/I^nA^h`; faithful flatness under `I ⊆ Jac` follows and is pinned |
| 0.17 | 0AV8, 0FCC p. 607, 0AV5, 045J, 00N6, 0AUI, 0BUS, 0E9I, 0DWR, 0AVZ; Tau Ceti `CohenMacaulay/Basic.lean:95`, `RegularSequence.lean:158/187`, `Flat.lean:74` | As cited |
| 0.19 | `cesnavicius-2021` Def 1.2 line 61 p. 2, Example 1.3 line 67 p. 2, §2.8 line 237 p. 6, §2.10 line 268 p. 7 | R03 |
| 1.16 | `poonen-2017` Theorem 4.5.2 line 4551, §5.12.5.1–3 lines 6477/6494/6517, §6.5.6.1–4 lines 7539–7555, Prop 5.12.14 line 6457 | As cited (field case; general base stated as fppf-local) |
| 1.21 | 044Q, 044R, 044S, 04M9, 044U, 044X, 06FI (flat, locally finitely presented), 04TK, 04YW, 06N3; Cadman (arXiv math/0312349v3, fetched without manifest) Def 2.1 line 87, Thm 2.2 line 104, Prop 2.4 line 207, `[𝔸¹/𝔾_m]` line 211 p. 6, Def 2.5 line 215; the §2.1 standing hypothesis that `r` is invertible is carried as `.isDeligneMumford_of_invertible` | As cited |
| 2.14 | `morel-voevodsky` Prop 1.8 line 1871 pp. 98–99, Prop 1.9 and Ex 1.10 lines 1885/1891 p. 99, Defs 1.12–1.13, Prop 1.16, Lemmas 1.17–1.18 pp. 100–102 (printed = PDF + 43); Voevodsky arXiv 0805.4578v1 (fetched) Thm 3.2 line 454, Def 3.3 line 490, Lemma 3.5 line 541 | As cited |
| 2.19 | 0A9E (qcqs), 0A9I (uniform `N`), 0E9Z (iso exactly at smooth points), 0BRT, 0AA1 (noncanonical), 0B6V (1), 0C06, 0BV8, 0C10, 0FWI, 0E9U, 0AU0, 0A9W; pp. 4119/4129/4130/4140/4144/4158; Nayak arXiv math/0406501v1 (fetched) §2.1 [A]–[D] lines 269–341, Thm 2.2.4 line 458; Block–Holstein–Wei arXiv 1511.08659v3 (fetched) §§3.2/4.1/4.3, Def 4.3 line 608, Cor 3 line 665 | As cited |
| 3.2 | 0C1C, 0C1D, 0C1F ((2) `d_x ≥ e_x − 1`, (3) equality iff tame), 0AYZ, 0C6M, 0C6T, 0C6N, 0C6U, 0E3A, 0E3B, 0E3C, 0E3D, 0H2V (geometrically integral), 0B5E, 0AYY, 02L6 | As cited |
| 3.4 | 01IB, 0B8I, 0BE8, 0BE9; `bhatt-scholze-2017` Def 12.14 and Prop 12.15 lines 2699/2703 p. 58, §4 line 696 p. 15, Construction 5.1 line 821 p. 18 | R04 for 02RX and 0BE4/0BE6; the rest as cited |
| 3.7 | `yun-zhang` §3.2.1 line 901 p. 16, Prop 3.1 p. 17 (its proof p. 18), §5.4.1 line 1938 p. 35 (two components), proof of Prop 6.1 p. 40 (the sequence `1 → O_X^× → ν_*O^× → ν_*O^× → O_X^× → 1` with `id − σ` and `Nm`, line 2224); 062Y, 0B9D, 0BA0 | As cited |
| 4.8 | 0AIZ, 0AMC, 0GBA, 087X (30.23.2), 0881, 087W, 0880 | As cited |
| 4.10 | 087V, 0883, 0885, 0886, 088A, 088B (ideals with the same support, which covers the Lean `I`), 088C, 088E, 088F, 0899, 09ZT, 0A42, 089A | As cited |
| 5.5 | 02T7, 0FBI, 063J, 0FEZ, 0FF3, 0FF2; AlgebraicVectorBundles `linearSpecScheme` on main (`README.md:367`) | As cited; Fulton under Not verifiable |

Other new locators checked:

- **§0.7a.** In Milne AG 2024 (v6.10): Lemma 2.43 line 1955 p. 52 (infinite field; the top-degree coefficient is `F(c, 1)`), Theorem 2.44 line 1969 p. 52, Theorem 2.45 line 1974 p. 52, the remark that reducedness and algebraic closure are not needed at line 1979 p. 53, Lemma 2.46 line 1986 p. 53, Remark 2.47 line 2008 p. 53. In `milne-tmp` (CA v4.03): Theorem 8.1 line 1368 p. 34, Remark 8.4 line 1417 p. 35. Stacks 00OY, 00GQ and 05DR.
- **§0.12.** 03PS, 04HX (with `κ^sep` the separable closure in `κ(s̄)`), 03QK, 03QO (stated for sheaves of sets; the cofinality argument is the same for presheaves), 01YW.
- **§0.23a.** 021I and 021J.
- **§2.10.** `bhatt-scholze-2014` Lemmas 5.1.1–5.1.2, lines 1581/1594.
- **§2.21.** The list (1)–(9) is word for word Stacks §48.19 (0AU3), including `D⁻_Coh × D⁺_QCoh` in (2). Flat base change is 0E9U and étale `f^! = f^*` is 0FWI.

### Cross-roadmap citations and ownership

- **ModularCurves.** The new sentence "ModularCurves consumes nothing from this roadmap" agrees with ModularCurves on main (`README.md:3549`: "Nothing of this roadmap consumes SchemeAndStackFoundations").
- **EtaleCohomologyFoundations on main.**
  - It asks for "geometric points and strict henselizations from SchemeAndStackFoundations" (`:553`) and "scheme strict localization" (`:1155`). The new §0.12 block supplies these, and roadmaps grep finds no other owner of a scheme strict local ring.
  - F.4.3 (`:1001`) says "Using SchemeAndStackFoundations §2.17 construct ν". §2.17 now says that ν is §2.10's *Scheme.toProEt*, with "no second comparison". That gives the consumer a pointer and leaves a single owner.
- **ArcTopologyAndDescent (open, `README.md:105`)** consumes small étale functoriality as Mathlib's `MorphismProperty.Over.pullback`, which is §0.23a's `smallEtaleBaseChange`.
- **Ownership.** Roadmaps grep finds no other owner of linear Noether normalization (InverseGalois, EtaleDualityAndPerverseSheaves and DeligneWeightsAndPurity use Mathlib's nonlinear form), of `etalePullback`/`etalePushforward`/`toProEt`/`proetaleComparison`/`overEquiv`, or of the strict local rings. `TauCetiRoadmap.SchemeAndStackFoundations.LinearNormalization` is a fresh namespace.
- **Overlaps.** #1807, #1808 and #1854 change this folder and conflict with it. The description orders them (`#1276 → this pull request → #1807 → #1808 → #1854`; #1276 is already on main). No cited id is dropped by an open pull request, and none is defined only by an open revision. Comparing headings and declarations with main shows additions only (§0.7a and `exists_linear_normalization`), so the pull request drops nothing.
- **Declared gaps.** None (no readable `design/plan.json`, no `What <Supplier> must provide` contract in this README).

### Adversarial table

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| `exists_linear_normalization` (§0.7a) | `𝔽₂[X,Y]/(XY(X+Y))` | linear forms `x, y, x+y` give `A/(ℓ) ≅ 𝔽₂[t]`, infinite-dimensional, so `A` is not finite over `k[ℓ]`; `C = 0` gives `y = 0`, not independent | Pass; infinite-field hypothesis needed |
| same, nonlinear control | `z = x²+xy+y²` | `x³ − zx = −xy(x+y) = 0`, `y³ − zy = 0`; `y ↦ 0` sends `z ↦ X²`, so `k[T] → A` is injective | Pass |
| same | `k[X,E]/(E²)`; `A = k` with `(0)`; `n = 0` | `d = 1`, basis `1, E` over `k[X]`, `(0 1)` fails as `E² = 0`; `d = 1` gives `y = 0`, so `d = 0 = dim k`; empty family is independent, `d = 0` | Pass |
| elimination step (Milne 2.43) | `A = k[x, x⁻¹]`, `f = XT − 1` | `f_D = XT`, `P(a) = a`; `(X + aT)T − 1` has `T²`-coefficient `a ≠ 0`; with `z = x − a x⁻¹`, `x² − zx − a = 0` | Pass |
| `isAffine_or_isProper` | `𝔸¹_k`; `ℙ¹_k`; line with infinitely many doubled points | affine and not proper; proper and not affine; integral, dimension 1, locally of finite type, not separated, not quasi-compact | True as stated; locator gap R02 |
| `vectorBundleDegree_pullback` | `z ↦ z²` on `ℙ¹`, `E = O(1)`; `E = O^r`; relative Frobenius on `ℙ¹` in characteristic `p` | `deg O(2) = 2 = 2·1`; `0 = 2·0`; `deg O(p) = p·1` | Pass; `finrank` at the generic point is `[K(X):K(Y)]` |
| §0.12 *Scheme.strictLocalRing* | `Spec 𝔽_p`; `ℤ_(5)`; `ℤ_(5)^h`, `P = Spec R[x]/(x²−2)` | `𝔽̄_p` against `𝔽_p`; `x²+1` has simple roots `2, 3` mod 5 and none in `ℚ`; squares mod 5 are `{1, 4}`, so `P(S) = ∅` while `P_s ≠ ∅` | Pass |
| §0.13 *henselization_recognition*, *integral_base_change* | `S = ℤ` for `(ℤ,(5))`; `R^h[T]`, `X² − X + pT` | `T²+1`: root `2` mod 5, derivative `4 ≠ 0`, no integer root; `(2X−1)² = 1 − 4pT` has odd `T`-degree, so there is no root | Pass |
| §0.13 *coprime_product* | `(ℤ,(6))`; `(2) ∩ (4)` | `ℤ_(2)^h × ℤ_(3)^h`; radical `(2)`, local `ℤ_(2)^h` | Pass |
| §0.5 affine criterion | `j_!O` on `Spec R`, `R` a DVR | sections `0` over `Spec R`, `K` over `D(π)`, both pseudo-coherent; stalk `K` not generated by `0`, so not quasi-coherent | Pass |
| §0.8 `flat_over_dedekind` | `S ⊔ 𝔸¹_S → S`, `S = Spec k[t]` | flat, fibres `κ ⊔ 𝔸¹_κ`, no single `d` | Pass; purity not concluded |
| §0.17 Checks | `k × k[t]`, `p = 0 × k[t]`; `k[x,y]_(x,y)`; `𝔪 → R`; `k[[x,y,z]]/(xz,yz)`; `k[x]_(x) → k[x,y]_(x,y)` | `0 + 0 < 1`; depth 2, `Hom(𝔪,R) = R`; depth `𝔪_𝔪 = 1`, not surjective; depth 1 against dimension 2; `2 = 1 + 1` | Pass |
| §0.19 `(S_0)` and nonreduced CM | `(S_0)`; `k[ε]/(ε²)` | `depth ≥ min(0, ·)` always holds; dimension 0 and depth 0 | Pass |
| §0.21 Checks | `R → R/(1) = 0`; `k ⋉ k` | `0` is flat with empty fibres, so regular; flat with nonreduced fibre | Pass |
| §0.23 Checks | `Spec k[t] → Spec k[t²,t³]`; node, `char ≠ 2` | integral, radicial, surjective; `t = ±1` over the node | Pass |
| §0.23a base change | `Spec 𝔽_{p²} → Spec 𝔽_p` | 2 endomorphisms against 4 after base change | Pass |
| §0.29 Checks | `𝔽_p[ε]/(ε²)`; `𝔸¹_S`; `𝔽_{p²}` | `ε ↦ 0`; rank `p`; `F² = id`, `F` not `k`-linear | Pass |
| §2.1 *etalePushforward* exactness | `f : 𝔾_{m,k} → Spec k`, `k` algebraically closed | `R¹f_*μ_n = k[t,t⁻¹]^×/n = ℤ/n` (`k^×` divisible, `Pic 𝔾_m = 0`) | Pass |
| §2.5 *Etale.overEquiv* | fold `X ⊔ X → X` | `Hom_{Over U}(inl, inr) = ∅` against `Hom_X(X, X) = {id}` | Pass; not full |
| §2.10 counit | `Spec k`, `ellAdicSheaf ℓ`, `U = Spec C(ℤ_ℓ, k)` | locally constant maps against continuous maps; the identity of `ℤ_ℓ` is continuous and not locally constant | Pass |
| §2.14 Brown–Gersten control | constant `A` on `Sm/k` | `F(∅) = A[1]`; `F(pt ⊔ pt) = Cone(A → A²) = A[0]` | Pass |
| §2.19 `a_f` | `ℙⁿ_k → Spec k`; `Spec k → Spec k[x]`; `⨿ℙⁿ → ⨿Spec k` | `O(−n−1)[n]`, degree `−n`; `k[−1]`; `H^{−n} ≠ 0` for every `n` | Pass; needs `Y` qcqs, as stated |
| §2.21 `coherent_duality` | list against 0AU3 | (1)–(9) identical, including the `D⁻_Coh/D⁺_QCoh` ranges in (2) | Pass |
| §1.16 *contractedProduct* | `Spec L ×^{ℤ/2} Spec L`, `L/K` quadratic | invariants `K × K`; the presheaf quotient has no `K`-point | Pass |
| §1.21 root stacks | `n = p` in characteristic `p`; `n = 1` | stabilizer `μ_p` not étale; `X` | Pass |
| §3.2 Checks | `z ↦ z²`; étale double cover of genus 2; `O(O), O(2O), O(3O)` on `E`; real conic | `−2 = 2(−2) + 2`; `g = 3`; `h⁰ = 1, 2, 3` with base point, degree-2 map, embedding; anticanonical degree 2 ≥ 1, `h⁰ = 3` | Pass |
| §3.4 excision and units | `𝔸¹ ⊃ 𝔾_m`; quadric cone | `ℤ → 0 → 0`; `k^× → k^× × t^ℤ → ℤ`, `c tⁿ ↦ n`; `Pic = 0`, `Cl = ℤ/2` | Pass; locator R04 |
| §3.7 Abel maps | real conic, `d = 1`; `ℙ¹` | `Pic¹ = Spec ℝ`, `X^{(1)}` pointless; `π₀ = ℤ`, `π₁ = k^×` | Pass |
| §4.10 compatibility | `A = k[[t]]`, `a_0 = 0`, `a_1 = 1` | `a_1 ≢ a_0 mod t` | Pass; the hypothesis is needed |
| §5.5 Gysin | `{0} → 𝔸¹` along `z ↦ z²`; line in `ℙ²` | `[Spec k[z]/(z²)] = 2[pt]`; `I/I² = O(−1)`, `N = O(1)`, degree `+1` | Pass |
| `hodge_index` | `ℙ¹×ℙ¹`, `H = (1,1)`, `D = (1,−1)` | `H² = 2`, `D·H = 0`, `D² = −2 ≤ 0` | Pass |
| `weil_bound` | `y² + y = x³` over `𝔽₂` | 3 points, `|3 − 3| = 0 ≤ 2√2` | Pass |
| `Ring.IsNagata.of_complete_local`, `IsQuasiExcellentRing.isNagata` | `k[[t]]`; `ℤ` | complete DVR, Japanese; quasi-excellent and Nagata | Pass |
| `grothendieck_existence` | `X = Spec A`, `A` complete Noetherian | coherent formal modules are finite `A`-modules (087W) | Pass |

## Not verifiable

- Fulton 1998 (§5.5 Theorems 6.2–6.5 and §§4.1, 5.2, 6.1; §3.4 Proposition 1.8). There is no legal copy in the cache, and these locators are unchanged by the pull request.
- Hartshorne 1977 and de Jong 1996: settled as uncertified. This includes the Hartshorne II Proposition 6.5 citation of §3.4's units sequence and V.1 in §5.9.
- SGA 6, Exposé 0 (§5.7): not fetched; unchanged.
- Gabber–Kelly (§2.14) is cited only for comparison and was not fetched.

## Source issues

- **Misprint** in Milne AG 2024 at Remark 2.47, p. 53: the source says Lemma 2.46 gives constants `c_1, …, c_n`; it should be `c_1, …, c_d`, the only constants in the displayed subring; affects nothing.
- **Misprint** in Milne AG 2024 at the proof of Lemma 2.46, p. 53: the source writes the second term of `g` as `b_1 T`; it should be `b_1 T^{r−1}`; affects nothing.
- **Misprint** in Milne AG 2024 at the proof of Proposition 2.42, p. 52: the source calls the hypersurface `H` a hyperplane; it should say hypersurface; affects nothing.
