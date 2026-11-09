# Review of AlgebraicTopology (pull request #1808 at 9ae8cc0)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/` at 9ae8cc0. Since 1e85c71 the folder changed by 418 lines (README +318/−100 overall, `Suggested.lean` 39 lines). I read the whole README (3000 lines), `Suggested.lean` and the seven companion `.lean` files.

## Status of the previous review's findings (r96, at 1e85c71)

| r96 | status | evidence at this head |
| --- | --- | --- |
| R01 companion files break the build | **not repaired** | `OrientationComparison.lean` 27 still uses `twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)`; the seven files are unchanged. Now R01. |
| R02 degree-one Hurewicz sign | repaired | README 2144–2165 defines η_n with `(singularHomologyCubeBoundaryPairIso ℤ n).inv = η_n·[Iⁿ,∂Iⁿ]`, η₁=−1, h̄=η_n·h and "`h[g]=η_n·g′_*[Sⁿ]`". 8.10 (2602–2610), 8.12 (2803–2806) and the docstring of `exists_universalClass_ordinaryEMPullback_bijective` (434–437) carry the sign. The values are recomputed in the table below. |
| R03 Serre/EM machinery has two owners | **partly repaired** | DGFloer at #1798 now consumes AT 4.8, 5.0, 5.5, 8.8c and 8.8d (its README 164–175, 197). DGFloer on main still owns them, the description states no order, and StableHomotopyKTheory #1227 still cites DGFloer Layer 1 items 1–4. Now R03. |
| R04 DGFloerPartII owns the same coreflection | **partly repaired** | `Suggested.lean` 110–111 now states `.{u, w}`. #1799 still states and builds its own (`Suggested.lean` 106–107, README 491–506). Now R04. |
| R05 pinned theorems restated | repaired | The Inventory (380–421) consumes `brouwerFixedPoint_closedBall`, `exists_isCellular_homotopicRel`, the transfer, torus, Kan and K(A,1) declarations. 2.7, 4.5, 5.3, 5.4, 8.2 and 8.8d cite them and keep only the residuals. Every name resolves at the pin (list below). A further, separate duplicate is R02. |
| R06 no Checks for the declared definitions | repaired, one short | Checks were added at 1575–1584, 2469–2490, 2541–2555 and 2646–2656. `continuousHomotopySetoid` has two: R07. |
| R07 Hatcher "Section 0.4"; four headlines without locator | repaired | 1066 and 2950 now read "Chapter 0". Strickland Cor 1.9–1.10, KMR Theorem A, Hatcher §3.2 Exercise 2 and Goerss–Schemmerhorn Ex 2.15/Thm 4.1 were added and verified (sample rows 1–7). Two other headlines still lack a locator: R06. |
| R08 `0 < d` unneeded | repaired | `Suggested.lean` 390 has no `_hd`. The docstring (385–387) and README 2494–2497 treat d = 0 and d = 1. |
| R09 edits outside the folders | **not repaired** | The gate still reports `outside-folder=2`. Now R08. |
| R10 no merge order for conflicting heads | **not repaired** | The description is unchanged. Now R09. |

No repair report marks any r96 finding "not actionable in this package", so none of these are re-raises in the board's sense.

## R01 (P1) — The six orientation companion files still use definitions this pull request deletes, so `lake build` fails

**Location.** `TauCetiRoadmap/AlgebraicTopology/OrientationComparison.lean`:
- line 1: `import TauCetiRoadmap.AlgebraicTopology.Suggested`;
- line 2: `import TauCetiRoadmap.DifferentialGeometry.Suggested`;
- lines 14–15: `set_option maxHeartbeats 800000`;
- line 27: `twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)`.

`ChartSimplexLocalImage`, `CompactOrientationLaws`, `GeneralModelOrientation`, `BoundaryInteriorComparison` and `BoundaryCarrierOrientation` import it.

**Claim.** This pull request deletes `puncturedPair`, `twistedRelativeHomology`, `coordinateSimplexPair` and `fullSimplex` from `Suggested.lean`. Main's file defines `puncturedPair` at line 352. `lakefile.toml` globs `TauCetiRoadmap.*`, and `.github/workflows/ci.yml` line 131 runs `lake build`, so the companion modules fail to build. The worker's targeted build of `Suggested` cannot see this.

