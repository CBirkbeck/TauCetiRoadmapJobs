# Review of SchemeAndStackFoundations (pull request #1656 at aa653e5)

**Verdict:** needs changes

This is a full review of the folder at `aa653e5`, the head the previous review read. The folder is unchanged since then and nothing outside it changes. The gate passes, `Suggested.lean` elaborates with `sorry` warnings only, and the dependency check is clean. No statement is false or vacuous, and nothing blocks. Eight P3 findings remain:

- the previous review's description finding is only partly repaired (R01);
- two generality mismatches (R02, R04);
- a missing locator for the smooth-scheme obstruction class (R03);
- an undefined term (R05);
- a Check block that is too thin for four definitions (R06);
- a redundant `Suggested.lean` declaration (R07);
- two `Suggested.lean` docstring locators that point at the wrong item (R08).

## R01 (P3) — The description still says that the curve dichotomy drops quasi-compactness

`Re-raised: R01 of the previous review` (partly repaired).

- **Location.** Two sentences in the `roadmap-summary` block of the description are wrong:
  - "The curve dichotomy drops quasi-compactness, degree pullback uses the existing bundle degree and generic rank, and citations identify pinned declarations."
  - "Quasi-compactness follows from the other curve hypotheses."

  The `merge-order` block is also stale: "**Merge order.** #1276 (SchemeAndStackFoundations) → **this pull request** (#1656)", and the shared-folder line begins "#1276 → **this pull request**".
- **Claim.** None of the three is true at this head.
  - `Curve.isAffine_or_isProper` still carries `QuasiCompact`.
  - #1276 is merged.
- **Witness.**
  - `Suggested.lean:734` reads `[QuasiCompact (X ↘ Spec (.of k))]`. `README.md:5667–5669` says finite type is written as `LocallyOfFiniteType` together with `QuasiCompact`.
  - #1276 is commit `c20f72af` on main. `roadmaps list` does not list it as open.
  - The rest of the previous R01 is repaired:
    - the prose now says "1,271 added and 330 removed lines", which matches `--numstat` (README 1230/314, `Suggested.lean` 41/16);
    - the `Suggested.lean` bullet now says the curve dichotomy "keeps main's statement, including `QuasiCompact`".
- **Repair.**
  - Regenerate the `roadmap-summary` block from this head. Delete both quasi-compactness sentences, or replace them with "the curve dichotomy keeps its statement; its docstring writes finite type as `LocallyOfFiniteType` with `QuasiCompact`".
  - Regenerate the `merge-order` block so that it no longer lists the merged #1276. The shared-folder order then begins with this pull request, followed by #1807, #1808 and #1854.

## R02 (P3) — `algebraize_hom` is stated for a wider class of `Y` than the README and the source

- **Location.**
  - `Suggested.lean:946–947` has `[IsSeparated fY] [LocallyOfFiniteType fY]` and no `QuasiCompact fY`.
  - `README.md:6644` reads "for `X` proper and `Y` separated of finite type over `Spec A`".
- **Claim.** The README's generality and the Lean signature's differ.
  - The README and Stacks restrict `Y` to finite type.
  - The Lean statement admits every separated `Y` that is locally of finite type.
- **Witness.**
  - Stacks, Lemma 30.28.3 (0A42), hypothesis (2), reads "`Y → S` is separated of finite type".
  - Take `A = k[[t]]`, `X = Spec A` and `Y = ∐_{n∈ℕ} 𝔸¹_A`. This `Y` is admitted by the Lean statement but by neither the README nor 0A42.
  - The Lean statement is still true there:
    - `g_0(X_0)` lies in a quasi-compact open `V`, here a single component.
    - Every closed point of the proper `X` maps to a maximal ideal of `A`, which contains the ideal. So every point of `X` specialises into `X_0`, and any `G` lands in `V`.
- **Repair.** Choose one of the following.
  - Add `[QuasiCompact fY]` to `algebraize_hom`. This matches the README and 0A42.
  - Keep the Lean statement, and restate the README target for `Y` separated and locally of finite type. Add the reduction above (the image of `X` lies in a quasi-compact open of `Y`, to which 0A42 applies).

  Test either repair on `Y = ∐_{n} 𝔸¹_A`. It is excluded by the first and covered by the second.

## R03 (P3) — §4.6: no locator for the claim that the obstruction lies in `H²(X, T_X) ⊗ I`

- **Location.** `README.md:6444–6449` reads: "the obstruction to deforming a deformation over `A` to `A'` lies in `H²(X, T_X) ⊗ I`, the deformations form a torsor …". The cited items are 0DY7, 0DY8–0ET5, 0DZQ, 0D14, 0D0N and 0C6R.
- **Claim.** None of the cited items states the obstruction clause for schemes:
  - 0DY9 computes `Inf` and the tangent space;
  - 0D14 assumes that a flat lift exists and gives the torsor and the automorphisms;
  - 0DZQ is unobstructedness for curves that are local complete intersections;
  - 0C6R is the line-bundle sequence.
