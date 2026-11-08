# Review of AlgebraicTopology (pull request #1652 at 4e825d6)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/AlgebraicTopology/` at 4e825d6. The folder is byte-identical to the head the previous review read; every passage was re-read, and both files were re-checked against both Tau Ceti revisions in play. Those are the branch pin `358314d4` from the branch's `lake-manifest.json`, and `2fd255d9`, the revision the README declares at `:220`–`:223`, which main uses.

## R01 (P2) — The branch pins an older Tau Ceti than the README cites, and at the cited revision the roadmap re-plans results Tau Ceti already proves

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md:220`–`:223` ("read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…`"); `:677` ("Own the single generic no-retraction and finite-dimensional Brouwer theorem"); `Suggested.lean:25`–`:28`, `:63`, `:105`–`:115`, `:209`–`:229`.

**Claim.** The README reads every supplier name at `2fd255d9`. The docstring says that at the pins Hurewicz has no map and relative Hurewicz has no carrier. Brouwer, the categorical cover and count, based pairs, relative groups and Whitehead are planned as this roadmap's own work.

**Witness.** `lake-manifest.json` pins Tau Ceti `358314d4`, where 28 names cited at `:225`–`:356` are absent (Serre fibrations, `ModuleTower`, `ComplexTower`, two cellular `isIso_…`). At `2fd255d9`, `TauCeti.brouwerFixedPoint_compactConvex` (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean:125`) states `Suggested.lean:63` verbatim. The rest are in the table below.

| README target | Native at Tau Ceti `2fd255d9` (all absent at `358314d4`) |
| --- | --- |
| §2.7 Brouwer, every form | `TauCeti.brouwerFixedPoint_topCatDisk`, `brouwerFixedPoint_compactConvex`, `brouwerFixedPoint_compactConvex_continuousOn`, `brouwerFixedPoint_closedBall`, `brouwerFixedPoint_compactConvex_finiteSpan` (`AlgebraicTopology/Singular/BrouwerFixedPoint.lean:91`, `:125`, `:140`, `:149`, `:159`) |
| §6.2 categorical covers and count | `TauCeti.LSCategoricalCover` (`Topology/Homotopy/LusternikSchnirelmann.lean:84`: `opens : Fin n → Opens X`, cover of A, nullhomotopic inclusions) and `TauCeti.lsCategoryCount` (`:264`, infimum over n with a cover), the same fields and value as `Suggested.lean:105`–`:115` |
| §8.1 based pair and relative groups | `TauCeti.BasedTopPair` (`Topology/Category/BasedTopPair.lean:41`: `pair : TopPair`, `basepoint : pair.snd`, the Conventions carrier at `:206`–`:211`), `TauCeti.RelHomotopyGroup` (`AlgebraicTopology/Homotopy/Relative/Basic.lean:302`) |
| §8.3 absolute Hurewicz | `HomotopyGroup.bijective_hurewicz` (`AlgebraicTopology/Homotopy/Hurewicz/Absolute.lean:161`) |
| §8.4 relative Hurewicz map | `TauCeti.RelHomotopyGroup.surjective_hurewicz`, `…bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean:199`, `:282`); bijectivity only for (n−1)-connected A, so §8.4's simply connected A remains |
| §8.5 Whitehead, CW type, simple connectivity at infinity | `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv` with `homotopyEquiv_toFun : hf.homotopyEquiv.toFun = f` (`AlgebraicTopology/Homotopy/Whitehead.lean:243`, `:263`), whose predicate is exactly `hcomponents` ∧ `hpositive` of `Suggested.lean:212`–`:216`; `TauCeti.CWType` (`Topology/CWComplex/Classical/CWType.lean:38`); `TauCeti.SimplyConnectedAtInfinity` (`AlgebraicTopology/Homotopy/SimplyConnectedAtInfinity.lean:71`) |
| §§7.2–7.3 product and cover | `TauCeti.cwEulerChar_prod` (`AlgebraicTopology/Cellular/EulerCharacteristic/Product.lean:48`), `TauCeti.cwEulerChar_preimage_of_card_fiber` (`Covering.lean:87`) |
| §5.1 field and hereditary Künneth, §6.1 UCT | `TopCat.singularHomologyKunnethIso` (`AlgebraicTopology/Singular/Kunneth/Basic.lean:257`), `singularHomologyKunnethUnitSplitting` (`Kunneth/Sequence.lean:416`), `singularUniversalCoefficientEquiv` (`AlgebraicTopology/Cohomology/UniversalCoefficient.lean:209`) |

**Repair.**
1. Merge `origin/main`, which brings the pin bump to `2fd255d9`/`1b1ccf4b`. Resolve the modify/delete conflicts on `GeneralModelOrientation.lean` and `TopologicalGroupFundamentalGroup.lean` by keeping the deletions, as `b7e4a027` did, and re-run the gate at that pin.
2. Delete `brouwerFixedPoint_compactConvex`, `LSCategoricalCover`, `lsCategoryCount`, `ordinaryWhitehead`, `ordinaryWhitehead_cwType` and `CWTypeModel` from `Suggested.lean`. Restate `lsCupLength_add_one_le_categoryCount`, `homologicalWhitehead_cwType`, `nonempty_homotopyEquiv_sphere_of_homologySphere` and `finiteSourceMappingCWType` on `TauCeti.lsCategoryCount` and `TauCeti.CWType`.
3. Name every row of the table, with its file, in "From Mathlib and Tau Ceti". Cut §§2.7, 6.2 (cover and count), 8.1 (carrier), 8.3 and 8.5 (ordinary Whitehead) down to what those files lack: relative Hurewicz for simply connected A, homological Whitehead, ends, proper Whitehead and the cup length.
4. Rewrite the docstring at `:25`–`:28` and `:42`–`:44`. Absolute Hurewicz and field Künneth are native, and §8.4's theorem becomes statable on `TauCeti.RelHomotopyGroup` with the native relative Hurewicz map: state it.

Tested: every row's declaration was found by name at `2fd255d9` and is absent at `358314d4`.

## R02 (P2) — The Euler characteristic and finite-CW-type carriers restate Tau Ceti at the branch's own pin

**Location.** `Suggested.lean:163`–`:165` (`finiteCWEulerCharacteristic … := ∑ᶠ i : ℕ, (-1 : ℤ) ^ i * Nat.card (Topology.RelCWComplex.cell (Set.univ : Set X) i)`), `:168`–`:175`, `:257`–`:258`; `README.md:2444`–`:2445`, `:2874`–`:2875`.

**Claim.** `finiteCWEulerCharacteristic`, its homotopy invariance and `FiniteCWTypeModel` are new objects of this roadmap.

**Witness.** At `358314d4`, `TauCeti.cwEulerChar_def` (`AlgebraicTopology/Cellular/EulerCharacteristic/Basic.lean:67`) is this body. A scratch probe proves equality by `rfl` and invariance in two lines from `ContinuousMap.HomotopyEquiv.eulerChar_eq` (`FiniteCWType.lean:126`). README `:298`–`:299` forbids "another cellular Euler invariant".

```lean
example (X : Type u) [TopologicalSpace X] [CWComplex (Set.univ : Set X)]
    [CWComplex.Finite (Set.univ : Set X)] :
    finiteCWEulerCharacteristic X = TauCeti.cwEulerChar (Set.univ : Set X) := rfl

example {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] [T2Space X] [T2Space Y]
    [CWComplex (Set.univ : Set X)] [CWComplex.Finite (Set.univ : Set X)]
    [CWComplex (Set.univ : Set Y)] [CWComplex.Finite (Set.univ : Set Y)] (e : X ≃ₕ Y) :
    finiteCWEulerCharacteristic X = finiteCWEulerCharacteristic Y := by
  have h := ((Homeomorph.Set.univ X).toHomotopyEquiv.trans
    (e.trans (Homeomorph.Set.univ Y).symm.toHomotopyEquiv)).eulerChar_eq
  rwa [TauCeti.eulerChar_cwComplex, TauCeti.eulerChar_cwComplex] at h
```

Both elaborate with no output at `358314d4` (the definition copied verbatim; `TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType` built first with `lake build`). `Suggested.lean`'s version lets X and Y live in different universes, a `ULift` away. `FiniteCWTypeModel` is used only under `Nonempty` (`:267`, `:276`), where it is the native class `TauCeti.FiniteCWType` (`Topology/CWComplex/Classical/FiniteCWType.lean:73`: a homotopy equivalence to a finite CW complex in a Hausdorff space of the same universe).

**Repair.**
1. Delete `finiteCWEulerCharacteristic` and `finiteCWEulerCharacteristic_eq_of_homotopyEquiv` from `Suggested.lean`.
2. Before R01's merge, state `_product` and `_cover` on `TauCeti.cwEulerChar (Set.univ : Set _)`. After it, delete them too, since `cwEulerChar_prod` and `cwEulerChar_preimage_of_card_fiber` are native.
3. Restate `compactManifoldFiniteCWType` and `compactManifoldWithBoundaryFiniteCWType` with conclusion `TauCeti.FiniteCWType M`, and delete `FiniteCWTypeModel`.
4. In §7.1, consume `TauCeti.cwEulerChar`, `TauCeti.eulerChar`, `TauCeti.eulerChar_eq_cwEulerChar` and `ContinuousMap.HomotopyEquiv.eulerChar_eq` by name.
5. In the Downstream-consumers bullet at `:3375`–`:3377`, give the replacement names, because FuchsianOrbifolds on main (`TauCetiRoadmap/FuchsianOrbifolds/README.md:81`–`:82`) cites `finiteCWEulerCharacteristic`.

## R03 (P2) — Poincaré duality is stated only for rings with 2 = 0, although the fundamental-class form is statable at the pin

**Location.** `Suggested.lean:20`–`:24` ("The twisted, boundary and oriented-integral forms cannot yet be stated on their intended objects"), `:145`–`:155`; `README.md:2300`–`:2306`.

**Claim.** Of closed-manifold duality, only the 2 = 0 existential form is statable at the pins.

**Witness.** Hatcher Theorem 3.30 (hatcher line 10453, p.241) covers every commutative R and every fundamental class. Hatcher p.236 (hatcher line 10245) defines one by local images generating `H_n(M|x;R)`. `TopPair.ofSubset`, `TopPair.ofSubsetMap`, `TopPair.singularHomologyMap` and `TopCat.singularCap` exist at `358314d4`.

**Repair.**
1. Add the predicate `IsFundamentalClass μ`: for every x, the image of μ under the map induced by `TopPair.ofSubsetMap (𝟙 _)` from `(M, ∅)` to `TopPair.ofSubset {x}ᶜ` spans `TopPair.singularHomology` of that pair as an R-module.
2. State `poincareDuality_of_isFundamentalClass` for every commutative R: cap with μ is bijective `H^p(M;R) → H_q(M;R)` for `p + q = n`. Keep the 2 = 0 form, either beside it or as the README corollary at `:2354`.
3. Correct the docstring: only the twisted and boundary forms lack carriers.

Tested on two instances. RP² with R = ℤ/4: `H₂(RP²;ℤ/4) = ker(2) = {0,2}` maps to `2 ∈ ℤ/4 = H₂(RP²|x;ℤ/4)`, which is not a generator, so the hypothesis excludes the failing case H⁰ = ℤ/4 versus H₂ = ℤ/2. S¹ with R = ℤ: the circle class satisfies it, and both caps are ℤ → ℤ isomorphisms.

## R04 (P3) — Seven sampled targets carry no locator for their own statement

**Location.** §3.3 `:807`–`:813`, §3.4 `:814`–`:819`, §4.3 `:869`–`:892`, §5.2 `:1400`–`:1405`, §5.5 `:1476`–`:1501`, §6.2 `:1783`–`:1937`, §8.10 `:3057`–`:3096`.

**Claim.** Implicitly, the layer paragraphs locate these statements.

**Witness.** None of these paragraphs gives a theorem and page. The layer paragraphs at `:829`–`:831` and `:1293`–`:1296` cite constant-coefficient results only, and `:3335` cites "Hatcher Section 4.3" as a whole.

**Repair** (each locator checked in the text):
- §3.3: "(Hatcher, Theorem 2.20, p.119; §3.H, p.333, for local coefficients)" (hatcher lines 5200, 14569).
- §3.4: "(Hatcher, §2.2, p.149; §3.H, p.333)" (hatcher lines 6503, 14569).
- §4.3: "(Hatcher, Theorem 2.35, p.139; §3.H, p.333, cellular homology with local coefficients)" (hatcher lines 6051, 14572).
- §5.2: "(Hatcher, Example 2.48, p.151, with f the identity)" (hatcher line 6597; the sequence uses `f_* − g_*`, giving `id − g_*`).
- §5.5: cite by theorem and page the Serre spectral sequence with local coefficients and its convergence, in Serre 1951 or McCleary, both already in References.
- §6.2: "(Hatcher, §3.2, Lemma 3.6, p.206, and Theorem 3.11, p.210; cap product pp.239–240 with its boundary formula on p.240; the cup-length bound generalizes §3.2, Exercise 2, p.229, from contractible opens to opens nullhomotopic in X)" (hatcher lines 8935, 9099, 10393, 10400, 9937).
- §8.10: "(Hatcher, Theorem 4.57, p.393)" (hatcher line 17069).

## R05 (P3) — Two locators point at the wrong statement

**Location.** `README.md:526` ("(Hatcher, Section 3.C, p.281, for H-spaces)"); `:543`–`:544` ("The proof spine is Brown, *Topology and Groupoids*, Theorem 6.7.2 (p.240)").

**Claim.** These pages state the cited facts.

**Witness.** Page 281 (hatcher line 12154) opens §3.C with the definition of an H-space. "π₁ of an H-space is abelian, comparing µ(f,g) with composition" is §3.C Exercise 5 (hatcher line 12736, p.291). Brown 6.7.2 (brown line 9424, p.240) is the two-set theorem.

**Repair.** At `:526`, cite "(Hatcher, §3.C, Exercise 5, p.291)". At `:543`, add "(Brown, §6.7, Exercise 6, p.250, for covers made of pairwise intersections of a subcover; Theorem 6.7.2, p.240, is the two-set case used in §1.4)" (brown line 9768). The §1.1 cover-diagram colimit is that exercise, not 6.7.2.

## R06 (P3) — Unlocated and unlisted sources

**Location.** §4.5 `:1072` ("(Milnor Lemmas 3.6–3.7)") and `:1076` ("(Strøm's product theorem)"); §8.11a `:3148`–`:3153` (Arens–Eells/Wojdysławski embedding, Dugundji extension); `## References` at `:3484`–`:3508`.

**Claim.** These citations resolve against the References.

**Witness.** The only Milnor work in References (1959) has Lemmas 1–4 (milnor1959 lines 246–247, 299). Strøm's theorem is *Note on cofibrations II*, Math. Scand. 22 (1968), Theorem 6, p.135 (strom1972 line 181). FTW, Hatcher's *Vector Bundles and K-Theory* and Freedman–Quinn are cited in the text but absent from References.

**Repair.**
- Cite "(Milnor, *Morse Theory*, 1963, Lemmas 3.6–3.7)".
- Cite "(Strøm, *Note on cofibrations II*, Math. Scand. 22 (1968), Theorem 6, p.135)". The manifest key `strom1972` records the year as 1972.
- Give theorem and page for the Arens–Eells/Wojdysławski embedding and for Dugundji's theorem. Milnor 1959 footnote 6 (milnor1959 line 225, p.276) points to Hanner and Dugundji [4, Theorem 7.5].
- Add FTW 1973, VBKT, Freedman–Quinn 1990, Milnor 1963 and Strøm 1968 to References.

## R07 (P3) — Four prose defects

**Location and repair.**
- §4.4 `:906`–`:907` ("Consume native finite-CW Euler--Poincare and finite-generation results; extend their coefficient hypotheses …") sits in the pointed-quotient item; §7.1 owns Euler–Poincaré. Delete the sentence.
- §1.3 "Based presentations" (`:487`–`:492`) states only the cocone's universal property and naturality. Add the based statement it is named for: for path-connected opens containing x₀ with path-connected pairwise intersections, the free product of the π₁(U_i,x₀) maps onto π₁(X,x₀), and with path-connected triple intersections the kernel is generated by the elements i_ij(ω)·i_ji(ω)⁻¹ (Hatcher, Theorem 1.20, p.43; hatcher line 1956).
- §8.11a `:3130`–`:3131` ("no input from 8.10, the EM loop comparison below, or the EM loop comparison") repeats an item. Write "no input from 8.10 or 8.11b".
- §8.11 `:3175`–`:3218`: three Checks blocks interrupt 8.11a, so the "it" in "Apply it to (I,{0,1})→(X,{x₀})" at `:3219` has no antecedent. Move `:3219`–`:3224` before `:3175`.

## R08 (P3) — The description is stale and states no merge order

**Location.** The pull-request title ("compact Cech pairs and relative cup modules") and description ("This amendment changes only README mathematics; existing Lean modules are unchanged").

**Claim.** The pull request adds compact Čech pairs and leaves the Lean files alone.

**Witness.** `git diff --stat origin/main...HEAD` deletes seven Lean files of the folder and changes `Suggested.lean` by 3021 lines. README `:145`–`:146` puts compact closed-pair Čech theory outside scope. Open conflicting pull requests: #1663, #1797, #1807, #1808, #1854, #1187; #1701 is pending.

**Repair.** Retitle the pull request and rewrite the description to say what the head does: the README rewritten in the standard shape, `Suggested.lean` reduced to its headlines, seven auxiliary Lean files deleted, compact Čech pairs out of scope. Also state:
- whether this pull request merges before #1701. Until #1701 lands, DerivedModuleAlgebra on main (`TauCetiRoadmap/DerivedModuleAlgebra/README.md:29`–`:30`) still exports the square-homotopy maps itself and takes "None" from AlgebraicTopology, against README `:137`–`:138` and `:3373`–`:3374`;
- which of #1652 and #1663 is rebased onto the other;
- that #1797, #1807, #1808, #1854 and #1187 are rebased onto whichever lands.

Carried from the previous review's R01 and R02; the description is unchanged.

## Previous findings

- R01 (DerivedModuleAlgebra consumer sentences hold only after #1701): **not repaired.** The description is byte-identical. DerivedModuleAlgebra on main `:29`–`:30` still owns "maps retaining specified square homotopies" and takes "None" from AlgebraicTopology, and #1701 is still open at `712f383`. It is now part of R08.
- R02 (no order among conflicting pull requests): **not repaired.** #1663 (now `9c71949`), #1797 (`a285fd7`), #1807 (`ac36c47`), #1808 (`6931121`), #1854 (`c07dda7`) and #1187 (`66ed0d4`) still conflict per the worker's overlaps report. It is now part of R08.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate at 4e825d6 prints every counter zero (`… sorry-data=0 … imports=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … outside-folder=0 … build=0 OK`). `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check re-run here prints `depcheck: 236 roadmaps, 2420 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier roadmap named (UniversalCovers in `Completed/`; GeometricTopology, DifferentialGeometry, DGFloer, ClassifyingSpaces, GeneralizedCohomology, TopologicalKTheory, CharacteristicClasses, ComplexKahlerGeometry) is on main.
- `lake env lean …/Suggested.lean` at `358314d4` takes 12.7 s and prints exactly 17 "declaration uses `sorry`" warnings and nothing else.

**Signatures and padding.**
- One scratch file with `#check @name` for all 30 declarations elaborates without error. The file has no section `variable`, so no binder can be lost. Each elaborated type matches its README statement: Brouwer `:681`–`:683`; transfer `:1408`–`:1410`; LS `:1813`–`:1821`; duality `:2300`–`:2305`; Euler `:2444`–`:2449`; Whitehead `:2723`–`:2725`; CW type `:2874`–`:2881`; K(G,1) `:2920`–`:2922`; mapping space `:3111`–`:3113`; proper SDR `:2704`–`:2708`.
- One-tactic probe: in a scratch copy, each of the 17 `sorry`s was replaced by `first | rfl | simp | infer_instance | decide | trivial | exact ⟨_, rfl⟩`, and all 17 fail. R01 and R02 are duplications by library content, not one-tactic padding.

**Headline theorems.** The README names these headlines: Brouwer, transfer, Wang, Künneth, Cartan–Leray, Serre, Poincaré–Lefschetz in twisted, boundary and oriented forms, Euler characteristic, Hurewicz absolute and relative, Whitehead ordinary, homological and proper, finite CW type with the homology-sphere corollary, K(G,1), mapping-space CW type, representability, obstruction theory, the restriction-tower comparison and the LS bound.

`Suggested.lean` states 17 of them. The docstring names Wang, Cartan–Leray, Serre, the twisted and boundary dualities, representability, obstruction theory, the tower adapter and proper Whitehead as lacking carriers at `358314d4`. I confirmed: no Serre-fibration, tower or supported-cohomology API exists at `358314d4`. The exceptions are R01 (Künneth and Hurewicz at `2fd255d9`) and R03 (oriented duality).

**Seeded sample** (Hatcher printed page = page marker − 9, checked against each running head; Brown and VBKT read from their running heads):

| Target | Locator, hypotheses, support | Result |
| --- | --- | --- |
| 1.1 Cover diagrams | Brown 6.7.2 at brown line 9424, p.240: two sets, A representative in X₀, X₁, X₂; the arbitrary cover is §6.7 Exercise 6, brown line 9768, p.250. Native `FundamentalGroupoid.cechDiagram`/`isColimitCechCocone` present at `358314d4` | Statement sound; locator R05 |
| 1.3 Based presentations | Hatcher Theorem 1.20 (hatcher line 1956, p.43): path-connected opens containing x₀, pairwise intersections path-connected; kernel when triples are path-connected | Locator right; body R07 |
| 2.4 Homology axioms | Thm 2.10 (line 4863, p.111); Cor 2.25 (line 5521, p.126); §2.3 axioms and the reduced/unreduced forms (lines 6977–7021, pp.160–161) | Correct |
| 2.5 Coordinate orientations | Prop 3B.1 (line 11612, p.269); relative product after Thm 3B.6 (line 11924, p.276); Lemma 3.27 (line 10255, p.236) | Correct |
| 3.3 Local excision | No locator; §3.H line 14569, p.333 states it | R04 |
| 3.4 Local Mayer–Vietoris | No locator; §2.2 line 6503, p.149, plus §3.H | R04 |
| 3.5 Sphere calculations | Example 2.46 (line 6570, p.150): Sⁿ by hemispheres | Correct |
| 4.3 Cellular comparison | No own locator; Thm 2.35 (line 6051, p.139) for constant coefficients; §3.H line 14572, p.333 for local coefficients | R04 |
| 5.2 Wang | No locator; Example 2.48 (line 6597, p.151) | R04 |
| 5.4 Torus homology | Thm 3B.6 (line 11898, p.275): CW complexes, PID coefficients; Example 3.16 (line 9388, p.216) is the cohomology exterior algebra, from which homology follows by UCT since `H_*(Tⁿ)` is free | Correct |
| 5.5 Serre applications | No locator | R04 |
| 6.2 Products and category | No locator; Lemma 3.6 p.206, Thm 3.11 p.210, cap pp.239–240, Exercise 2 p.229 | R04 |
| 8.9 Obstruction theory | VBKT §3.3: assumptions (1)–(3) at VBKT lines 3845–3854, p.99 (connected CW base, π₁F trivial on πₙF, trivial π₁X action); Lemma 3.18 line 3881, p.100; Prop 3.19 line 3908, p.101 (class zero iff the section on Xⁿ⁻¹∪A extends over Xⁿ⁺¹∪A); the README's account of the untwisted hypotheses at `:2994`–`:2998` is accurate | Correct |
| 8.10 Representability | Only "Section 4.3"; Theorem 4.57 (line 17069, p.393): natural bijection with Hⁿ(X;G) for CW X and n > 0 via f*α | R04 |
| 8.11 Mapping spaces | Milnor Thm 2 (milnor1959 line 103, p.273); proof (c)⇒(d) by partition of unity (lines 191–205, p.276); Thm 3 and Cor 3 (lines 209, 218, p.276); Hatcher Prop A.11 (line 22877, p.528), A.14 (line 23034, p.530), A.16 (line 23081, p.531) | Correct |

**Adversarial table.** The table covers the sampled targets, every headline of `Suggested.lean` and every target a finding touches. Values were computed here.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| 2.5 shuffle class, n = 2 (`:645`–`:648`) | T₁=[(0,0),(1,0),(1,1)], T₂=[(0,0),(0,1),(1,1)] | ∂(T₁−T₂)=right+bottom−top−left = ([1]−[0])×e₂ − e₁×([1]−[0]); swap gives T₂−T₁ (−1); unsigned sum leaves 2·diagonal | Holds |
| 2.5 S⁰ class | s₀=[q]−[−q] against [q]+[−q] | local images (+1,−1) for both at q, augmentation 0 vs 2 | Holds; excludes the wrong class |
| 2.5 sup-ball/disk maps | x=(1,1), y=(0,½) | ‖x‖∞/‖x‖₂·x has ‖·‖₂ = 1; the inverse y ↦ (‖y‖₂/‖y‖∞)y returns y; chart at e₀ has frame (e₁…eₙ), and (e₀,e₁…eₙ) has det +1 | Holds |
| 3.1 Sd, T on σ=[v₀,v₁] | Hatcher formulas | Sd σ=[b,v₁]−[b,v₀]; ∂Tσ+T∂σ = σ−[b,v₁]+[b,v₀] = σ−Sd σ; T[v]=[v,v], ∂=0 | Holds |
| 3.4/3.5 two-arc S¹ | H₀(U∩V)=ℤ² | (a,b) ↦ (a+b, −a−b), kernel ℤ(1,−1) = H₁(S¹) | Holds |
| 4.3 RP² cellular | d₁=0, d₂=2 | H₁=ℤ/2, H₂=0; a zero d₂ gives H₂=ℤ | Holds |
| 4.6/6.1 RP² sign system | d₁=±2, d₂=0; δ⁰=±2, δ¹=0 | H₀=ℤ/2, H₁=0, H₂=ℤ; H⁰=0, H¹=ℤ/2, H²=ℤ | Holds |
| 4.7 cell homeomorphism | n=1, z=±1; n=2, z=(1,0) | e₁, e₀; w=(−1,1,0), m=1, weights (0,⅔,⅓); weights ≥ (1−r)/(n+1) ≥ 0, summing to 1 | Holds |
| 5.2 Wang (Hatcher Ex. 2.48) | Klein bottle, monodromy reflection r of S¹ | H₁(S¹) → H₁(S¹) is 1−r_* = 2; H₀ map is 0; H₁(K)=ℤ/2⊕ℤ | Holds with id − f_* |
| 5.3 transfer (`finiteCoverTransfer_exists`) | d=0 (E=∅); two-sheet cover of a point over 𝔽₂ | t=0 = empty sum; t(1)=(1,1)≠0 while p_*t = 2 = 0 | Holds; the sum-of-lifts conjunct excludes t=0 |
| 5.5 Serre Checks | S¹×S²→S² vs Hopf | E² ℤ at (0,0),(0,1),(2,0),(2,1); product H₂=ℤ forces d²=0, S³ forces d² iso; ∅→B has no square to lift (D⁰ ≠ ∅); {1}→S¹ has no lift of the loop | Holds |
| 5.6 Čech differential | three opens, c ∈ C(U₀₁₂) | δc=(c,−c,c); the U₂-component of δδc is c−c=0, unsigned gives 2c; with D=δ+(−1)ᵖ∂, D²c = ∂δc−δ∂c = 0 | Holds (the Check's displayed −∂δc+δ∂c is also 0) |
| 5.7 point cover | 0→R→R²→R→0 | c ↦ (−c,c), (a,b) ↦ a+b, exact; H₀=R | Holds |
| 6.0 difference map and towers | (3,1,0,…); ×2 tower; ×3 tower | (2,1,0,…); 3x₀+1 ≡ 0 mod 4ᵏ for all k, impossible; Σ3ⁿ = −½ ∉ ℤ in ℤ₃/ℤ | Holds |
| 6.0 homotopy-square maps | fₙ=n·id on R→R | squares fail by id; (δ∏f − ∏fδ)ₙ = −xₙ₊₁; composite fails by 2n+1 = (n+1)+n | Holds |
| 6.1 transport Check | rank one, u=2 over ℤ/5 | u⁻¹−1 = 3−1 = 2 vs u−1 = 1 | Holds; discriminates |
| 6.2 LS bound (`lsCupLength_add_one_le_categoryCount`) | point; S¹; ∅; zero ring | 0+1 ≤ 1; 1+1 ≤ 2; ∅ has count 0 and 0+1 ≤ 0 fails, excluded by `[Nonempty X]`; zero ring gives 0+1 ≤ count | Holds; R01 for the carriers |
| 6.3 local generator | m=1,2; reflection | det(I+J) = 1+m > 0; reflection gives −1; ρₙ an (n+1)-cycle with sign (−1)ⁿ; at p=eₙ, (eₙ,e₀…eₙ₋₁) has sign (−1)ⁿ | Holds |
| 6.4 duality, 2 = 0 (`poincareDuality_twoTorsionCoefficients`) | S¹/𝔽₂; RP²/ℤ/4; n=0 | caps 𝔽₂→𝔽₂ bijective; H⁰=ℤ/4 vs H₂=ℤ/2 (excluded since 2≠0); point μ=1 | Holds; R03 |
| 6.4 Lefschetz D² | k=0,1,2 | H⁰=R↔H₂(D²,S¹)=R, H¹=0=H₁(D²,S¹), H²(D²,S¹)=R↔H₀=R; the absolute version fails at k=0 (H₂(D²)=0) | Holds |
| 6.5 linking | RP³; L(5,1), L(5,2); (n,i)=(5,2) | ½; values {1/5,4/5} vs {2/5,3/5}, closed under negation since −1 ≡ 4 is a square mod 5; exponent 9 (skew) | Holds |
| 7.1 Euler (`finiteCWEulerCharacteristic`) | point; one-vertex circle; S² | 1; 0; 2; equal to `TauCeti.cwEulerChar univ` by `rfl` | True; R02 |
| 7.2 invariance and product | I vs point; S²×S² | 2−1=1=1; 1+2+1=4=2·2; two-line proof from the pin | True; R02 |
| 7.2 bundles | S³→S²; Klein bottle | 0=2·0; 1−2+1=0=0·0 | Holds |
| 7.3 cover (`_cover`) | S¹ ⟶ S¹ of degree 2; S²→RP² | 0=2·0; 2=2·1 | True; R01/R02 |
| 8.1 relative groups | (D²,S¹); RP² rel RP¹ (λ=2) | π₂ ≅ π₁(S¹)=ℤ; π₁(RP²,RP¹)=0, ℤ→ℤ/2 onto, not injective | Holds; carrier native at `2fd255d9` |
| 8.2 nerve of S₃ | g=(12), h=(23) | d₁=hg=(132) sends 1 ↦ 3; gh=(123) sends 1 ↦ 2; `SingleObj.comp_as_mul` gives f≫g = g*f | Holds |
| 8.2 Moore complex of Δ¹/∂Δ¹ | N₁=ℤ(e−s₀v) | d₁ e = d₁ s₀v = v; d₀(e−s₀v)=0; unnormalized ranks 1,2,3 | Holds |
| 8.4 relative Hurewicz | (D²,S¹∨S¹) | π₂=F₂ (nonabelian), H₂=ℤ²; the map is abelianization; π₁(A)≠0 is the only failed hypothesis | Holds; hypothesis needed |
| 8.5 Whitehead (`ordinaryWhitehead`, `_cwType`) | ∅→pt; degree 2 on S¹ | π₀ map not onto; π₁ image 2ℤ; both hypotheses fail | True; R01 |
| 8.5 homological Whitehead | Poincaré sphere → S³ | homology isomorphism, π₁ order 120; excluded by `SimplyConnectedSpace` | Holds |
| 8.5 ends | ℝ, ℝ², ℝ³ | ends 2, 1, 1; SC at infinity true, false, true; stable π₁ 0, ℤ, 0 | Holds |
| 8.5 proper SDR (`properStrongDeformationRetract_of_inverse`) | A=X; I with A={0}; ℝ with A={0} | id; H(t,x)=(1−t)x proper (I compact); the constant inverse has preimage ℝ, so `hInverse` fails | Holds |
| 8.7 CW type and recognition | n=0; [0,1]; n=1 | finite discrete; 2+1 cells; simple connectivity forces H₁=0≠ℤ, excluded by 2 ≤ n | Holds; carrier R02 |
| 8.8 K(G,1) (`groupClassifyingSpace_isEMOne`) | trivial group; S₃ | point with π₁=1; π₁ of order 6, nonabelian | Holds |
| 8.9 obstruction signs | D², f₁ of degree k, attaching degree m | c(f₀)=m, c(f₁)=km, δd = m(k−1) = c(f₁)−c(f₀) | Holds |
| 8.10 representability | X=∅; S¹⊔S¹, A=ℤ, n=1 | one element vs 0; ℤ×ℤ = ℤ×ℤ | Holds |
| 8.11 metric realization | Δ¹; wedge points x_j | d=2\|t−s\|; d(x_j,v₀)=2/j → 0 in K_m but not in K_w | Holds |
| 8.11 (`finiteSourceMappingCWType`) | X=∅; Y Sierpiński | C(∅,Y)=pt; Y contractible via H(x,t)=1 for t>0 (preimage of {1} = {1}×I ∪ S×(0,1] is open) | Holds |
| 8.12 EM comparisons | RP¹, CP¹ | π₁(RP¹)=ℤ≠ℤ/2; π₃(CP¹)=ℤ≠0 | Holds |

**Library declarations opened.**
- At `358314d4`: `TauCeti.cwEulerChar`/`cwEulerChar_def` (`AlgebraicTopology/Cellular/EulerCharacteristic/Basic.lean:64`, `:67`); `TauCeti.eulerChar`, `eulerChar_eq_cwEulerChar`, `eulerChar_cwComplex`, `ContinuousMap.HomotopyEquiv.eulerChar_eq` (`FiniteCWType.lean:92`, `:112`, `:120`, `:126`); `TauCeti.FiniteCWType` (`Topology/CWComplex/Classical/FiniteCWType.lean:73`); `TopCat.singularHomologyCross` (`AlgebraicTopology/Singular/CrossProduct.lean:73`).
- Also at `358314d4`: `TopPair.ofSubset` (Mathlib `Topology/Category/TopPair.lean:54`), `TopPair.ofSubsetMap` (Tau Ceti `Topology/Category/TopPair.lean:54`), `TopPair.singularHomology` (`AlgebraicTopology/Singular/Relative.lean:223`).
- At `2fd255d9`: the R01 table.
- The four imports of `Suggested.lean` exist at both revisions.

**Cross-roadmap citations resolved** (on main):
- DGFloer Layer 1 items 1–4 (`TauCetiRoadmap/DGFloer/README.md:462`, `:470`, `:621`, `:659`; the K(A,n) family is inside item 4 at `:679`–`:739`).
- ClassifyingSpaces Stage 3 items 11–15 and Stage 4 items 16–18 (`:179`–`:243`).
- DifferentialGeometry 2.2, 5.1, 9.3 and 10.5 (`:352`, `:507`, `:872`, `:890`).
- GeneralizedCohomology's `realizationProductKelleyComparison` (`:234`).
- TopologicalKTheory T1.6 (`:26`, `:66`).
- DerivedModuleAlgebra `:29`–`:30`.
- The worker's citation check lists no unresolved citation. The ProbabilisticAndMetricNumberTheoryPartII head (#1838) cites "AlgebraicTopology Stage 2, item 7", which is §2.7 under the numbering map at `:452`–`:467`. The MorseTheory head (#1682) consumes `TauCeti.LSCategoricalCover` and `TauCeti.lsCategoryCount` from Tau Ceti, consistent with R01.

**Overlaps.**
- The DifferentialGeometry Layer 9/10 ids that #886 drops are a revision of a roadmap on main: cite main, not a finding.
- The four `#stage-k-…` anchors this pull request drops are covered by the numbering map at `:452`–`:467`.
- No other roadmap's Lean file imports the seven deleted modules. `grep -rn 'import TauCetiRoadmap.AlgebraicTopology'` outside the folder on main returns nothing.
- Ownership against the open pull requests checked by `roadmaps grep` for the roadmap's own objects (LS category, Brouwer, `CWTypeModel`, `finiteCWEulerCharacteristic`, `groupClassifyingSpace`, proper SDR). Outside the AlgebraicTopology revisions (#1663, #1797, #1807, #1808, #1854, #1187), only consumers mention them: MorseTheory #1682 consumes `TauCeti.LSCategoricalCover`/`TauCeti.lsCategoryCount`, StableHomotopyKTheory #1227 aliases §8.8's `groupClassifyingSpace_isEMOne` (its README lines 451, 465), and ProbabilisticAndMetricNumberTheoryPartII #1838 consumes §2.7. No second owner.

## Not verifiable

- Conway–Friedl–Herrmann (6.5): not in the manifest and not in the sample; not fetched.
- Eilenberg–Steenrod, G. W. Whitehead, Dold, May, Serre 1951, McCleary and K. Brown, *Cohomology of Groups*: no open copy recorded; none of their locators is in the sample.
- The manifest's uncertified Freedman–Quinn (8.5, §7.7), Milnor 1963 (4.5, Lemmas 3.6–3.7) and Weibel, cited by locator only.
- The manifest's uncertified thom1954, lee, tomdieck2008 and serre1953 are not cited in this README.

## Source issues

- **Misprint** in milnor1959 at the proof of Theorem 2 ((c)⇒(d)), p.276: the source says this completes the proof of Theorem 3; it should be Theorem 2, since Theorem 3 is stated only afterwards; affects nothing.
- **Misprint** in milnor1959 at the proof of Corollary 3, p.276: the source says Theorem 4 gives the triad its CW type; the paper has no Theorem 4, and it should be Theorem 3; affects nothing.