The files also break the form rules:
- six `set_option` lines (`OrientationComparison` 14–15, `CompactOrientationLaws` 14–15, `BoundaryInteriorComparison` 15–16);
- imports of another roadmap's module;
- 42 `sorry`s.

`TopologicalGroupFundamentalGroup.lean` compiles, but it re-proves the pinned `FundamentalGroup.instCommGroup` and `cast_map_prod_mul`, which README 1.6 consumes.

**Witness.** A scratch file containing `import TauCetiRoadmap.AlgebraicTopology.Suggested` and `#check @puncturedPair` (likewise for the other three names) fails four times with `Unknown identifier`.

**Repair.** Delete the seven files; README 1.6 and 6.3 already state their content. Test: the same probe file then has nothing left to import them, and `lake env lean` on `Suggested.lean` still exits 0.

## R02 (P2) — Stage 5.0 restates the pinned convergence theory of the filtered-complex spectral sequence, and 5.5 ignores the pinned filtered-space spectral sequence

**Location.**
- README 1081–1093: "Reuse … [`Filtered/SpectralObject.lean`](…/720bf8c…) … Construct the sequence … and prove natural strong convergence: the induced filtration … is exhaustive and bounded below".
- README 1241–1246 (5.5): "using … the actual filtration `E_p=p⁻¹(B^(p))` … apply item 0's filtered-complex construction".

**Claim.** The README cites only `SpectralObject.lean`, through a GitHub link at commit 720bf8c, which is not the pin. The pinned Tau Ceti already has:
- the abutment and its image filtration;
- exhaustiveness of the abutment filtration;
- strong convergence for exhaustive filtrations;
- the comparison theorem, with naturality;
- the singular-chain instance for an increasing family of subspaces, with first page and differential.

None of these appears in the Inventory or in 5.0/5.5. DGFloer at #1798 lists them as pinned (its README 735–745) and leaves AT 5.0 only the decreasing complete filtrations.

**Witness.** At the pin, under `TauCeti/Algebra/Homology/SpectralSequence/Filtered/`:
- `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive` (`Exhaustive.lean`:177);
- `exists_mem_range_filtrationAbutmentFiltrationι` (:102);
- `isIso_homologyMap_of_isIso_spectralSequence_page_of_exhaustive` (:200).

`TauCeti.singularChainFiltration` and `filteredSpaceSpectralSequence_first_page_d_eq` are in `AlgebraicTopology/Singular/FilteredSpace.lean` (:101, :420).

**Repair.**
1. Add to the Inventory, and consume in 5.0:
   - `filtrationAbutmentIso` and `toFiltrationAbutmentFiltration_comp_filtrationAbutmentIso_hom` (`Convergence.lean`:51, 91);
   - the three `Exhaustive.lean` declarations above;
   - `filtrationFunctorMap` (`Naturality.lean`:83);
   - `isIso_homologyMap_of_isIso_spectralSequence_page` (`Comparison.lean`).
2. Keep as owned only:
   - the homological regrading;
   - the E∞ identification without the pinned hypothesis that graded pieces eventually have vanishing cohomology (`h₃`), stating that difference;
   - the complete-convergence form (Weibel 5.5.10).
3. In 5.5, consume `singularChainFiltration`, `filteredSpaceSpectralSequence`, `filteredSpaceSpectralSequenceFirstPageXIso` and `filteredSpaceAbutmentIso` for `E_p=p⁻¹(B^(p))`. Own the exhaustion and the E² identification.
4. Replace the commit link by the module path at the pin.

Test: on the skeletal filtration of a CW base, `F_{−1}=⊥` and H_m(E_p,E_{p−1})=0 for m<p, so the pinned exhaustive theorem already gives 5.5's convergence.

## R03 (P2) — The Serre and Eilenberg–MacLane machinery still has two owners until DGFloer is changed with it (partly repaired)

**Location.** README 112–133: "The ordinary Serre and Eilenberg–MacLane machinery is owned here. … [DGFloer] Layer 1 consumes these ordinary targets". Stages 5.0, 5.5, 8.8c and 8.8d claim ownership.