- **Witness.**
  - Stacks, Deformation Theory, Remark 91.7.9 (0GQ4), says that the `Ext²(NL, −)` obstruction is not available in general.
  - The statement is Stacks, Cotangent Complex, Lemma 92.23.1 (08V5) (1). It puts the obstruction in `Ext²(L_f, G)`.
  - Lemma 92.9.1 (08R5) gives `L = Ω[0]` for smooth ring maps.
- **Repair.** Choose one of the following.
  - Add "Stacks, Lemma 92.23.1 (08V5) (1), with `L_{X_A/A} ≅ Ω_{X_A/A}` by Lemma 92.9.1 (08R5) on affine opens" as the locator of the obstruction clause.
  - Keep the scope's two-term complex and write the Čech route as the proof sketch:
    - affine opens of the smooth `X_A` lift, by formal smoothness (0D0N);
    - two lifts on an overlap are isomorphic, and their isomorphisms form a torsor under `Γ(T_X ⊗ I)` (0D14 (2));
    - the discrepancy on triple overlaps is a Čech 2-cocycle, whose class is the obstruction.
  - Test the repair on `X = ℙ¹`, where `H²(ℙ¹, O(2)) = 0`, so every deformation lifts.

## R04 (P3) — §0.6: the dual and the reflexive hull are restricted to normal schemes, but the sources need only integrality

- **Location.** `README.md:967–975`:
  - "`IsReflexive.dual` (the dual of a coherent sheaf on a normal integral locally Noetherian scheme is reflexive; …)";
  - "`reflexiveHull F := F^{∨∨}` for `X` normal integral";
  - "the hull statements assume `X` normal integral".
- **Claim.** These statements are narrower than the cited sources support.
- **Witness.**
  - Lemma 31.13.8 (0AY4) is stated for any integral locally Noetherian `X` (`stacks divisors` text, line 874). So are Lemma 31.13.4 (0AY2), which says `F → F^{∨∨}` is injective iff `F` is torsion free, and Remark 31.13.9 (0EBH), which says the hull is left adjoint to the inclusion (lines 853–882). `O_X` is reflexive, so 0AY4 with `G = O_X` gives `IsReflexive.dual`.
  - Take the cusp `A = k[t², t³]`, which is integral and not normal. Its maximal ideal `m = t²k[t]` has dual `(A : m) = k[t]`, which is reflexive by 0AY4. The README statements do not cover this example.
- **Repair.**
  - State `IsReflexive.dual`, `reflexiveHull`, `reflexiveHull_isReflexive`, `reflexiveHull.unit` and `reflexiveHull.lift` for integral, locally Noetherian `X`.
  - Keep normality only for:
    - the `(S_2)` description (0AY6);
    - the extension criterion (0AY7);
    - `reflexive_extension_normal`.
  - Add the cusp as a Check.

## R05 (P3) — §1.10: "Nisnevich-free étale coverings" is not a defined term

- **Location.** `README.md:3076` reads "… and the Nisnevich-free étale coverings make `smallEtaleTopology F`".
- **Claim.**
  - The term is neither standard nor defined in the roadmap.
  - The topology meant is that of Stacks, Definition 66.18.2 (03G0). There a family is a covering iff it is jointly surjective, `|U| = ⋃ φ_i(|U_i|)` (condition (3)). The roadmap's own Checks in §1.10 test exactly this condition.
- **Witness.** 03G0 (3), `spaces-properties` text, lines 1222–1223. Nothing in the README defines "Nisnevich-free".
- **Repair.** Replace the phrase with: "the jointly surjective families of étale morphisms (Stacks, Definition 66.18.2 (03G0), (3)) make `smallEtaleTopology F`".

## R06 (P3) — §1.21: two Check bullets for four definitions, and none tests the stackification

- **Location.** `README.md:3736–3744`.
  - The section defines `Stack.quotient`, `quotientStack`, `actionQuotient` and `rootStack`.
  - Its **Checks.** are two bullets that bundle seven tests.
- **Claim.**
  - The house form asks for one bullet per test and at least three discriminating Checks per definition.
  - No Check of the generic `Stack.quotient` separates it from the prestack it stackifies. The prestack is the wrong model: it has the same objects `X(T)` before stackification.
- **Witness.** Over `(Sch/ℝ)_fppf`, take `X = Spec ℂ` and `R = X ×_{Spec ℝ} X ≅ Spec ℂ ⊔ Spec ℂ`, the Galois groupoid.
  - The prestack has no object over `Spec ℝ`, since `X(ℝ) = ∅`.
  - `[X/R] ≃ Spec ℝ` has one object over `Spec ℝ`, by fppf descent along `Spec ℂ → Spec ℝ`.
