# Review of Polylogarithms (pull request #1424 at fc00043)

**Verdict:** needs changes

## R01 (P2) — Retire the obsolete supplier-gap requests

**Location:** `packages/Polylogarithms/design/plan.json:3`; `TauCetiRoadmap/Polylogarithms/README.md:104`, `:106`, `:120`, `:167`. The README calls these “direct supplier contracts” and says §2.2 “owns the additional homological passage”.

**Claim:** The plan still requests `borel-period-contract`, `universal-deligne-contract` and `rational-hspace-unrestricted`. The first two request exports now supplied by their named owners; the third requests a broader H-space theorem than the local spectrum-based proof uses. None of the three slugs appears under Exact supplier contracts. These are obsolete requests, not outstanding implementation prerequisites.

**Witness:** BorelRegulators §§5.1, 5.3–5.4 supply periods, image and covolume. MotivicEtaleKTheory §§1–7 supply the requested models and regulator. Polylogarithms §2.2 owns its unrestricted zero-component homology adapter. Plan entries: 3; matching README slugs: 0.

The supplier passages are `TauCetiRoadmap/BorelRegulators/README.md:597`, `:640`, `:662` and `TauCetiRoadmap/MotivicEtaleKTheory/README.md:121`, `:151`, `:262`, `:497`, `:588`, `:608`, `:701`. StableHomotopyKTheory §3.37 still has a finite-type hypothesis; its §§6.1–6.2 and 7.19 supply the different route expressly used here.

**Exact repair:** Remove the two fulfilled requests and the unused unrestricted-H-space request from the permitted top-level `gaps` list. Keep the direct contracts and §2.2's local targets. If a residual input really is missing, specify its exact hypotheses and the same slug in both locations.

This repair preserves the refuting instances: π²=6ζ(2) for ℚ, the universal regulator of unit 2 is log 2, and the local construction retains the independent prime classes with ord_p(q)=δ_pq. It requires no supplier implementation or supplier edit. The settled disposition in `packages/Polylogarithms/reports/FIX-RT-Polylogarithms~1.md:165` concerns supplier exports and placement; this finding concerns locally editable metadata after those exports were specified. It does not reopen that implementation demand.

## R02 (P3) — Record the three additional cited sources

**Location:** `TauCetiRoadmap/Polylogarithms/README.md:1585`, `:1586`, `:1587`; `packages/Polylogarithms/sources.toml:311`.

**Claim:** BOL, BNM and RSR appear in the bibliography but have no source-manifest records. The required versioned provenance is still absent.

**Witness:** The bibliography has 22 works; the manifest has 19 records, ending with SCH. Its missing-key set is exactly {BOL, BNM, RSR}. The cited versions are 2108.11862v4, 2404.06271v2 and 1511.00520v3.

**Exact repair:** Add one source-service record under each existing key BOL, BNM and RSR, with those versions, locators and supported targets. All three were successfully fetched through the legal sources service in this review. The repaired count is 22 and the missing-key set is empty. Retain BNM's characteristic-zero hypotheses and RSR's perfectness hypothesis where used.

## Previous findings

The supplied change record reports no changes since the preceding review; both reviews read the same head. Each preceding finding was checked before the full audit:

- Previous R01, “The plan still has all three requests”: **not repaired**. The current plan has the same three entries. README line 104 says “direct supplier contracts”; line 106 expressly disclaims an unrestricted §3.37 input. This remains R01 above.
- Previous R02, “no BOL, BNM or RSR key”: **not repaired**. The same bibliography entries and missing manifest keys remain. This remains R02 above.

The older plus/Q locator repair remains effective: README lines 14, 106 and 128 identify GeneralAlgebraicKTheory §3.14, whose actual normalization preserves unit classes. The integral check at line 182 distinguishes 2 from its inverse 3 in 𝔽₅ before rationalization.

## Verified sound

This is a fresh full-folder review, not the preceding review's incremental audit. I read the README and Suggested.lean throughout, the standing repository writing/review rules, the previous findings and repair disposition, and the supplied gate, signature and change records. Main-branch AlgebraicCurves, GeometricCurrents and DifferentialGeometry supplied shape/ownership comparisons. No pull-request file was changed. The outside-folder diff is empty.

**Principles and shape.** The roadmap builds explicit regulators on the analytic and symbol suppliers, rather than replanning those suppliers. The weight-four theorem is a downstream Part II, not an input. Conjectural whole-complex transfer, higher reciprocity and elliptic special values are not unconditional instances. The characteristic-zero theorems do not silently replace the positive-characteristic targets. Definitions have prose APIs and discriminating Checks; the five layers retain Examples and Dependencies. No algorithm, sorry'd data, forbidden import, set_option, or copied source passage was found. The remaining administrative inconsistencies are R01–R02.

**Gate and elaboration.** The worker gate at this head passes every listed scanner, the outside-folder check and the targeted build. Independent direct elaboration of `TauCetiRoadmap/Polylogarithms/Suggested.lean` succeeded, with exactly nine warnings, all for `sorry`. The independent dependency check returned:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The dependency check was run with the supplied order, movable placement and main content. All `*Needs:*` passages were read, including the local proof obligations and the downstream exclusions.

**Acceptance signatures.** A scratch copy with `#check @name` for all **24 named declarations** elaborated. All 15 definitions have real bodies. All nine theorem signatures retain the assumptions their README statements need: nonreal ideal shapes, protected Kummer denominators, field/number-field instances, the equivalence enumerating every infinite place, the universal cycle predicate, and explicit discreteness/full-span assumptions for the lattice. No binder was lost and no signature change is required. The natural subtraction in normalizedPeriod is harmless at the theorem indices; the arbitrary-index definition is not asserted to give a special-value theorem.

The README's nine headlines statable at these pins are all present: Lobachevsky's formula; finite ideal-region volume; signed ideal-tetrahedron volume; Kummer reduction; the explicit trilogarithm relations; weight-three existence; weight-three every-family rationality; totally-real even-weight existence; and absolute summability of the full elliptic kernel. The module docstring separately identifies descent/Borel and configuration comparisons, explicit/universal current regulators, Green/Arakelov comparisons, curve reciprocity, next-to-Milnor comparisons and the elliptic regulator pairing, with their missing actual carriers. I found no omitted statable headline or free-predicate replacement for one. The universal test in IsCycle3 is an actual quotient-universal-property encoding, not an arbitrary Prop field.

Each of the nine sorried theorems was tested in a scratch copy with `simp`, `rfl` and `infer_instance`; none closed. The object searches below found no exact pinned library theorem that closes one by a single `exact`. The empty-determinant theorem still asserts the deep arithmetic rationality of ζ_F(n); it is not just the empty determinant identity. The proved valuation example tests the nontrivial rational unit carrier. No padding finding resulted.

**Pinned library audit.** The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These 16 declaration/object groups were opened at those pins (line numbers refer to the library repositories):