**Claim.** The counterpart edit exists, in DGFloer at #1798 (a draft by the same author), which consumes AT 4.8, 5.0, 5.5, 8.8c and 8.8d. But:
- DGFloer on main still owns the same objects;
- this pull request's description names neither #1798 nor an order;
- StableHomotopyKTheory #1227 at 23a1323 still takes these objects from DGFloer Layer 1 items 1–4 (its supplier paragraph and §3.36's *Needs:* line).

If this pull request merges alone, main has two owners.

**Witness.** DGFloer on main, README 196–203: "In particular this roadmap owns: … Serre classes". DGFloer #1798, README 173: "Layer 1 item 4's Serre classes and Hurewicz modulo a Serre class: AlgebraicTopology Stage 8.8d."

**Repair.** In this pull request's merge-order paragraph, state that #1798 merges together with or right after it. Repoint #1227's citations of DGFloer Layer 1 items 2–4 to AT 5.0, 5.5, 8.8c and 8.8d. Alternatively, add DGFloer's change to this pull request.

## R04 (P2) — DGFloerPartII still owns the compact-generation coreflection that Stage 4.5 owns (partly repaired)

**Location.** README 138–146 and 902–924: "Own the single compact-generation coreflection … for all universes `u` and `w` (`compactlyGeneratedToTop_isLeftAdjoint`)". `Suggested.lean` 110–111.

**Claim.** DGFloerPartII #1799 consumes AlgebraicTopology Stages 2, 4, 6 and 8 (its README 100). Its 1.0 nevertheless builds and states the same right adjoint of the same functor. AlgebraicTopology is on main and earlier, so #1799 must cite Stage 4.5.

**Witness.** DGFloerPartII #1799, `Suggested.lean` 106–107: `theorem compactlyGeneratedToTop_isLeftAdjoint : (CompactlyGenerated.compactlyGeneratedToTop.{u, w}).IsLeftAdjoint`. Its README 497–499: "Mathlib's coreflection `GeneratedByTopCat.adj` transports to a right adjoint `k` …".

**Repair.** Record in this pull request's description that #1799 replaces its 1.0 coreflection paragraph and `Suggested.lean` 106–108 with a citation of AlgebraicTopology Stage 4.5. Alternatively, make that change in #1799 now.

## R05 (P3) — "DG2.4's outward-first S² orientation" cites a section that does not state it

**Location.**
- README 1796–1797: "using DG2.4's outward-first S² orientation";
- README 2841: "DG2.4 sphere and DG5.1 outward-first boundary conventions".

**Claim.** DifferentialGeometry 2.4 is the orientation double cover. It contains no outward-first orientation of S², only the acceptance remark that spheres are orientable. The outward-first orientation is DG 5.1's `boundaryOrientation`.

**Witness.** DifferentialGeometry on main, README 362–369: "**2.4 The orientation double cover.** `OrientationCover I M` … *Acceptance:* … spheres are orientable". README 507–509 (5.1): "`IsOutwardPointing` … the outward-first `boundaryOrientation`".

**Repair.** At 1797 and 2841, cite "DG 5.1's outward-first `boundaryOrientation` of the closed unit ball of ℝ³, on its boundary S²". Test: at x ∈ S², the outward-first bases `(x,v₁,v₂)` and `(−x,−v₁,−v₂)` of 4.6 have determinants of opposite signs, as the README already states.

## R06 (P3) — The two finite-CW-type headlines carry no source locator

**Location.**
- `Suggested.lean` 242–245: "**Compact smooth manifolds have finite CW type** (Stage 8.7, boundaryless case) … through GeometricTopology's smooth triangulation";
- 251–253 (half-space case);
- README 2318–2325.

**Claim.** Every theorem needs a locator. The supplier citation (GeometricTopology item 1) names an owner, not a source. Hatcher's Corollary A.12 gives only CW type, not finite CW type: Hatcher notes that domination by a finite complex does not suffice (hatcher 22936–22941).

**Witness.** Neither docstring nor README 8.7 names a theorem number.

**Repair.** Cite a theorem for each case and check it at its text. Candidates, which I did not read:
- Milnor, *Morse Theory*, Theorem 3.5 (manifest key `milnor1963`, uncertified), for the boundaryless case;
- J. H. C. Whitehead, *On C¹-complexes* (Ann. of Math. 41, 1940), for smooth triangulations including boundary.