- **Repair.**
  - Split the two bullets into one bullet per test.
  - Add the Galois-groupoid Check above for `Stack.quotient`.
  - Add one more Check for `rootStack`, separate from the `n = p` stabiliser Check. For `L = O` and `s = t` on `𝔸¹`, the square root stack is `[Spec k[t,u]/(u² − t) / μ_2] ≅ [𝔸¹_u / μ_2]`, with stabiliser `μ_2` at the origin and an isomorphism over `t ≠ 0`.

## R07 (P3) — `Ring.IsJapanese.of_complete_local` is padding: it follows from `Ring.IsNagata.of_complete_local` in one line

- **Location.** `Suggested.lean:148–151`.
- **Claim.** The Japanese statement is the domain case of the Nagata statement two declarations below it (`:155`). Tau Ceti's instance `TauCeti.Ring.IsNagata.isJapanese` (`TauCeti/RingTheory/Nagata.lean:97`, `[IsDomain R] [IsNagata R] : IsJapanese R`) closes the gap.
- **Witness.** I compiled a scratch file importing the built module. In it, `have := Ring.IsNagata.of_complete_local A; infer_instance` closes the goal `TauCeti.Ring.IsJapanese A` under the hypotheses of `:148`, and elaboration exits 0. The README's end theorem names only "complete Noetherian local rings … are Nagata".
- **Repair.**
  - Delete `Ring.IsJapanese.of_complete_local` from `Suggested.lean`.
  - In §0.20, keep it as a README target in italics, stated as the domain case through `TauCeti.Ring.IsNagata.isJapanese`.
  - Add the resolution line that the README already uses elsewhere: "Citations of *Ring.IsJapanese.of_complete_local* to §0.20 resolve to `Ring.IsNagata.of_complete_local` with `TauCeti.Ring.IsNagata.isJapanese`". IntegralHeckeAndGaloisDeterminants cites the name, at `README.md:112` and `:615` of that roadmap.
  - Italicise the name in the Downstream consumers paragraph.

## R08 (P3) — Two docstring locators in `Suggested.lean` cite the wrong item

- **Location.**
  - `Suggested.lean:461`: "Stacks, Lemmas 59.63.1–59.63.6 (0A3J)".
  - `Suggested.lean:541`: "Bhatt–Scholze 2014, Proposition 4.2.8".
- **Claim.**
  - `artinSchreier_vanishing` is exactly Stacks, Lemma 59.63.1 (1), tag 0A3K. Tag 0A3J is the paragraph that introduces the Artin–Schreier sequence. Lemmas 59.63.2–59.63.6 concern schemes of finite type over algebraically closed fields.
  - Bhatt–Scholze Proposition 4.2.8 states that `Shv(X_proét)` is locally weakly contractible. Repleteness follows by Proposition 3.2.3 (1). README §2.17 states this route, but the docstring does not.
- **Witness.**
  - Stacks `etale-cohomology` text, lines 4438 (0A3J), 4444–4445 (Lemma 63.1, 0A3K, part (1)) and 4455–4569 (Lemmas 63.2–63.6).
  - `bhatt-scholze-2014` line 1361 (Proposition 4.2.8, p. 29) and line 798 (Proposition 3.2.3 (1), p. 18).
- **Repair.**
  - At `:461`, write "Stacks, Lemma 59.63.1 (1) (0A3K)".
  - At `:541`, write "Bhatt–Scholze 2014, Proposition 4.2.8 with Proposition 3.2.3 (1)".

## Previous findings

- **R01 (description): partly repaired.** The line count and the `Suggested.lean` bullet are now correct. The two quasi-compactness sentences of the `roadmap-summary` block remain (see R01 above).

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** The worker's gate at `aa653e5` reports every counter 0, including `build=0`, and OK.
- **My rerun of the gate** (`gate … SchemeAndStackFoundations --base origin/main`) printed:

      gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  It exited 0.
- **Dependency check** (`gate --depcheck … --movable --pr 1656`), verbatim:

      depcheck: 235 roadmaps, 2132 edges, 0 problem(s)

  It exited 0. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 in 50 s. It prints 48 ``declaration uses `sorry` `` warnings and nothing else.
- **Lean form.**
  - The file has a single `import Mathlib` and 25 `TauCeti.*` imports, every one present at the pinned Tau Ceti.
  - It has no `set_option`, `lemma`, `#eval`, `#print`, `#synth` or `#check`.
  - Every declaration has a docstring, and there are Layer 0–5 section comments.
- **Pins.** The pins in `lake-manifest.json` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) match the hashes the README quotes in its supplier contracts.
- **Changes against main.** The folder's change against main is README 1230/314 and `Suggested.lean` 41/16. Nothing outside the folder changes. Main has not touched the folder since the merge base `8101f2c`, and `git merge-tree` against `origin/main` merges cleanly.

### Signatures and probe