| Object | Pinned evidence | Consequence checked |
| --- | --- | --- |
| Bernoulli convention | `Mathlib/NumberTheory/Bernoulli.lean:194`, `:204`, `:207` | B₁=−1/2 and B₂=1/6 give coefficients 1,−1,1/3. |
| Complex logarithm differentiation | `Mathlib/Analysis/SpecialFunctions/Complex/LogDeriv.lean:37`, `:45` | Requires slitPlane; does not prove differentiation of a principal branch across its cut. |
| Full lattice | `Mathlib/Algebra/Module/ZLattice/Basic.lean:433` | Class takes DiscreteTopology as an argument and asserts full real span; both hypotheses occur explicitly here. |
| Covolume | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72`, `:91`, `:98` | Total definition alone does not promise positivity; full discrete-lattice/Haar hypotheses do. |
| Discriminant | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36`, `:41` | Number-field discriminant is nonzero, protecting √abs(discr). |
| Dedekind zeta | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49` | Actual ideal-count L-series, not a freely chosen zeta function. |
| Infinite places | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, `:105`, `:108` | Selected embedding represents the place; conjugation preserves the place. The explicit enumeration prevents missing rows. |
| Dirac/current derivative | `Mathlib/Analysis/Distribution/Distribution.lean:201`, `:212`, `:234` | Dirac is evaluation, zero outside its open domain; derivative is negative transpose. No generic manifold-current complex is supplied here. |
| Continuous logarithm predicate | `TauCeti/Analysis/Complex/ContinuousLog/Basic.lean:161`, `:172` | Existence of a continuous exponential lift, hence nonvanishing; no principal-branch or global simply-connectedness assertion is built into the predicate. |
| Function-field carrier | `TauCeti/FieldTheory/FunctionField/Basic.lean:49`, `:62` | Finite over k(x), not merely transcendence degree one. |
| Unit residues | `TauCeti/FieldTheory/FunctionField/Place/Residue.lean:185` | Multiplicativity requires both factors to have order zero; the unit-part adapter supplies that condition. |
| Finite residue support | `TauCeti/FieldTheory/FunctionField/Place/Zeros.lean:461` | Retains IsFunctionField. At x=0, the total order has empty support, not a principal divisor interpretation. |
| Local logarithm | `TauCeti/NumberTheory/LocalField/Logarithm.lean:256`, `:266`, `:285` | Isometry/injectivity uses e<(p−1)i, essential at p=2. |

| Algebraic cycles | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`, `:56`, `:69` | Native carrier is locally finitely supported coefficients; pushforward requires QuasiCompact and uses residue degree only when weights match. It is not itself a higher-Chow complex. |
| Riemannian measure | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` | Measure glued from the square-root Gram density; no special-function identity is built into volume. |
| Log-sine integral | `Mathlib/Analysis/SpecialFunctions/Integrals/Log.lean:46`, `:85` | Half/full-period logarithmic integrals already exist; they do not close the ideal-volume or angle-formula headlines. |

**Ownership and supplier audit.** Object searches used the roadmap service over main/open heads and the board package index, together with direct pinned-library searches. Search terms included polylogarithms, pre-Bloch/exterior boundaries, primitive Hurewicz/zero-component homology, configuration/Bigrassmannian complexes, Chow/Deligne regulators, current resolutions and completed-unit logarithms. No other readable Suggested.lean was found declaring these fully qualified `TauCetiRoadmap.Polylogarithms` names. The simple analytic definitions in Suggested.lean are expressly formula adapters to PolylogarithmFunctions; the roadmap's namespace distinguishes them. These **23 supplier groups** resolve as follows; cited paths are `TauCetiRoadmap/<name>/README.md`:

| Supplier | Sections and reopened locations | Ownership/generalities retained |
| --- | --- | --- |
| PolylogarithmFunctions | §§4.5,4.8,5.2,5.4,7.2; lines 606,658,719,751,1020 | All-weight real differential, endpoint behavior, D and Fourier bounds; cut differentiation is handled through coherent local branches. |
| K3BlochGroups | §§3.5,3.13–3.16,4.21; lines 707,952,1045,1701 | Pre-Bloch rather than Bloch-kernel target; explicit negation of its boundary; rational-curve rigidity does not imply arbitrary-curve rigidity. |
| K2SymbolsBrauer | §§5.4,7.2,8.2–8.3,9.5,9.11–9.16,10.5,10.9,10.12,10.24,10.29–10.30,11.3,11.5; lines 508,1221,1309,1489,1602,1819,1899,1950,2182,2319,2531,2576 | Parameter-last tame convention, all-characteristic DVRs, inseparable norms and residue-degree signs. |
| GeneralAlgebraicKTheory | §§3.12–3.14,5.11; lines 615,629,645,1117 | Normalized plus/Q is §3.14, including inverse transpose followed by inversion. |
| StableHomotopyKTheory | §§3.37,4.14,6.1–6.2,7.19; lines 1427,1647,2256,2290,2567 | Finite-type H-space theorem is not overused; arbitrary rational spectrum coefficients are supplied. |
| DGFloer | Layer 1 item 4, lines 650,664 | Functorial normalized Eilenberg–Mac Lane models. |
| AlgebraicTopology | Stages 1–5 and 8; Stage 8 line 1602 | Singular chains, Künneth and CW/homotopy comparison, not the local unrestricted K-homology adapter. |
| ArithmeticKTheory | §§3.3–3.4, lines 1138–1246 | Rational localization and Borel ranks. |
| BorelRegulators | §§2.3,3.4,5.1–5.4; lines 287,387,597,640,662 | All-embedding regulator, primitive periods and image/covolume; π powers are not absorbed into a rational scalar. |
| EndoscopicTransferAndUnitaryTraceComparison | §6.2, line 2097 | Tamagawa one for simply connected semisimple groups, not arbitrary tori. |
| SchemeKTheoryOperations | §§3.3,4.5,5.1–5.2, Layer 6; lines 900,1468,1786,1812,2050 | Localization, coniveau, regular homotopy invariance and Adams operations. |
| KTheoryFiniteLocalFields | §3.0a, line 512 | Shared BlochCycle/HigherChow, arbitrary fields, localization and face orientation. |
| MotivesAndAlgebraicCycles | §§4.8a,4.14; lines 711,815 | Relative multiplicities, admissible Cartier intersection and transfers; support alone is not a relative cycle. |
| MotivicEtaleKTheory | §§1.1–1.4,2.1–2.4,3.3–3.4,4.1–4.2,5.1–5.4,6.1–6.3,7.1–7.4 | Cubical/mixed models, rational Chern character, logarithmic/support diagrams and independently normalized universal regulator. |
| AlgebraicCurves | Layer 12B–12C; lines 1468,1534,1622 | Proper regular models and contravariant finite covers; smoothness in §4.7 uses characteristic zero. |
| DifferentialGeometry | Layers 0–2,5–6,8; lines 268,503,816 | Form calculus, integration/Stokes and de Rham comparison. |
| ComplexKahlerGeometry | K5a, lines 570,631–647 | Actual LF bundle-test topology and continuous dual, not compact-open tests. |
| GeometricCurrents | G1, lines 137–178 | Real dimension currents and boundary; Polylogarithms transports degree/sign conventions. |
| ComplexComparisonPartII | C−1.1 and C5.4; lines 723,3014,3190,3270 | Analytification retains nilpotents; complex current calculus, proper-support pushforward, analytic multiplicities and Poincaré–Lelong are imported. |
| AlgebraicModuliForArithmeticGeometry | §1.6 and Layer 9/§9.7; lines 874,10447 | Chow coefficient support and characteristic-zero resolution; admissible relative incidence multiplicities remain a separate target. |
| GeometricTopology | Layer 7, line 627 | Metric/volume input; ideal regions, cusp bounds and the coordinate integral are local additions. |
| SchemeAndStackFoundations; AlgebraicVectorBundles | Layer 5 line 6535; bundle operations at lines 69–92 | Chow/intersection and vector-bundle foundations remain supplied. |
| IntegralIwasawaTheory; ColemanIntegration | §§2.2,4.1–4.4 at lines 308,542–575; L0.F,L0.15–L0.18 at lines 127,454,502,525 | Completed units, full logarithm matrix, appropriate scalar-regulator range and finite-extension logarithms. |

The local zero-component homology, normalized-current/support transports, family-specific incidence, ideal-region geometry and lattice Fourier adapters have a stated difference from these suppliers. Hyperfunctions HF2.AnalyticPreparation.CurrentResolution was also inspected: it concerns compact currents dual to global smooth sections and their compact-support comparison; it is not an identical declaration of the ordinary degree-current sheaf complexes used here. The existing form/current constructors and local calculus remain suppliers. The weight-four downstream roadmap is not a supplier. No ownership conclusion is claimed against unavailable open-work files beyond the supplied/service-readable corpus.

**Seeded source verification.** All **15 requested sampled targets** were compared with the legal source text at the indicated locators. Source numbering below is the line numbering of the cached version, not a current webpage. The table separates source statements from additional targets that the roadmap must prove:

| Target | Source text opened and locator | Result |
| --- | --- | --- |
| 2.1 Descent and embedding regulators | Z07 line 837 through 862, §5 pp.17–20; G04 line 2146 through 2167, §5.5 | Descent and conjugate-row signs agree; the rational pre-Bloch map must be restricted to the kernel for K₃. |
| 3.2 Low-weight complexes and universal cycle predicates | G95 line 89 through 104, (0.1)–(0.3) p.199; G04 line 2271 through 2336, §6.1 pp.52–53; GR line 180 through 194, (5)–(6) pp.4–5 | Complexes and degrees agree. Universal predicates are the roadmap's quotient adapter; no numerical-period test is substituted. |
| 3.3 Exterior residues and signs | G04 line 667 through 690, §2 item 6 pp.17–18; line 2271 onward, §6.1 p.52 | Uniformizer-first exterior residue and shifted differential checked; the inverse tame convention is transported explicitly. |
| 3.4 Generic configurations and Bigrassmannian | G94 line 728 through 748 and 1194 through 1246, §§3.1–3.2,3.10 pp.15–16,24–27; GR line 2779 through 2904, (129)–(134) pp.61–63 | Generic tuples are vector configurations, not individually projectivized; truncation is a quotient; decorated flags supply the extra comparison construction. |
| 3.7 Primitive K-theory/regulator classes | G94 line 1322 through 1375 and 2266 through 2303, (23), Lemma 3.18, Conjecture 3.19 and Theorem 5.11; GR line 210 through 251 | Rank and Adams filtrations remain distinct. Nonzero proportionality requires the Chern/Borel computation, not one-dimensionality. |
| 3.8 Cycle lifting and exact proof boundary | G95 line 238 through 258, Theorem 1.1 p.203; line 3472 through 3504, §9.2 pp.310–311 | Existence is supported. The every-family route's complete higher-differential calculation is not supplied by the displayed source argument; it is explicitly owned as a target, not certified by this review. |
| 4.1 Rational-curve specialization | G95 line 749 through 812, §1.9 pp.220–222; GR line 141 through 194, §1.1 pp.4–5 | GR uses rational-curve relations; G95's broader curve presentation is not silently identified with it. Endpoint/pole specialization is projective. |
| 5.1 Test forms and currents | DEM line 498 through 620 and 649 through 709, I §2.A–C pp.13–18 | Complementary degree, LF topology, negative-transpose derivative and proper-on-support pushforward match. Arbitrary current products/pullbacks are excluded. |
| 5.4 Logarithmic r forms/residues | G04 line 520 through 605, (13)–(18), Theorem 2.4/Lemma 2.5 pp.14–16 | Alternation and singular integral scope match. The source's summation bound has the typo recorded below; the roadmap uses the finite valid range. Its normalized differential dictionary remains a separate target. |
| 5.9 Universal regulator comparison | BFT line 820 through 953, §6.2–6.3, Theorem 6.11 pp.15–19 | Support models, β, Green/Wang correction and compact smooth-projective scope agree. Universal construction is imported independently of the explicit map. |
| 5.10 Mixed cube–simplex forms | BFT line 954 through 1057, §6.4 (6.13)–(6.17), Theorem 6.18 pp.19–21 | Both indices occur in degree 2p−n−m. Axis restrictions and total differential signs match after J. |
| 5.13 Curve complexes/tame regulators | G04 line 2271 onward, (75) p.52 and line 2544 through 2553, (85) p.57; NEK line 840 through 870, (7.3.2),(7.4.1) pp.23–24; SCH line 980 through 1006, §4 p.28 | Unit logarithm/product and ch₂,₂=−c₂,₂ normalization retained. Kernel is not substituted for the homotopy fiber. |
| 5.14 Chow dilogarithm/triangles | G04 line 2537 through 2558, Lemma 6.9 p.57; BOL line 210 through 264, Definition 1.6, Theorem 1.8, Corollary 1.11 pp.5–6 | Real prefactor −1/(2π), two different residue triangles and functorial-system uniqueness agree after sign transport. BOL's characteristic-zero scope is retained. |
| 5.18 Elliptic Fourier pairing | D96 line 750 through 890, Theorems 3.3–3.4 pp.20–22 | Source gives the Fourier route and cycle-dependent mean cancellation. The roadmap's exact coefficient and common logarithmic regularization are explicit additional obligations; an unspecified constant does not verify them. |
| 6.1 Completed units and p-adic matrix | SHA line 870 through 952, §1.5 pp.31–32, especially Definitions 1.5.9–1.5.10/Remark 1.5.11; IntegralIwasawaTheory §4.1 | Completion defect and logarithmic rank agree. The all-embeddings rectangular matrix is a named supplier theorem; a single scalar determinant is used only in its totally real/CM range. |

The flagged trace calibration was reopened at G04 line 1934 through 1978; the six-point auxiliary-sign passage at G95 line 2836 through 2840; and the unused raw alternation formulas at GR line 2964 through 2987. The latter formulas do not certify the roadmap's geometric quotient map. The direct lower-square calculation below verifies its coefficient instead. BOL, BNM and RSR were fetched through the source service at their exact cited versions; BNM line 62 fixes characteristic zero, and BOL Remark 1.12 explicitly identifies the functoriality gap in RSR's analytic corollary. No inaccessible source request remains.

**Adversarial computations.** The following table covers the sampled targets, all nine Lean headlines, the remaining sections and both findings. Each row records actual algebraic values, a symbolic two-term calculation, or a numerical diagnostic. Finite examples do not prove the general targets. Here e_p=u(p), G=D(i)=0.915965594…, and Z=ζ(3)=1.202056903…. Exact prime-valuation exterior arithmetic was recomputed for the configuration maps. Numerical integrations are explicitly distinguished from identities; no numerical approximation is used as a proof.

There are **170 computed rows**.

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Principal polylog definition | n=2; z=0,1,−1 | Integral values 0, π²/6, −π²/12 agree with Li₂ | Pass; endpoint totalization harmless here |
| Bernoulli parity definition | n=2,3; z=1,−1 | L₂(1)=L₂(−1)=0; L₃(1)=Z; L₃(−1)=−3Z/4 | Pass; all-real projection would fail |
| Bloch–Wigner definition | z=i,−i,2 | D(i)=G, D(−i)=−G; Im Li₂(2)=−π log2 cancels arg(−1)log2 | Pass |
| Rational unit definition | 0,1,−1,2,3,5 | u(0)=u(1)=u(−1)=0; valuation matrix on 2,3,5 is I₃ | Pass; zero map excluded |
| Five-term predicate | x=2,y=3; b=D on real inputs | Arguments 2,3,3/2,3/4,1/2; all five D-values 0; endpoint b(1)=0 | Pass; x=y and zero denominators excluded |
| Cross-ratio convention | (∞,0,1,i), first two swapped | r=i and 1/i=−i; periods G and −G | Pass |
| Cube orientation change | q=0,1,2 | J=(1,−1,1); δJ₁=(−∂)(−1)=∂=J₀∂ | Pass |
| Selected rows/exponents | (r₁,r₂)=(1,0),(0,1),(1,1) | Odd n: exponents 0,n,n; even n: n,n,2n, from n(N−d) | Pass |
| §2.1 descent | [i] and its conjugate | δ[i]=(1−i)∧i=0 rationally; periods G and −G | Pass; nonzero functional |
| §2.1 real embedding rows | F=ℚ | Selected complex-row count 0; map lands in ℝ⁰ and is 0 | Pass |
| §2.1 integral boundary distinction | w primitive sixth root, 1−w=w⁻¹ | Exterior boundary 0; antisymmetric diagonal −w⊗w has order 2; twice it is 0 | Pass; rationalization kills this discrepancy |
| §2.2 projective cocycle | (∞,∞,0,1,i) | Deletion values G, G,0,0,0; signed total G−G=0 | Pass |
| §2.2 vector domain | zero vector followed by four generic vectors | Illicit zero extension gives deletion total G rather than 0 | Pass: zero vector is excluded |
| §2.2 all-ring Hurewicz | zero ring; ℚ in degree 1 | 0↔0; class 2 maps to e₂ and determinant returns e₂≠0 | Pass |
| §2.2 zero component | field K₀=ℤ | H₀ of zero component ℚ; all components would give ℚ[ℤ] | Pass |
| §2.2 graded homology | degree-one a,b; degree-two c | a²=b²=0; Δ̄(ab)=a⊗b−b⊗a; Δ̄(c²)=2c⊗c | Pass; neither ungraded symmetric nor all-exterior model works |
| §2.2 telescope/finite support | multiply by 2; prime-indexed degree-one space | a↦2a, ab↦4ab; any chain uses finitely many e_p; no finite rank bound on all e_p | Pass; finite-type-only supplier would not suffice |
| §2.2 primitive projection | primitive a, product ab, degree 0 | log-convolution projection gives a,0,0; reduced coproduct of ab remains nonzero before projection | Pass |
| §2.2 rank filtration/naturality | identity ring map and GL₁→GL₂ unit 2 | e₂↦e₂ in either route; rank-1 image contained in rank-2 image | Pass |
| §2.3 trace calibration | X=E₁₂,Y=E₂₁,Z=E₂₂; swap X,Y | AltTr=−3,+3; C₂=−3/2,+3/2; Φ₃=1/2,−1/2 | Pass; source value 1 fails |
| §2.3 Borel period conversion | F=ℚ,n=3 | Borel class ℚ×Z/π²; multiplying each row by λπ² gives ℚ×Z | Pass; rational scalar alone is insufficient |
| §2.4 metric/density | heights 1,2 and real dilation a=2 | vertical distance log2; coordinate dilation 4 has Jacobian 64 and density multiplier 1/64 | Pass |
| §2.4 inversion action | SL₂ matrix (0 −1;1 0), w=0,h=2 | J=4; image (0,1/2); denominator without h² would be 0 | Pass |
| §2.4 curvature/orientation | height 1; complex conjugation | sectional curvature −1; conjugation Jacobian −1 and signed volume reverses | Pass |
| §2.4 idealRegion definition | z=i and z=2 | c=(1+i)/2, R²=1/2; real shape is ∅ by definition | Pass; no division by Im z on real branch |
| §2.4 hemisphere condition | z=i, w=(1+i)/3 | squared minimum height 1/2−1/18=4/9; h≥2/3 | Pass |
| §2.4 truncation/exhaustion | point (w,h)=(0,2) | In K₂ and every K_n,n≥2; excluded from K₁; union contains it | Pass |
| §2.4 finite-volume headline | height integral h≥h₀>0; cusp r→0 | ∫h₀∞h⁻³dh=1/(2h₀²); h₀²≍r and planar area ≍r dr give O(ε) cusp tail | Pass; total H³ volume still infinite |
| §2.4 Lobachevsky normalization | θ=0,π/2,π/4 | Λ=0,0,G/2; ∫₀π log(2sin t)=πlog2−πlog2=0 | Pass |
| §2.4 duplication | θ=π/4 | Λ(π/2)=0; 2Λ(π/4)+2Λ(3π/4)=G−G=0 | Pass |
| Lobachevsky headline | z=i | Angles π/2,π/4,π/4; D(i)=G=0+G/2+G/2 | Pass |
| Ideal-volume headline | z=i,−i | Signed integrals G,−G agree with D; absolute volumes both G | Pass |
| Kummer headline | z=i | Three arguments −1,i,i; half-sum (0+G+G)/2=G | Pass |
| §2.5 Fourier tail | z=i,N=1 | Three-term approximation 1; error 1−G≈0.0840344≤3/2 | Pass; no divergent geometric tail bound |
| §3.1 22-term relation | a=b=c=1 | Raw sum 3[1]+4[−1]; period 3Z+4(−3Z/4)=0 | Pass; endpoint [1] retained |
| §3.1 nondegenerate 22-term | a=b=c=2 | Raw coefficients: 3 at 3,3/4,2,1/2,−2; −3 at 3/2,1/4,1; +1 at −8. L₃ sum ≈5.55·10⁻¹⁶ versus 0 | Numerical pass; floating-point/truncation diagnostic, not a proof |
| §3.1 denominator restrictions | a=0; a=b=c=2 | First excluded; second A=B=3 and abc=8, all nonzero | Pass |
| Trilog relation headline: inversion/three-term | x=2,1/2,1 | L₃(2)=L₃(1/2)=7Z/8; at x=2 sum 7Z/8−3Z/4+7Z/8=Z; x=1 sum Z+0+0=Z | Pass |
| §3.2 complex square zero | x=3 | δ²[3]=(−2)∧3∧3=e₂∧e₃∧e₃=0 | Pass |
| IsCycle3 universal predicate | [1]; [3] | [1] boundary 0; [3] tested with boundary functional and ord₃ gives 1 | Pass; arbitrary-symbol cycle predicate would fail |
| §3.2 weight-four universal predicate | [1]; [2] | First tensor 0; second detected by L₃⊗ord₂ as 7Z/8≠0 | Pass |
| §3.3 exterior residue | π∧2∧3; all-unit triple | e₂∧e₃; 0; swapping first two entries negates first answer | Pass |
| §3.3 unit-part map | π, π⁻¹, ππ⁻¹ | unit parts 1,1,1 and product 1; declaring all nonunits zero gives 0·0≠1 | Pass |
| §3.3 tame comparison | (π,2) | exterior residue u(2); tame=1/2, inverse tame=2 | Pass |
| §3.3 shifted residue | n=3, [a]₂⊗t | degree-two residue [a]; target differential −(1−a)∧a; degree-three residue of source differential has same value | Pass |
| §3.4 generic configuration | vectors (1,t,t²), t=1,2,3 | determinant 2≠0; repeating t=2 gives determinant 0 | Pass |
| §3.4 deletion/projection complex | two deleted indices i<j | coefficients (−1)^(i+j−1) and (−1)^(i+j) sum 0 | Pass |
| §3.5 triangle parameter | z=2; z=1 | determinants 2,−2,2,−1 give ratio 2; z=1 makes side points collinear but retains η | Pass |
| §3.5 endpoint comparison | η and triangle at z=2 | M₃η=[1] with period Z; triangle image [2] has period 7Z/8 | Pass; zero map excluded |
| §3.5 seven-term reduction sign | auxiliary point placed last versus first | Moving it across five entries gives (−1)⁵=−1; corrected deletion sum is −M(C), not +M(C) | Pass; source sign discrepancy identified |
| §3.5 r₄ normalization | rows (1,8,2),(7,3,11),(1,3,2),(9,4,3) | Rational prime-wedge calculation: r₄=18 e₅∧e₆₇∧e₁₉₇; f₀=e₅∧e₆₇∧e₁₉₇ | Pass; scalar is 18 |
| §3.5 lower deletion square | (1,t,t²), t=1,2,3,5,7 | δr₅=36 e₂∧e₃∧e₅; r₄ face values −36,0,0,−72,0, whose alternating sum is 36 | Pass |
| §3.5 lower projected squares | interchange common pivots | Summand unchanged, permutation sign −1; each paired contribution a−a=0 | Pass |
| §3.5 top scalar | triangle with period 7Z/8 | r₆=18M₃ has period 63Z/4; an uncalibrated M₃ would give 7Z/8 | Pass; raw Alt₆ shortcut not assumed |
| §3.6 Gale matrix | (I₂,B), B=((1,1),(2,3)) | (I₂,B)(−B;I₂)=0₂; applying kernel construction twice restores the rank-two row space | Pass |
| §3.6 geometric duality | class c and its dual | M₃(c*)=−M₃(c); sum 0; Alt₆M₃=720M₃ by 720 signed terms | Pass; invariance would have wrong sign |
| §3.6 top cohomology | (1−x)∧x∧y | Class is 0 in Milnor quotient and is the boundary of [x]₂⊗y | Pass in both image/quotient directions |
| §3.6 top norm | quadratic extension, nonzero base Milnor triple | N res gives 2 times triple; norming each wedge factor gives 8 times triple | Pass; use a rational-function field, not rational K₃ of a number field |
| §3.7 rank filtration | rank-two class; stabilized rank-three class | First image 0; second image unchanged at ranks 3 and 4 | Pass; no rank/Adams identification inferred |
| §3.7 period exponents | arbitrary signature | (−2r₁−5r₂)+2(r₁+r₂)=−3r₂ on both calibrated determinant expressions | Pass |
| Weight-three existence headline | ℚ,[1] and ℚ(i),[1] | Z₃=Z and π³Z/2=16ζ_ℚ(i)(3) respectively | Pass; both nonzero |
| Weight-three every-family headline | zero family; twice [1] over ℚ | Z₃=0=0·Z; 2Z=2·Z | Pass; nonzero scalar would be false for first |
| §3.8 primitive lift pairing | product ab added to primitive c | Projection(c+ab)=c; primitive Borel pairing gives same value on both | Pass; does not by itself prove cycle lifting |
| §4.1 relation specialization | α=[t]₂+[1−t]₂ | δα=(1−t)∧t+t∧(1−t)=0; endpoint difference 0 | Pass; unrestricted [f(1)]−[f(0)] is not allowed |
| §4.1 projective specialization | f=t,1/t,1+t at t=0 | symbols specialize to [0]=0,[∞]=0,[1]; odd endpoint need not vanish | Pass |
| §4.2 inversion complex | n=2,3; x and x⁻¹ | B₂ signs −; B₃ signs +; u(x⁻¹)=−u(x), so both boundary comparisons agree | Pass |
| §4.2 five-term/inductive comparison | specialized five-term R(tx,ty) at t=0 | arguments 0,0,y/x,y/x,1 give [1]; rational relation [1]=0 in weight two | Pass; supplier §4.21 covers this |
| §4.3 cycle constancy | normalized three-term weight 3; raw [t] | First period 0 at every specialization; raw [t] has values 0 and Z at 0 and 1 and has nonzero generic boundary | Pass |
| §4.3 endpoint continuity | pole specialization; constant [1] | Lₙ(∞)=0; L₃([1])=Z on both fibers | Pass |
| §4.4 periodMatrix/normalization | ℚ, one column 2[1]; duplicate columns | Matrix entry 2Z, normalized determinant 2Z; duplicate-column determinant 0 | Pass |
| §4.4 rational column change | A=diag(2,3); swap columns | det A=6; swapping gives factor −1; both match determinant multilinearity | Pass |
| §4.4 embedding representative | conjugate one row | Even weight multiplier −1; odd weight +1, from Lₙ(z̄)=(−1)^(n−1)Lₙ(z) | Pass |
| §4.4 general total definition | n=3, artificial 2-row index over ℚ | Natural exponent 3·(1−2)=0; intended theorem has 1 row and exponent 0; artificial index is outside its signature | Pass; no unintended general arithmetic claim |
| §4.5 explicit raw cycles | [1], [2], [x]+[x⁻¹] | Boundaries 0, nonzero detected as 7Z/8, and [x]₃⊗(u(x)−u(x))=0 | Pass |
| §4.5 forward presentation map | explicit boundary 0 | (p₃⊗id)(0)=0; period stays L₄ of same raw symbols | Pass; no converse claimed |
| §4.6 obstruction nonzero | C=D=E=ℚ,J=0,p=a=id,b=q=0,y=1 | T/H=ℚ; ω(1)=1; ker a={0}, so no cycle lift of 1 | Pass; surjectivity of p alone insufficient |
| §4.6 obstruction zero with changed lift | C=ℚ²,p(x,y)=x,a(x,y)=y,J=0 | a(ker p)=ℚ; obstruction quotient 0; (x,0) lifts every x as a cycle | Pass |
| §4.6 injective target | q=id and b(y)=0 | q(a(x))=0 forces a(x)=0; ω(y)=0 | Pass |
| §4.6 weight-three transport | inductive [1] | Explicit lift [1] has boundary 0 and period Z on both sides | Pass |
| Totally-real even headline | ℚ,n=2,4; ℚ(√2),n=2 | π²=6ζ(2); π⁴=90ζ(4); π⁴/√8=24ζ_ℚ(√2)(2) | Pass; cannot normalize empty columns to q=1 |
| §4.7 finite polynomial residues | t−a; t²+1 over ℚ | Residue fields ℚ and ℚ(i); constant complex residues 0; second field cannot be replaced by ℚ | Pass |
| §4.7 finite/projective distinction | t∧2∧3 | Residues at 0,∞ are e₂∧e₃ and −e₂∧e₃; finite-place target keeps only first | Pass |
| §4.7 Rudenko presentation | 𝔽₂,𝔽₃ | U=0 in both; extended B₂=0 rationally; admissible-pair P(𝔽₃)⊗ℚ=ℚ instead | Pass; small-field adapter essential |
| §4.7 canonical truncation | n=3, [3]⊗u(3), [3]⊗u(5) | First is killed by incoming relation; second differential evaluates as det I₃=1 | Pass; stupid truncation retains erroneous first vector |
| §4.7 next-to-Milnor exactness | zero residue target; nonzero [i] at t²+1 | Zero class lifts to 0 with all residues 0; D([i])=G≠0 detects a nonzero target | Zero/target test only; general surjectivity is the cited theorem, not demonstrated by these values |
| §4.7 next-to-Milnor norm | ℚ(i)⊂ℚ(i,√2) | N res[i]=2[i], periods 2G; identity gives [i], period G | Pass |
| §4.7 normalized homotopy signs | m=2,a=i; m=3,a=3,c=5 | Values −[i] and [3]⊗u(5); latter shifted differential −e₂∧e₃∧e₅ equals residue, valuation −1 | Pass |
| §4.7 degree law/towers | t=s²; degrees 2 then 3 | h of restricted class =2h; tower =6h in both routes; identity =h | Pass |
| §4.7 finite generation | union of successive square-root extensions | Finite stages degrees 2ᴺ; infinitely many t=0 branches all have v(t)=1 | Pass: excluded by IsFunctionField, despite transcendence degree 1 |
| §4.7 motivic degree | m=2,3,4 | K-index 2m−(m−1)=3,4,5; target cohomology degree 1,2,3 | Pass; retains Adams weight m |
| §4.7 conditional whole-complex transfer | identity and tower 2·3 | Required operators id and 6id; independent wedge norms give 8id at degree-three quadratic test | Pass as conditional specification; no unconditional use |
| §5.1 degree-current adapter | m=2,q=0,1,2,3,−1 | Test degrees 2,1,0; last two spaces 0, not test-degree-zero duals | Pass |
| §5.1 current differential | scalar f and test form φ | d[f](φ)=−∫f dφ=∫df∧φ; dδ₀(φ)=−φ′(0) | Pass |
| §5.1 LF topology | fixed bumps escaping compact sets | Every fixed-compact seminorm eventually 0; supports never lie in one compact, so no LF convergence | Pass; compact-open substitute fails |
| §5.1 arbitrary current product | mollified δ at scale ε in dimension m | ∫δ_ε²=C ε⁻ᵐ versus no finite canonical δ² | Pass: such product not supplied |
| §5.2 analytic multiplicities | point, double line, degree-two cover | Currents δ_x,2[L],2[Y]; birational resolution gives [Y] | Pass |
| §5.2 Poincaré–Lelong | f=z,z², nonzero constant | ddᶜlog norms give δ₀,2δ₀,0; −log gives negatives | Pass |
| §5.2 current resolutions | contractible chart | H⁰=constants (or holomorphic functions); positive local cohomology 0 | Pass; degree-zero kernel not discarded |
| §5.2 BFT dictionary | complex curve; q=1,2 | Point δ unchanged; ordinary one-form factor −(2πi)⁻¹, two-form +(2πi)⁻¹ | Pass |
| §5.2 top Deligne differential | p=1,g=−log|z| | d_D[g]_BFT=−δ₀; ordinary d[g]=[−Re(dz/z)] with no δ₀ | Pass |
| §5.2 support fiber | Z=∅ and Z=X | fib(id) has zero cohomology; fib(C→0)=C; raw boundary(log|t|) has coefficient −1 | Pass |
| §5.2 shifted comparison complex | arbitrary (a₁,a₂,a₃) | d²=(0,dg₁a₁−g₁da₁,−dρa₁+ρda₁)=(0,0,0) | Pass |
| §5.2 β/cycle inclusions | α and closed cycle Z | β(α)=(0,0,α); cycle=(0,cl Z,0); their differentials are β(dα),0 | Pass |
| §5.3 admissible locus | zero cycle; component contained in face | First has empty support and face 0; second has excess intersection dimension and is excluded | Pass |
| §5.3 Chow incidence | two points colliding | Generic degree 2; special cycle 2[x]; reduced support alone gives 1[x] | Pass; multiplicities owned here |
| §5.3 face/projection adapters | double transverse component; degree-d finite projection | Face multiplicity 2; pushforward multiplicity d; projection through its center excluded | Pass |
| §5.3 Green coefficient condition | α=(z₁+z̄₁)i dz₂∧dz̄₂ | ∂∂̄α=0 but ∂α=i dz₁∧dz₂∧dz̄₂≠0 and ∂̄α≠0 | Pass: separately closed condition retained |
| §5.3 logarithmic integrability | log r and r⁻² on a complex disc | ∫₀ε r|log r|dr finite; ∫₀ε r⁻¹dr infinite | Pass |
| §5.4 logarithmic r forms | one entry f; two entries f,g | r₀=log|f|; r₁=i(log|f|darg g−log|g|darg f) | Pass; real/Tate distinction retained |
| §5.4 r₂ alternation | transposition and repeated entries | Each swapped term changes sign; r₂(f,f,g)=0 | Pass |
| §5.4 residue factor | one simple zero | ∮darg z=2π; current derivative 2πδ₀; residue factor is not 1 | Pass |
| §5.5 raw complex | n=1 | Functions in degree 1; closed (1,1) currents degree 2; d log|z|=2πiδ₀ in raw convention | Pass |
| §5.5 simplex map degree | i=0 and i=1 | P at 0=(2πi)ⁿ[Y]; at 1 ordinary current degree 2n−2, cochain degree 2n−1 | Pass; no r₋₁ |
| §5.5 structural base change | Spec ℚ(i), Spec ℚ(√2) | Complex base has 2 points in each case; real base Spec ℂ versus two Spec ℝ | Pass; Weil restriction of Spec F would have 1 point |
| §5.7 Wang forms | m=0,1,2 | T₀=1,T₁=u,T₂=u(∂v−∂̄v)−v(∂u−∂̄u); exchange u,v gives −T₂ | Pass |
| §5.7 Wang/r dictionary | u_j=−log|f_j| | T₁=−r₀; T₂=r₁; general factor (−1)ᵐ | Pass |
| §5.7 boundary current | W₁=−log|z| | d_D[W₁]=−δ₀+δ∞ | Pass |
| §5.8 cubical map | zero cube and one cube | Degree 2p and 2p−1; degenerate logarithm 0 makes positive cube regulator 0 | Pass |
| §5.9 integration comparison | m=0, W₀=1 | φ(α)=[α]; cycle part maps to P_c(Z); β part maps to [α] | Pass |
| §5.9 Green/Wang identity | m=0 critical; r=1,2 subcritical | Critical d_D[g]=[ω]−δ_Z; subcritical face coefficients +1,−1 | Pass |
| §5.9 ψ sign | principal divisor, Green g=−log|f| | d_Dg=−δ_div; minus Green term cancels the cycle contribution | Pass |
| §5.10 mixed degree | (n,m)=(1,0),(0,1),(1,1) | Degrees 2p−1,2p−1,2p−2; printed 2p−m fails first axis | Pass with source correction |
| §5.10 mixed differential | n=0 versus n=1 | Simplex coefficients +1,−1; two routes around a square cancel +1−1=0 | Pass |
| §5.10 hyperplane change | z₀↦−z₀ | −log|−f|=−log|f|; derivatives equal; scale 2 would add −log2 | Pass |
| §5.11 Chow-form arity | (q,p)=(1,0),(2,1),(3,1) | r-indices 0,2,3; output ordinary degrees 0,0,1 | Pass |
| §5.11 period factor | q=2,p=1 | i⁻¹(2πi)⁻¹∫r₂=−∫r₂/(2π)=P₂ | Pass |
| §5.11 resolved family | double component; node with two branches | P(2Y)=2P(Y); node current is sum of two branch currents | Pass; support reduction would fail |
| §5.11 face coefficient | adjacent fiber dimensions p,p−1 | (2πi)⁻ᵖ·2πi=(2πi)⁻⁽ᵖ⁻¹⁾ | Pass |
| §5.12 Arakelov cone degree | cycle weight n,index i=0 | Cohomological degree 2n, not 0; n=1 gives degree 2 | Pass |
| §5.12 principal Green relation | div f with g=−log|f| | ddᶜg+[div f]=−[div f]+[div f]=0 | Pass |
| §5.13 tame reciprocity | f=t,g=t−a on ℙ¹ | Tame values at 0,a,∞: (−a)⁻¹,a,−1; product 1 | Pass; missing infinity gives −1 |
| §5.13 η residue | π=z, constant unit c | η(z,c)=−log|c|darg z; derivative −2πlog|c|δ₀=2πlog|c⁻¹|δ₀ | Pass |
| §5.13 unramified fiber | class with nonzero residue versus residue 0 | First cannot lift to fiber; second meets kernel condition; zero class maps 0→0 | Pass |
| §5.14 Chow Steinberg identity | f=t,g=t−i | Only nonzero D contribution is G at i; ∫r₂=−2πG, so P₂=G | Pass |
| §5.14 constant-factor integral | constant c and proper curve | Integrated P₂(c,f,g)=0; local r₂ need not be 0 | Pass; local constant erasure would be false |
| §5.14 first reciprocity triangle | t∧(t−1)∧(t−3) | Total residue 3∧(−2)=−e₂∧e₃≠0; δ(−[3]) gives same value | Pass; Bloch-kernel target and zero h fail |
| §5.14 second triangle | (1−t)∧t∧(t−a) | h gives [a]; symbol residue gives [a]; a=i has period G | Pass |
| §5.14 BOL sign transport | a=i | P_BOL=−G, transported P₂=G; h unchanged | Pass |
| §5.14 uniqueness/degree | t=s²; identity | h pullback values 2[i] and [i]; periods 2G,G | Pass; individual-triangle uniqueness not asserted |
| §5.15 rational cross-ratio formula | normalized four points ∞,0,1,i | Ratio i; symbol [i]; period G, with opposite ordering −G | Pass |
| §5.15 family/cover descent | constant parameter; degree-two cover | Family value constant D(a); pullback period 2D(a), rational division by 2 returns D(a) | Pass |
| §5.15 full regulator | pair of independent complex-place coordinates | Coordinate vectors (1,0),(0,1); first projection kills second, full pair does not | Pass; only full regulator injectivity is consumed |
| §5.16 line/chord presentation | concurrent line intersections; double intersection | Zero/endpoint cross-ratio contributes 0; a doubled intersection contributes twice its symbol | Pass; general five-term descent remains explicit work |
| §5.16 analytic normalization | normalized Steinberg line triple | h_E and P₂ both use negative integral normalization; reversing one gives −D(a) versus D(a) | Pass on the normalized case only |
| §5.17 diagonal identity | f=1/2,v=1 | −dL₃=−(4/3)log²2≈−0.640604019; ρ₂([f]⊗f) has exactly this value | Pass |
| §5.17 constant second argument | f=1/2,v=1,g=c>0 | α(1−f,f)=−4log2; ρ₂=(4/3)log2 log c, nonzero for c=2 | Pass; declaring it zero fails |
| §5.17 five-term descent | five-term boundary image | D-sum=0 and exterior boundary=0 give separately zero D and α contributions | Pass; one identity alone insufficient |
| §5.17 Adams comparison | m=3 | 2m−2=4, weight 3; no assertion that other K₄ weights map isomorphically | Pass |
| §5.18 character | square lattice, γ=1,i; quarter points | χ₁(i/4)=i; χᵢ(1/4)=−i; χ₀=1; all norms 1 | Pass |
| §5.18 Haar/derivative adapter | γ=1; z variable, area A | ∫₀¹e²πⁱʸdy=0; ∂χ₁=(π/A)χ₁dz; constant integral 1 | Pass |
| §5.18 summand definition | triad (1,i,−1−i), x=y=z=0 | Summand (−1+2i)/2; norm √5/2≈1.118033989; swapped last frequencies give its negative | Pass |
| Elliptic summability headline | largest dyadic scale 2ʲ | Shell bound C(j+1)2⁻ʲ; Σ(j+1)2⁻ʲ=4; zero frequencies excluded | Pass; no divisor hypothesis needed |
| §5.18 translation/antisymmetry | simultaneous translation; y=z | Multiplier χ_(γ₁+γ₂+γ₃)=χ₀=1; paired sum K(x,y,y)=0 | Pass |
| §5.18 scale | λ=2 | Numerator ×2, denominator ×64, coefficient ×1/32; area ×4 | Pass |
| §5.18 Fourier pairing constants | one nonzero triad | (−A/(2π))³·(π/A)·(−2iA)=iA³/(4π²); multiplying −4/3 gives −iA³/(3π²) | Pass before logarithmic limit |
| §5.18 mean terms | log|g| replaced by log|g|+c | Individual pairing gains c∫α∧ω; only full symbol-cycle cancellation makes summed gain 0 | Pass; divisor-only condition insufficient |
| §6.1 completed units | ℚ at p=2,3 | Rational unit rank 0; empty determinant 1; −1 survives completed 2-units but log is 0 | Pass |
| §6.1 logarithm depth | ℚ₂, u=−1 and 5 | log(−1)=0 at depth 1; injection requires i>1; v₂(log5)=v₂(5−1)=2 | Pass |
| §6.1 transposed matrix | non-CM cubic signature (1,1) | Supplier size 3×1; consumer transpose 1×3; full rank 1 equivalent, single chosen minor not prescribed | Pass |
| §6.1 split-prime check | ℚ(√2),p=7 | 10²≡2 mod49; ε≡11; ε⁶≡15 mod49, valuation of ε⁶−1 is 1 | Pass |
| §6.2 exact derivative | z=1/2,2,−1; v=1 | Values (4/3)log²2,−(1/3)log²2,0; numerically 0.640604019,−0.160151005,0 | Pass |
| §6.2 angular/radial derivative | z=i; v=i and v=−1 | Radial derivative 0; angular derivative −G | Pass; dropping the D-term fails |
| §2.2 normalized plus/Q | Units 1,2,3,4 in 𝔽₅ | Inverse transpose: (1,3,2,4); subsequent inversion: (1,2,3,4), equal to the input | Pass; inverse transpose alone fails at 2 |
| §2.2 integral versus rational check | Unit 2 in 𝔽₅ | 2²=4,2³=3,2⁴=1; integral classes 2≠3, but both rationalize to 0 | Pass; integral witness is necessary |
| §3.5 projected ratio | Moment parameters 1,2,3,5,7 | Minors 12,48,30,16 give 12·48/(30·16)=6/5; swapping the final two gives 5/6 | Pass; inverse convention detected |
| Ideal volume numerical diagnostic | z=i; 1400×1400 midpoint integration of height-integrated triangle | Numerical integral 0.915646543; exact target G=0.915965594, difference 0.000319051 | Consistent quadrature diagnostic only; endpoint singularities prevent treating this as an exact proof |
| G04 (13) index bound | m=1 | Valid j=0 gives r₀=log|f₁|; printed extra j=1 requires f₂,f₃ and (−2)! | Source typo; README uses 2j+1≤m |
| GR (142) lower-square coefficient | Moment parameters 1,2,3,5,7, unnormalized Alt | δr₅=36e₂∧e₃∧e₅; (2Alt₄)∂=−24e₂∧e₃∧e₅; (−3Alt₄)∂=36e₂∧e₃∧e₅ | Source coefficient fails; README already uses −3 |
| R01 gap minimality/agreement | Three plan entries; ℚ,n=2; unit 2; prime classes | Plan 3 versus README 0; π²/ζ(2)=6; r(2)=log2; valuation matrix I₃ | Remove obsolete requests; supplied/local mathematics remains |
| R02 source records | Bibliography versus manifest | 22 works versus 19 records; missing {BOL,BNM,RSR}; repair gives 22 and ∅ | Add exact-version provenance records |

## Not verifiable

- No required sampled source was inaccessible. The supplied legal cache was used, and BOL, BNM and RSR were independently retrieved through the source service at the cited versions. No manifest was edited and no missing-reference request remains. R02 concerns provenance records, not access.
- G95 §9.2, printed pp.310–311, does not display the complete all-configuration higher-differential calculation needed for the strongest every-family lifting route. The roadmap explicitly owns this calculation. Its general conclusion is not verified by the finite cycle tests above.
- The complete Borel scalar calibration, the raw triple-ratio quotient conversion, positive-characteristic elliptic five-term descent and the common logarithmic Fourier regularization are not proved by these checks. The README identifies the required local targets; it does not import these conclusions from an incompatible source convention. In particular no raw Alt₆ identity was certified.
- The whole-complex motivic/transfer and higher reciprocity statements explicitly marked conjectural remain conjectural. The characteristic-zero next-to-Milnor theorem and truncated homotopies do not establish them.
- Searches cover main, the supplied readable open heads and the service-readable ownership corpus; they are not a claim about unpublished or unavailable work. Numerical diagnostics check values, not the convergence or equality of arbitrary singular integrals.

## Source issues

These are source defects, not additional findings against formulas the README already corrects or explicitly leaves as proof obligations.

- **Error** in G04 at Theorem 5.7 proof, printed p.45 (G04 line 1948 and line 1976): the source says its half-alternating trace evaluates to one on the matrix-unit triple; it should be −3/2 with unnormalized alternation; affects the proof.
- **Misprint** in G95 at §3 relation R3, printed p.263 (G95 line 2164 through 2167): the source says the incidence relation has an extra endpoint term; it should match Definition 1.5 without that term; affects a stated result.
- **Misprint** in G95 at §5.2 case (e), printed p.287 (G95 line 2836 through 2840): the source says the last-position auxiliary-point reduction uses coefficients (−1)^i; it should use their negatives, or put the auxiliary point first; affects the proof.
- **Gap** in G95 at §9.2, printed pp.310–311 (G95 line 3472 through 3503): the source says the configuration spectral sequence supplies the required lift; it should justify higher differentials and degenerate-row contributions; affects the proof.
- **Error** in GR at Theorems 1.1–1.2, printed pp.3,5 (GR line 114 through 117 and line 196 through 200): the source says the determinant formula is an exact equality for every number field; it should permit a rational factor in rank zero, where ℚ needs 1/90; affects a stated result.
- **Misprint** in BFT at equation (6.15), printed p.20 (BFT line 1001): the source says the mixed regulator has degree 2p−m; it should have degree 2p−n−m; affects a stated result.
- **Error** in G04 at Lemma 6.9, printed p.57 (G04 line 2537 through 2553): the source says the scalar integral equals the residue sum without 2π; it should retain 2π consistently with its darg-current identity; affects a stated result.
- **Gap** in RSR at Corollary 1.5, printed pp.6–7 (RSR line 236 through 272): the source says its reciprocity construction gives the analytic volume comparison; it should prove the functorial compatibility identified in BOL Remark 1.12; affects the proof.
- **Error** in RSR at Corollary 1.5, printed pp.6–7 (RSR line 243 through 258): the source says real volume is 1/(2πi) times its real r₂ integral; it should use a compatible real prefactor or change the r₂ convention explicitly; affects a stated result.
- **Misprint** in G04 at equation (13), printed p.14 (G04 line 532 through 534): the source says the sum permits 2j+1≤2m+1; it should require 2j+1≤m to avoid nonexistent arguments and negative factorials; affects a stated result.
- **Error** in GR at equation (142), printed p.65 (GR line 2964 through 2972): the source says coefficient 2 in r₄ makes the displayed lower square commute; it should be −3 with the displayed cross-ratio, differential and unnormalized alternation; affects a stated result.
- **Misprint** in G94 at §3.1, manuscript p.16 (G94 line 732): the source says configurations of m vectors are n-tuples modulo GL(Vₙ); it should say m-tuples; affects nothing.
- **Misprint** in GR at equation (6), printed p.5 (GR line 187 through 188): the source says the differential retains exterior factors through x_k; it should retain the original factors through x_(n−k); affects a stated result.