## R07 (P3) — `continuousHomotopySetoid` has two Checks

**Location.** README 2647–2649: "on S¹ the identity and the antipodal map are related, by rotation through half a turn, while the identity and a constant map are not".

**Claim.** Each definition needs at least three discriminating Checks.

**Repair.** Add a third Check, for example: any two maps from a contractible source such as [0,1] into a path-connected Y are related, while for Y = S⁰ the two constant maps from a point are not. This excludes both the equality relation and the total relation.

## R08 (P3) — Edits outside the pull request's folders; the gate fails (not repaired from r96 R09)

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77, one line each.

**Witness.**
- The worker's gate at 9ae8cc0 reports `outside-folder=2 … FAIL`.
- The brief's `git diff --stat`, which excludes the fifteen named folders, lists exactly these two files.
- My rerun of the gate without the folder list fails only on `outside-folder`, every other scanner reporting 0.

**Repair.** Drop the two hunks, or name both folders as the pull request's own.

## R09 (P3) — No merge order for the conflicting open heads; the description omits this roadmap (not repaired from r96 R10)

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**."

**Claim.**
- `overlaps.md` lists conflicts in this folder with #1187, #1652, #1797 and #1854 (besides #1807), with no order stated.
- #1652 places the coreflection at 4.8 where this head has 4.5, so the heads change the same targets differently.
- The description does not mention AlgebraicTopology, nor the moves of R03 and R04.

**Repair.**
- Summarize this folder's change in the description: pinned theorems consumed, the Hurewicz sign unit, the coreflection universes, and Serre/EM ownership from DGFloer.
- For each of #1187, #1652, #1797 and #1854, state which is rebased on which.

## Verified sound

**Gate, dependency check, elaboration.**
- **Dependency check.** `tauceti-roadmap gate --depcheck …` prints `depcheck: 235 roadmaps, 2258 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. AT's supported-cellular supplement consumes CharacteristicClasses C1.2a S0–S4. C1.2a consumes only AT 2–4 and 6.1–6.2 (CharacteristicClasses README 320–324). This was already on main ("CC C1.2a", main AT 1742), and the item graph is acyclic.
- **Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` exits 0 in 11 s. Its only output is 14 `declaration uses sorry` warnings (lines 110–466).
- **Signatures.** I elaborated `#check @` for all 26 named declarations in one scratch file with `pp.universes`. `compactlyGeneratedToTop_isLeftAdjoint.{u_1,u_2}` has two universes. `hurewicz_mod_isKilledBySomePower` takes `d` with no hypothesis. The file has no `variable` block, so no binder is lost. Each type has the README's generality.
- **Padding probe.** I replaced each `sorry` by `first | rfl | infer_instance | trivial | simp | decide | exact ⟨Classical.choice inferInstance⟩ | aesop`. All 14 theorems still fail, so none is padding.
- **Library leads.** `library-matches.md` has no same-name hit, and the coreflection is still absent from Mathlib (only `fullyFaithfulCompactlyGeneratedToTop`, `Topology/Category/CompactlyGenerated.lean`:82).

**Newly cited pinned names, opened at Tau Ceti 2fd255d / Mathlib 1b1ccf4.**
- `Singular/BrouwerFixedPoint.lean`:149, 159; `CellularApproximation.lean`:94, 106 (statement read: rel base, not rel subcomplex, so the residual is right); `DeltaGenerated.lean`:61, 66.
- `Transfer/PermutationLocalSystem.lean`:207, 266; `Composition.lean`:42; `Degree.lean`:54; `Torus/Exterior.lean`:325, 343; `Pontryagin/Exterior.lean`:416.
- `SimplicialSet/KanComplex.lean`:48; `Homotopy/SingularSet.lean`:164, 208, 265, 282; `KanComplex/SimplicialGroup.lean`:186, 233.
- `ClassifyingSpace/Torsion.lean`:66, 73, 91 (finite `A` only, as the README says).
- `IntervalGenerator.lean`:157 (`spherePlus` = e₀), 165, 295; `Disk.lean`:336 (`diskHomeomorphCube` = radial rescaling then the inverse affine cube map, matching 8.3).
- `Hurewicz/One/Comparison.lean`:95, 160; Mathlib `CompactlyGeneratedSpace.lean`:211 (`SequentialSpace → UCompactlyGeneratedSpace.{u}` in every universe) and `DeltaGeneratedSpace.lean`:58.
- `DoldKan/HomotopyGroups.lean` exists; it is the one name `citations.md` flags. It builds on `KanComplex/MooreComplex.lean`'s `piAddEquivNormalizedMooreComplexHomology`.