- **Signatures.** I put `#check @…` for all 100 declarations in one scratch file, importing the built module. All of them elaborate, and none has lost a section binder. The `Curve` strand carries `(k) [Field k]` explicitly.
- **Signatures against the README.**
  - `genus_baseChange` matches §3.1 and Stacks 0BY9: proper, dimension 1, `H⁰ = k`.
  - `vectorBundleDegree_pullback` matches §3.3 and 0AYZ: proper integral curves, dominant `f` over `k`.
  - `hodge_index` matches §5.10.
  - `algebraize_hom` does not match (R02).
- **One-tactic probe.** I replaced every `sorry` in a scratch copy with `first | rfl | trivial | infer_instance | simp | (constructor <;> simp)`. All 48 theorems fail; for example, `simp` makes no progress on `unibranch_finite_components`, and unsolved goals remain for `Torsor.trivial_iff_section`.
- **Targeted probes.**
  - Mathlib's `MorphismProperty.Over.pullbackComp` with `pullbackComp_left_fst_fst` (`CategoryTheory/MorphismProperty/OverAdjunction.lean:113`, `:126`) does not close `universalHomeomorphismEtaleEquivalence_comp` as a term. The `HasPullbacksAlong` and `IsStableUnderBaseChangeAlong` instances are local to `smallEtaleBaseChange`, so instance synthesis fails. The theorem is not padding.
  - The Japanese/Nagata probe is in R07.

### Seeded sample (15 targets), checked at their locators

- **§0.6.** The following tags say what the README says, at integral generality (lines 831–956 of the Stacks Divisors chapter):
  - Definition 0AVU and Lemmas 0AY0, 0AY2, 0AY3, 0AY4;
  - Remark 0EBH and Lemmas 0EBI, 0EBJ, 0AY6, 0AY7.

  Lemma 0E9I (line 335) is stated for locally Noetherian `X` with depth ≥ 2 off `U`, as `coherent_hartogs` says. The extension proof without integrality is checked step by step (depth of `Hom`, Hartogs, bijectivity at points of depth ≥ 2). See R04.
- **§0.7a.**
  - Milne, *Algebraic Geometry* v6.10: Lemma 2.43, which assumes `k` infinite, is on p. 52. Theorem 2.45, the reducedness/algebraic-closure remark, Lemma 2.46 and Remark 2.47 are on pp. 52–53.
  - Milne CA 2020, Remark 8.4 is on p. 35 (`milne-tmp` line 1417).
  - The elimination step matches the source: the top homogeneous part `F(c,1)` is the leading `T`-coefficient.
  - The 𝔽₂ counterexample and `z = x² + xy + y²` are computed below.
  - Stacks 00GQ and 05DR are as cited.
- **§0.23.** Tau Ceti `Morphisms/UniversalHomeomorphism.lean` has every cited declaration at its cited line: `:64`, `:68`, `:74`, `:79`, `:104`, `:110`, `:116`, `:135`, `:153`, `:162`, `:174` (the field-injectivity form), `:202`, `:218` and `:224`. So does `Thickening.lean` at `:124` and `:131` (`SpecMap_iff`, a nil kernel). Stacks 04DD is the definition cited.
- **§0.23a.**
  - Stacks Theorem 59.45.2 (04DZ) is the equivalence for integral, universally injective and surjective `f`.
  - Lemma 34.4.17 (021I) is the continuous base-change functor and morphism of small étale sites.
  - Lemma 34.4.18 (021J) is compatibility with composition.
- **§0.27.** Tau Ceti has every cited declaration at its cited line:
  - `Flat/Annihilator.lean` at `:39`, `:67` (07T8, `[Module.Finite R M]`), `:82` and `:97`;
  - `Ideal/TensorProduct.lean` at `:55`, `:72` and `:87`;
  - `TensorProduct/Quotient.lean` at `:370`, `:381`, `:391` and `:399`;
  - `Submodule.lean` at `:78`.

  No `map_inf` lemma for flat extensions exists at either pin; Mathlib's `IsLocalization.map_inf` covers localizations only. So *ideal_map_iInf_finite* is new.
- **§0.28.**
  - Stacks Lemma 26.17.6 (1) (01JU): the ideal of the base change is `Im(g^*I → O)`.
  - Example 26.4.3 (01HM): `i_*O_Z = O_X/I`.
  - Mathlib's `IdealSheafData.comap` is at `AlgebraicGeometry/IdealSheaf/Functorial.lean:39`. The `_comap_of_isAffineHom` target does not exist there; only `ideal_comap_of_isOpenImmersion` (`:197`) does.
- **§1.5.** The following tags are at the numbers the README gives:
  - 022P (Definition 39.3.1);
  - 02WS (Definition 65.9.2, book p. 5275);
  - 02VG (Definition 39.20.1);
  - 045Y (Lemma 39.20.4, pre-equivalence relations);
  - 03C5 (Lemma 39.20.3, three hypotheses as listed);
  - 045Z (Lemma 39.20.5, which needs `h_{U′} → h_U` surjective);
  - 02VH (Lemma 39.20.6).

  Tau Ceti's `CommHopfAlgCat.fppfQuotientSheaf` exists (`Algebra/AlgebraicGroup/ProjectiveGeneralLinear/Quotient.lean:133`).
- **§1.10.** The following tags are as cited:
  - 03ED (schemes étale over `X`);
  - 03G0 (algebraic spaces; covering condition (3) is joint surjectivity);
  - 03G7, 03G2 and 03LP (`j` is cocontinuous and continuous for étale `f`);
  - 00XJ (cocontinuity).

  See R05.
- **§2.23.** Kings–Sprang (arXiv 1912.03657v4):
  - Appendix A.1 and Definition A.1 are on p. 79 (`kings-sprang` lines 3754–3768), with Hom_Γ = Hom^Γ.
  - Definitions A.2–A.3 and the two spectral sequences (A.1.1) are on p. 80 (lines 3771–3794).
  - The source points to Grothendieck 1957, Proposition 5.1.1 for enough injectives (line 3763).
- **§3.1.**
  - 0BY7 (Definition 53.8.1, with `H⁰ = k`) and 0BY9 (Lemma 53.8.2: proper, dimension 1, `H⁰ = k`, both conclusions).
  - 0CE4 (Lemma 53.18.4) and 0BY4 (Lemma 53.2.9).
  - 0A26 (Lemma 33.43.4) and 0A27 (Lemma 33.43.10, a curve is affine or H-projective).
  - Tau Ceti's `FlatBaseChange.lean:277` and `Genus/BaseChange.lean:72` were seen in the previous round, and the folder is unchanged.
- **§3.3.**
  - Tau Ceti `VectorBundle/Degree.lean` has the cited declarations at `:82` (`χ(E) − r·χ(O)` with `eulerCharBelow … 2`), `:102`, `:111`, `:116`, `:124`, `:132`, `:150` and `:168`. `FixedRank.lean` has them at `:52`, `:71` and `:106`; `Dominant.lean` at `:151` and `:170`; `GlobalSections.lean` at `:99`.
  - Stacks 0AYR, 0AYS, 0AYX, 0DJ5, 0B59 and 0AYY are each a proper scheme of dimension ≤ 1 over `k`, as cited.
  - 0AYZ is "nonconstant morphism of proper curves" with `E` locally free.
  - 0BS2, 0BS3, 0BS4 and 0BUG are as cited.
- **§3.6.**
  - Milne AV 2008, Part III: Remark 1.4 (a)–(e) is on p. 86 (`milne-av` line 3491). Theorem 1.6 is on p. 88. Remark 1.10 is on p. 89. Remarks 1.11–1.12 and Propositions 1.13–1.14 are on p. 90.
  - Stacks 0BA0 (1) is on book p. 3930 (separably closed `k`). 0C1A is on p. 4447.
  - Poonen–Stoll §2 is on pp. 1113–1114 (`poonen-stoll-1999` lines 211–218 and 222, the trivialization `t_x`). Index and period are on p. 1126 (line 661).
  - BGW Proposition 21 is on p. 10 (`bhargava-gross-wang-2017` line 414), with the setup on lines 386–413.
- **§4.5.** Stacks 07YG (Definition 98.22.1, obstruction modules on all `A`-modules) and 06GD (Definition 90.3.2: nonzero principal kernel killed by `m_B`) are as cited.
- **§4.6.**
  - Stacks 0DY7, 0DY8, 0DY9, 0DYA, 0ET5, 0DZQ, 0D14, 0D0N, 0C6R, 08S7, 08S5 and 0GPT are as cited, apart from the obstruction clause (R03).
  - Deligne–Mumford 1969 (Numdam text in the cache): the split-node example and Proposition (1.5) are on p. 81. The stable-curve consequence is on p. 82. Theorem (1.6) is on p. 83.
- **§4.9.** Stacks 02O5, 02OB, 02OC (Mittag-Leffler and `H^p(X,F)^∧ = lim H^p(X, F/IⁿF)`), 087U, 02OD and 03H0 (locally Noetherian base) are as cited.
- **§4.10.**
  - Stacks 088A, 088B, 088C (`I = IO_X`), 088E, 088F, 09ZT and 0A42 are as cited; 0A42 assumes `Y` separated of finite type (R02).
  - 089A needs an ample compatible system, as the README says.
  - `grothendieck_existence` allows any ideal sheaf with support `f⁻¹V(I)`. That is still true: `X` is Noetherian, so the two adic systems are cofinal.

### Other locators read