**Cross-roadmap citations resolved.**
- ClassifyingSpaces Layer 1 items 1.1–1.3 (its README 37–47).
- CharacteristicClasses C1.2a S0–S5 (919–929).
- GeometricTopology's smoothing-and-triangulation comparison item 1 (main, 776–778).
- DifferentialGeometry 2.2 and 5.1 (main, 352, 507); for 2.4 see R05.
- DGFloer main and #1798, DGFloerPartII #1799, StableHomotopyKTheory #1227: see R03 and R04.
- HomotopySpheres #1287 consumes AT's coreflection and does not own it. AT cites HomotopySpheres only as a consumer (164).
- AlgebraicTopologyPartII #1694 drops no AT id. Its "Hurewicz modulo Serre classes" is #1227 §3.36, a variant for abelian spaces (Hatcher SSAT 1.7–1.8), not a second owner of 8.8d.

**Ownership against open pull requests.** I searched the Lean files of main and all open heads by object for:
- the cup-length bound;
- the bundle Euler formula;
- `OrdinaryEMModel`;
- Hurewicz mod C;
- duality by cap with the fundamental class;
- homological Whitehead.

The only hits are other revisions of this same roadmap (#1652, #1797, #1807, #1854, #1187), which R09 covers. No `Suggested.lean` declaration repeats a fully qualified name of another roadmap; #1799's coreflection lives in its own namespace.

**Seeded sample.** The worker found no target by heading, so I chose 15 and read each in the cache.

| # | target | locator | text read | result |
| --- | --- | --- | --- | --- |
| 1 | 4.5 coreflection (headline) | Strickland Cor 1.9, 1.10 | strickland2009 73–80 | k²X=kX; maps from a CG space into X and into kX agree: supports |
| 2 | 4.5 references | Strickland Prop 1.6, 1.7 | strickland2009 55–68 | sequential ⇒ CG; LCH ⇒ CGWH: supports |
| 3 | 4.5 products | Strickland Prop 2.6 | strickland2009 122–123 | X LCH and Y CG ⇒ X×₀Y CG: supports |
| 4 | 7.2 headline | KMR Theorem A | kmr2023 48–51 | F, B finitely dominated ⇒ χ(E)=χ(F)χ(B); the README's bundle form follows componentwise: supports |
| 5 | 8.8c Kan/Moore | Goerss–Schemmerhorn Ex 2.15 | goerss-schemmerhorn2006 742–769 | simplicial groups fibrant; πₙ≅Hₙ(NX) with N=⋂_{i≥1}ker dᵢ, as README 2130: supports |
| 6 | 8.8c Dold–Kan | Goerss–Schemmerhorn Thm 4.1 | 1048–1050 | N is an equivalence: supports |
| 7 | 6.2 cup-length headline | Hatcher §3.2 Exercise 2 | hatcher 9937–9941 | n contractible opens ⇒ n-fold products vanish: supports |
| 8 | 4.5 cellular approximation | Hatcher Thm 4.8 | hatcher 15205–15207 | the second sentence is the rel-subcomplex form the README owns: supports |
| 9 | 8.4 headline | Hatcher Thm 4.37 | hatcher 16124–16126 | n ≥ 2, path-connected spaces, π′=π for simply connected A: supports |
| 10 | 8.5 headline | Hatcher Cor 4.33 | hatcher 16001–16002 | CW form; the weak-equivalence form follows by CW approximation: supports |
| 11 | 6.4 headline | Hatcher Thm 3.30 | hatcher 10453–10455 | closed R-orientable: supports |
| 12 | 8.10 headline | Hatcher Thm 4.57 | hatcher 17069–17071, 17083–17088 | free classes for n>1 and for abelian G at n=1: supports |
| 13 | 8.11b route | Hatcher Lemma 4.31 | hatcher 15931–15935 | ψ realized for Y path-connected: supports |
| 14 | 8.8c uniqueness, 8.5 docstring | Hatcher Prop 4.30, Ex 4.35 | hatcher 15928, 16042–16050 | supports (Ex 4.35 needs n>1, which the docstring omits; harmless) |
| 15 | 8.7 headline | Hatcher Cor A.12 | hatcher 22936–22941 | CW type only, not finite CW type: see R06 |

**Adversarial table.**

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| `compactlyGeneratedToTop_isLeftAdjoint.{u,w}` | X uncountable with the cocountable topology; X compact T2; u ≠ w | compacts finite, so kX discrete ≠ X and the counit is a bijection, not a homeomorphism; kX = X; k(kX)=kX by Strickland 1.9's argument with test spaces in `CompHaus.{u}` | true | R04 (owner) |
| `bijective_singularCap_fundamentalClass` | M=∅; S², p=0,1,2; two points, n=0; M=ℝ | 0→0; ℤ→ℤ, 0→0, ℤ→ℤ; ℤ²→ℤ²; H⁰=ℤ vs H₁=0 (excluded by compactness) | true | none |
| `eulerChar_totalSpace` | Hopf S³→S²; Klein bottle→S¹; B=2 points, F=S²; S²→RP² (F=2 points); F=∅ | 0=2·0; 0=0·0; 4=2·2; 2=1·2; 0=χ(B)·0 | true | none |
| `lsCupLength_add_one_le_lsCategoryCount` | point; Sⁿ/ℤ; T²; RP²/𝔽₂; ℂP²/ℤ; zero ring | 0+1≤1; 1+1≤2; 2+1≤3; 2+1≤3; 2+1≤3; 0+1≤count≥1 | true | none |
| `lsCupLength` Checks (1575–1584) | RP² over 𝔽₂ and ℤ; ℂP² wrong model | a²≠0 gives 2; H¹(RP²;ℤ)=0, H²=ℤ/2 gives 1; top degree 4 vs cup length 2 | Checks right | none |
| `bijective_relativeHurewicz_of_simplyConnected` | (D³,S²), n=1; (S¹∨S², S¹), n=0; (S², pt), n=0 | π₃=π₂S²=ℤ≅H₃; ℤ[t,t⁻¹]→ℤ augmentation (hB fails); ℤ≅ℤ. Pinned `hurewiczIntHom` is degree n+2 (`Relative/Hurewicz.lean`:385–388) | true | none |
| `isWeakHomotopyEquivalence_of_isIso_singularHomologyMap` | degree-one P→S³; Hatcher Ex 4.35; id | π₁(P) of order 120 (excluded); not simply connected (excluded); trivial | true | none |
| `finiteCWType_of_compactSpace_of_isManifold(_halfSpace)` | n=0; S¹; D² with n=2 | finite discrete; one 0-cell and one 1-cell; a 2-cell on S¹ | true | R06 (locator) |
| `OrdinaryEMModel` | S¹(ℤ,1); RP^∞(ℤ/2,1); S²(ℤ,2); S¹⊔S¹ | model; model; π₃=ℤ fails `vanishing`; fails `connected` | Checks discriminate | none |
| `NormalizedAbelianEMFamily` | ×2 on ℤ; ℤ→0; f ↦ map of −f | acts by 2 on π₁; target weakly contractible; map(𝟙)=−id fails `map_id` | laws exclude the wrong model | none |
| `exists_ordinaryEMModel_iso_doldKanRealization` | A=0; A=ℤ, n=0 | Γ=point; Γ₀=0 (one vertex), Γ₁=0, Γ₂=ℤ, π₂=H₂(ℤ[2])=ℤ | true | none |
| `ordinaryDoldKanSimplicialModel`/`Basepoint` Checks | A=ℤ, n=1; n=0 | Γ₂(A[1])=⊕ over 2 surjections [2]↠[1] = ℤ² (nerve of ℤ); Γ(A[0]) constant A, discrete realization | Checks right | none |
| `hurewicz_mod_isTorsion` | n=0, S²; K(ℤ/2,2), n=1 | H₁=0, h₂ iso, π₃=ℤ→H₃=0 onto; h₃: 0→0, coker h₄ = H₄ = ℤ/4 torsion | true | none |
| `hurewicz_mod_isKilledBySomePower` | d=0; d=1, S³, n=1; d=2, K(ℤ/3,2), n=1 | all groups (0¹=0); π₃≅H₃, π₄=ℤ/2→0 onto; ℤ/3 not killed by 2ᵏ (excluded) | true | none |
| `IsSerreIso`/`IsSerreEpi`/`hurewiczInt` Checks | ×2 on ℤ; 0→ℤ/5; π₄(S³)→H₄(S³) | coker ℤ/2; coker ℤ/5 torsion, not 2-power; kernel ℤ/2 torsion | Checks right | none |
| `exists_universalClass_ordinaryEMPullback_bijective` | m=0, K=S¹ with X=S¹, ∅, S⁰; A=0 | ℤ≅H¹=ℤ; 1 class↦0; 1 class, H¹(S⁰)=0; contractible K, H¹(X;0)=0 | true | none |
| 8.3 η_n, 8.10, 8.12 degree one | n=1; X=S¹, g=q; σ_a labelled a; loop t↦t mod ℤ | pinned inv = −cubeRelClass ⇒ η₁=−1; 4.4 disk coefficient −ε₀=−1 agrees; h[q]=−[S¹]; ⟨ι,[σ_a]⟩=η₁a=−a; ⟨ι,[loop]⟩=−1 | consistent (R02 of r96 repaired) | none |
| 8.11b ζ_n | g×id_I | h[g×id]=η_{n+1}h̄[g]×[I]=η_nη_{n+1}h[g]×[I]; values on suspended Hurewicz images determine H̃^{n+1}(ΣK(A,n)) (n-connected, Freudenthal onto at i=n) | consistent | none |
| 8.2 orientation of the pinned `ofCube` | n=1; n=2; induction | t↦(1−t,t): 0↦v₀, 1↦v₁, degree +1; Jacobian det[[1−t₁,−t₀],[t₁,t₀]] = t₀>0; cone step multiplies by t₀ⁿ>0 | +1 as claimed | none |
| 4.4/6.3 zero-sphere signs | native generator, s₀ | [−e₀]−[e₀] with e₀=p ⇒ ε₀=1; s₀=[q]−[−q]=−ι₀ ⇒ σ₀=−1=−ε₀ | consistent | none |
| 5.4 integer-matrix form | swap on T²; diag(2,1); M=(1 1):T²→S¹ | det −1 on H₂; 2; H₁ map (1,1) (sum) | right | none |
| 4.5 cocountable Check | X uncountable cocountable, Y a point | compacts finite ⇒ kX discrete ⇒ k(X×Y)=kX≠X×Y | right | none |
| 8.8d Prüfer step | d=4, A=ℤ/2; A=⊕_ℕℤ/d | summand order 2 divides 4; finite stages give only dⁱ, Prüfer gives the uniform d^k | right | none |
| 5.0 convergence vs the pin | skeletal filtration of a CW base | F₋₁=⊥, H_m(E_p,E_{p−1})=0 for m<p: hypotheses h₀, h₃ of `filtrationSpectralSequencePageXIsoGradedOfExhaustive` hold | already pinned | R02 |
| 6.3 "DG2.4 S² orientation" | DG main 362–369 vs 507–509 | 2.4 is the orientation double cover; outward-first is 5.1 | supplier drift | R05 |

## Not verifiable

- **Serre 1953, Théorème 1** (README 2529; `Suggested.lean` 365, 383). Annals 58 is paywalled; the work is settled as uncertified.
- **May 1967.** An image-only scan; OCR is not available on this worker. It stays in `needs-references.toml`.
- **Other uncertified texts.** tom Dieck 9.5.1; Weibel 5.5.1(2) and 5.5.10; Milnor *Morse Theory* 3.6–3.7; Freedman–Quinn 7.7; Dowker 1952.
- **Not in the cache, cited at chapter level.** Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown, Serre 1951 and Brown's *Topology and Groupoids*. The previous review read Brown §6.7.
- **The candidate locators of R06.** Milnor 1963 Theorem 3.5 and Whitehead 1940 were not read.
- **#1652's description.** Whether it states its order relative to this pull request was not checked; R09 asks for the order in this description.

## Source issues

- none