- **Stacks tags.** The following are at the stated numbers:
  - 01XF (quasi-compact; ideal sheaves);
  - 0AUW (Dedekind: flat iff torsion free);
  - 02UZ, 032W, 07QV, 03RV, 04MF, 025Y, 02X2, 03MJ, 04RD, 04QZ, 04QY, 043H, 06P9, 04TY;
  - 04S6 (3) and 04SK (bootstrap);
  - 0BEP, 0BEM, 0BEV, 02H0, 02HG, 02H6, 02HM, 07E8;
  - 0AB0 (integral `Y` required; the README's §4.16 says that the theorems assume it);
  - 06Z0, 0D66 (2), 0D67, 0D6C, 02RW, 03RC, 03RD;
  - 0FDI and 0FDJ (§5.7 docstring);
  - 0C1C, 0C1D, 0C1F.
- **Poonen.** Remark 6.5.11 is on p. 182 (`poonen-2017` line 7521).
- **Bhatt–Scholze.** Definition 3.1.1 is on p. 16, Proposition 3.2.3 on pp. 17–18, Proposition 3.3.3 on p. 19 and Proposition 4.2.8 on p. 29; the README's pages match arXiv v2.

### Duplication, ownership and supplier audit

- **Pins.** Neither pin has any of the following:
  - a scheme-level `FormallySmooth` or `FormallyEtale` (Mathlib has only `FormallyUnramified`, `Morphisms/FormallyUnramified.lean:54`);
  - an étale topological-invariance equivalence;
  - `IsLocallyNoetherian (∐ X)`;
  - an algebraic stack or coarse moduli space;
  - a Chern character or Todd class;
  - a Picard scheme (Tau Ceti has only the presheaf and sheaf `relativePicardFppfSheaf`);
  - a derived pushforward between `DQCoh` categories;
  - a Brauer group of a ring. Mathlib's `BrauerGroup` is for fields; Tau Ceti adds only its group structure.

  So the module docstring's six non-statable headlines are accurate: Keel–Mori, duality, the Brauer class, `Pic^d`, Schlessinger and GRR.
- **Mathlib suppliers.** The supplier contracts name `ModuleCat.depth`, `Ideal.depth` and `IsLocalRing.depth` from Mathlib (`RingTheory/Depth/Basic.lean:66`, `:73`, `:78`).
- **Citations.** `citations.md`: no cross-roadmap citation is found nowhere. The 135 Lean-name leads are this roadmap's own names (all 100 `Suggested.lean` names elaborate) or italic README-only items.
- **Overlaps.** `overlaps.md` lists no dropped id and no revision-only id. #1807, #1808 and #1854 change this folder and are ordered after this pull request in its description; see R01 for the stale #1276.
- **Ownership against close roadmaps.** None of these owns an object this roadmap owns:
  - PurityForFlatCohomology (#1840) consumes §§0.x, 2.7, 2.9–2.11, 2.22 and 1.15.
  - AlgebraicModuliForArithmeticGeometry (#853) consumes §1.17 (Artin's bootstrap) and §§1.1–1.11.
  - AdicCoefficientsAndComparisonsPartII (#1796) owns the equivariant and Gabber prime-to-ℓ alteration theorems, which are distinct from §§4.19–4.20.
  - EtaleCohomologyFoundations on main builds its sheaf transport on §0.23a's site equivalence.
  - ModularCurves and StableReduction both say they consume nothing.
- **Supplier order.** The roadmap is on main and cites only roadmaps on main as suppliers. The depcheck output above is clean.

### Adversarial table (computed values)

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.6 reflexive hull, `coherent_hartogs` | `Spec k[t]`, `F = k[t] ⊕ k[t]/(t)`; `𝔸²∖0`; two planes in `𝔸⁴`; cusp `k[t²,t³]` | `F^∨ = k[t]`, `F^∨∨ = k[t]` against `j_*F|_{D(t)} = k[t,t⁻¹]`. `Γ(𝔸²∖0,O) = k[x,y]`. For the planes, depth is 1 and `j_*O_U = k[x,y] × k[z,w] ≠ O_X`. For the cusp, `m^∨ = (A:m) = k[t]`, reflexive by 0AY4 | Pass; R04 |
| `exists_linear_normalization` | `𝔽₂[X,Y]/(XY(X+Y))`; `z = x²+xy+y²`; `k[X,E]/(E²)`; `A = k`, `x = (0)`; `A = k×k`, `x = (e₁)` | `A/(ℓ) ≅ k[T]` for `ℓ ∈ {x,y,x+y}`, so `A` is not finite over `k[ℓ]`. `x³ − zx = −xy(x+y) = 0`, and `z ↦ X²` under `y ↦ 0`. `d = 1` with basis `1, E`. `y = c·0` is dependent, so `d = 0`. `d = 0`, and `k → k×k` has rank 2 | Pass |
| §0.23 dichotomy Checks | `𝔽_{p²}/𝔽_p`; cusp; node, `char ≠ 2` | `𝔽_{p²}⊗𝔽_{p²} ≅ 𝔽_{p²}²` has 2 points over 1. The cusp has one point over the origin. `t = ±1` both lie over the node | Pass |
| `smallEtaleBaseChange_isEquivalence` | `Spec k → Spec k[ε]`; `Spec 𝔽_{p²} → Spec 𝔽_p` | A thickening, hence an equivalence by 04DZ. 2 endomorphisms against 4, so not fully faithful | Pass |
| §0.27 flat extension | `ℤ→ℤ[1/2]`; `k[x,y]→k[x]`; `ℤ/4→ℤ/2`, `m = 2`; `⊕ℤ ⊃ ⊕nℤ` over `ℚ` | `(4)∩(6) = (12) ↦ (3) = (1)∩(3)`. `(xy) ↦ (x²)` against `(x)∩(x) = (x)`. `(2) ↦ 0` against `Ann(0) = ℤ/2`. `Ann = 0` against `ℚ` | Pass |
| §0.28 quotient comparisons | `ℙ¹`, two rational points; `𝔸²∖0 → 𝔸²`, `I = (x,y)` | `Γ/ker = k` against `k × k`. Extended quotient `k` against kernel quotient `0` | Pass |
| §1.5 `quotientSheaf.restrict` | `R = ∅` on `Spec k`, `U′ = U ⊔ U`; `Δ ⊔ Γ`; quadratic `L/K` | `U′/∅` has 2 points against 1. `Γ ∩ Δ = ∅` as `x ≠ −x`. The presheaf quotient at `Spec K` is `∅`, the sheaf quotient has a point | Pass |
| §1.10 `smallEtale` | fold `S⊔S → S`; folded line; `𝔸¹ → Spec k` | A refinement of `{j₀,j₁}` forces `V = ∅`, so not cocontinuous. `Γ(O) = k[x²]`. Not étale, hence excluded | Pass; R05 |
| §1.21 `Stack.quotient` | Galois groupoid `Spec ℂ ⊔ Spec ℂ ⇉ Spec ℂ` over `ℝ` | prestack: 0 objects over `ℝ`; `[X/R] ≃ Spec ℝ`: 1 | Missing Check; R06 |
| §2.23 equivariant cohomology | point, `Γ = ℤ/2`, `F = ℤ`; `Γ = ℤ`; `Γ = 1` | `H^n_Γ = H^n(ℤ/2,ℤ) = ℤ, 0, ℤ/2, 0, …`. `Coind = ℤ^ℤ` against `Ind = ℤ[ℤ]`. `forget` is an equivalence | Pass |
| `isAffine_or_isProper` | `𝔸¹`; `ℙ¹`; doubled origin | Affine and not proper. `Γ = k`, so proper and not affine. Not separated, hence excluded | Pass |
| `genus_baseChange` | `ℙ¹_k`; `ℙ¹_L` over `k`, `K = L`; `y² = x^p − t` | `H⁰ = K`, `g = 0`. `dim_L L⊗_kL = [L:k] > 1`, excluded by `hH0`. `g = (p−1)/2` kept, while the normalisation has genus 0 | Pass |
| `vectorBundleDegree_pullback` | `z ↦ z²`, `O(1)`; `O^r`; `ℙ¹ ↪ V(z²)` | `2 = 2·1`. `0 = 2·0`. `deg O(1)|_{2L} = 3 − 1 = 2`, but the pullback has degree 1, and the target is not integral (excluded) | Pass |
| §3.3 Ext–Hom duality | nodal cubic, `K` at the node; `U = O_X` | `dim Ext¹(K,K) = 2` against `dim Hom(K,K⊗ω)^∨ = 1` (not locally free). `Ext¹(O,V) = H¹(V)` | Pass |
| §3.6 Picard torsors | real conic; elliptic `E` | `Pic = 2ℤ`, `Pic_{X/ℝ}(ℝ) = ℤ`, cokernel `ℤ/2 = Br ℝ`. `Pic^d ≅ E` | Pass |
| §4.5 obstruction theory | `k[[t]]/(t²)`, `t ↦ ε` into `k[ε]/(ε³)`; `ε ↦ 2ε` over `ℚ` | `(ε+cε²)² = ε² ≠ 0`, so `dim O ≥ 1`. The kernel is scaled by 4, and `v = 4v ⇒ v = 0` | Pass |
| §4.6 deformations | `ℙ¹`; elliptic `E`; `uv = t` | `H¹(O(2)) = H²(O(2)) = 0`. `H¹(T_E) = k`, `H²(T_E) = 0`. The fibre at `t ≠ 0` is smooth | Pass; R03 |
| §4.9 formal functions | `Spec A`; `ℙ¹_A` | `M^∧ = lim M/IⁿM`. `H⁰ = A`, `A^∧ = lim A/Iⁿ` | Pass |
| `grothendieck_existence` | `X = Spec A` | Compatible finite `A/I^{n+1}`-modules; their limit is finite over the complete `A` | Pass |
| `algebraize_hom` | `A = k[[t]]`, `Y = 𝔸¹_A`; `(a₀,a₁) = (0,1)`; `Y = ∐_n 𝔸¹_A` | `a = lim aₙ`. `(0,1)` is excluded by `hcompat`. For `∐_n 𝔸¹_A`, `G` lands in one component, so the statement is true, but outside 0A42 | Pass; R02 |
| `Ring.IsNagata/IsJapanese.of_complete_local` | `k[[x,y]]`; `ℤ_p`; a domain `A` | Nagata. For a domain, Japanese = Nagata plus `IsNagata.isJapanese` (probe exit 0) | Pass; R07 |
| `IsQuasiExcellentRing.isNagata` | `ℤ`; a field | `IsGRing ∧ IsJ2` gives Nagata (07QV) | Pass |
| `artinBootstrap` | `F = U`, `a = id`; `Spec L → h_{Spec K}` | An algebraic space. fppf-surjective, flat, lfp; 04S6 (3) | Pass |
| `torsorRepresentability`, `Torsor.trivial_iff_section` | `P = G`; the `μ₂`-torsor `Spec ℂ/ℝ` | Identity section. No `ℝ`-point and `P ≇ G` | Pass |
| `artinSchreier_vanishing` | `Spec 𝔽_p` | `H¹ = ℤ/p ≠ 0`, so `q ≥ 2` is needed. `H² = 0` (`cd_p Ẑ = 1`) | Pass; R08 |
| `isReplete_proetale` | `Spec k̄`; `Spec ℚ` étale | Replete. The `μ_{ℓⁿ}` tower has limit 0 in `Sh(ℚ_ét)` | Pass; R08 |
| `noetherianSpace_vanishing` | a point, `d = 0`; `ℙ¹`, `d = 1` | `H^{>0} = 0`. `H¹(O(−2)) = k`, `H² = 0` | Pass |
| `isAffine_of_H1_vanishing` | `ℙ¹`; `𝔸²∖0` | `H¹(O(−2)) = k ≠ 0`. `H¹(O)` is infinite-dimensional. Neither is affine | Pass |
| `flat_over_dedekind` | `S ⊔ 𝔸¹_S`; `Spec k[t,x]/(x², tx)` | Flat. Nonreduced, with `t·x = 0` torsion, hence excluded | Pass |
| `genus_of_finite_etale` | `[n]` on `E`; an étale double cover of genus 2; `Y ⊔ Y → Y` | `0 = n²·0`. `3 − 1 = 2·1`. `H⁰ = k²` is excluded by `hX` | Pass |
| `intersectionNumber` | `ℙ²`, `O(1)·O(1)`; `ℙ¹×ℙ¹`, `(1,0)²` | `1 − 0 − 0 + 0 = 1`; `1 − 0 − 0 + (−1) = 0` | Pass |
| `hodge_index` | `ℙ¹×ℙ¹`, `H = (1,1)`, `D = (1,−1)`; `H = D = (1,0)` | `H² = 2`, `D·H = 0`, `D² = −2`. `H² = 0` is excluded; there `D² = 0` while `D·(0,1) = 1` | Pass |
| `weil_bound` | `y²+y = x³` over `𝔽₂`; `ℙ¹/𝔽_q` | `|3 − 3| = 0 ≤ 2√2`; `0 ≤ 0` | Pass |
| `node_local_structure_dvr` | `a = 0`; `a = επⁿ` | Identity. `uv − επⁿ ↦ ε(u′v′ − πⁿ)` under `u ↦ εu′` | Pass |
| `alteration_theorem` | `𝔸¹`, `Z = 0` | `X̄₁ = ℙ¹`, `B = {0,∞}`, strict normal crossings | Pass |
| `semistable_alteration_theorem` | `ℤ_p[x,y]/(xy − p²)` | One blow-up gives three components meeting with local equations `uv = p` | Pass |
| Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR | the pins | No stack, `DQCoh` pushforward, scheme Azumaya, Picard scheme, `C_Λ` hull or Chern character at either pin | The docstring is accurate |

## Not verifiable

- **Grothendieck 1957 (Tôhoku), Chapitre V, §5.1, Proposition 5.1.1, p. 196** (§2.23). The cache holds only the Project Euclid landing page. Kings–Sprang line 3763 independently attributes "enough injectives" to that proposition.
- **Hartshorne 1977 and de Jong 1996.** Both are settled as uncertified and were not read. They are cited in §§3.4, 4.16–4.20 and 5.10.
- **Cadman 2005** (§1.21), **Couveignes 2019** (§0.10) and **Bhatt–Ma–Patakfalvi et al. 2020** (§0.11). These are outside the sample and were not opened.

## Source issues

- **Misprint** in Milne, *Algebraic Geometry* v6.10 at Remark 2.47, p. 53: the source says that Lemma 2.46 gives `c_1, …, c_n`; it should be `c_1, …, c_d`, the only constants that occur; affects nothing.
- **Misprint** in Milne, *Algebraic Geometry* v6.10 at the proof of Proposition 2.42, p. 52: the source calls `H` "the hyperplane"; it should be "the hypersurface", as in the statement; affects nothing.
- **Misprint** in kings-sprang at Appendix A.1, after Definition A.1, p. 79: the source says `Hom_{Γ,O_X}(O_X, G) ≅ Γ(X, F)^Γ`; it should be `Γ(X, G)^Γ`; affects nothing.
