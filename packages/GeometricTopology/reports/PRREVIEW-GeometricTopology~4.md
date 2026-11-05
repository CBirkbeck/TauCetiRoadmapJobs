# Review of GeometricTopology (pull request #903 at 8f2bcb3)

**Verdict:** rejected

R01 requires a Part II under the ownership rule. Independent mathematical and supplier defects also prevent acceptance despite the passing gate.

## Disposition of the previous review

Locations are in `TauCetiRoadmap/GeometricTopology/README.md` unless specified.

| Previous finding | Current passage and disposition |
|---|---|
| R01, option overrides | **Repaired.** The two `set_option` lines are gone from `FiniteVolumeExtension.lean`; no such command remains in the 26 files. Its overlapping-instance warnings remain, discussed below. |
| R02, companion files | **Not repaired.** `LeeFrobenius.lean:12–15` still assigns the deformation to “GT6”; `SimplicialLinks.lean:88` still has `#print axioms LinkVertex`. The companion declarations still have no matching README specification. See R21–R22. |
| R03, genus | **Repaired.** Line 685 now gives “`g = (2 − χ − b)/2`”; lines 687–689 distinguish closed surfaces from surfaces with boundary. Sphere, torus, disc and punctured torus give 0, 1, 0, 1. |
| R04, topology on Diff | **Partly repaired.** Lines 872–874 now say “not a topological embedding”, and the oscillating-circle example correctly proves strictness there. The unrestricted assertion still fails for the section's own `S⁰` example: R15. The adjacent smooth-family homeomorphism also fails: R03. |
| R05, HOMFLY sign | **Repaired.** Line 1224 uses `t⁻¹ᐟ² − t¹ᐟ²`; lines 1246–1250 compute the positive Hopf link with the correct Alexander sign. |
| R06, two-strand numerator | **Repaired as a polynomial identity.** Line 1165 has `1 − (−t)^n`. Its value at `t = −1` must mean evaluation after polynomial division: the unsimplified quotient is `0/0`. The division-free sum in the companion gives the intended value `n`. |
| R07, signature determinant | **Repaired.** Lines 1728–1731 say “nonsingular” and explicitly give determinants 3 and −5, not unimodularity. |
| R08, Reeb leaves | **Repaired.** Lines 2318–2319 identify “a single leaf, the only compact leaf”. The new full pass finds a different foliation contradiction at 2343: R04. |
| R09, finite-volume ownership | **Partly repaired.** Lines 1906–1910 put the Mostow–Prasad proof in Part II; `FiniteVolumeExtension.lean:157` still admits that proof as a target in this folder. R21. |
| R10, build order | **Partly repaired.** Lines 386–402 distinguish target order from layer numbers and identify the early exterior/triangulation constructions. Several `Needs` lists still conflate prerequisites with later consequences; R24 gives the remaining concrete edges. The roadmap-level dependency check is clean. |
| R11, supplier names | **Partly repaired.** The two corrected names resolve. Seven alleged pinned declarations still do not: R02. The previous additional objection to `TauCeti.continuous_orthogonalToDiffSphere` was incorrect: it exists at `TauCeti/Geometry/Diffeomorphism/Sphere.lean:307`; the bundled camel-case map exists at line 317 too. |
| R12, locally flat composition | **Repaired.** Lines 741–752 give the product-chart construction and explicitly derive compatibility from arbitrary slice charts. The coordinate-axis and rotated-axis examples work. |
| R13, small slips | **Repaired.** Line 624 requires connectedness for the single extremal handles; lines 2074–2078 correctly explain why spheres satisfy the native incompressibility predicate; the Heegaard references now name §2.1, §3.2 and Theorem 3.4; Poincaré is attributed to Morgan–Tian Corollary 0.2(a). |

No “not actionable in this package” disposition was supplied or found in the previous-review material.

## R01 (P2) — Put the extension of the existing roadmap in Part II

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:35–38`: “Cerf's theorem … and Hatcher's proof of the Smale conjecture”; also lines 56–64 and `Suggested.lean:23–29`.

**Claim:** This rewrites the existing statement-building roadmap into a programme owning proofs of its end theorems, including Hatcher and Mostow, instead of building an extension on the existing roadmap.

**Witness:** On main, `TauCetiRoadmap/GeometricTopology/README.md:11–17` expressly limits the end targets to statements, not proofs; its Layer 3 already owns the Diff topology and reference inclusion. The existing roadmap also has a substantial progress log.

**Repair and retest:** Preserve the base roadmap as existing work. Put the additional proof programme in `GeometricTopologyPartII`, explicitly saying where the base stops and importing its layers. Recheck Hatcher's theorem: one base owner for the statement/carriers, one Part II owner for its proof. This is a scope repair, not a request to re-plan the base again.

## R02 (P1) — Seven consumed declarations do not exist at the pin

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:214`: “Every declaration below exists at the pinned Tau Ceti”; lines 237–239, 282, 300, 656, 675, 1259 and 1553.

**Claim:** The route treats missing prerequisites as already supplied. There is no declared supplier gap.

**Witness:** Whole-source searches at Tau Ceti `a91d3aaf` and pinned Mathlib find none of these seven names, including their short names.

The missing names are `TauCeti.exists_isOpenEmbedding_normalTubeOfRadius`, `TauCeti.normalFiberBundle`, `TauCeti.normalVectorBundle`, `TauCeti.normalContMDiffVectorBundle`, `TauCeti.knotExterior`, `TauCeti.KnotTheory.homflySpecialization`, and `TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact`.

**Repair and retest:** Replace each fictitious supplied fact by its actual pinned equivalent if one exists, otherwise give the necessary construction/theorem an explicit owner and target with hypotheses. For example, Layer 5.1 must construct its compact exterior from the tube and complement constructions instead of consuming `knotExterior`. Rerun the same seven-name lookup and check the resulting target graph; spelling a future declaration as a present supplier is insufficient.

## R03 (P1) — Compact parameters do not make smooth currying a homeomorphism

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:912–914`: “for compact `P` and `M` it is a homeomorphism onto the subspace”.

**Claim:** The compact-open topology on continuous maps into `Diff(M)` recovers the joint smooth topology on families.

**Witness:** On `P=M=S¹`, let `F_k(θ,z)=exp(i sin(kθ)/k)z`. The curried maps converge uniformly to the identity family in `Diff(S¹)`, but the parameter derivative at `θ=0` has norm 1, not 0.

**Repair and retest:** Keep the continuous forward map and the set-theoretic correspondence with smooth-adjoint families. Do not claim inverse continuity for the compact-open subspace topology; alternatively define the stronger joint smooth topology explicitly. The repaired statement allows convergence on the curried side while failing joint `C¹` convergence for this family.

## R04 (P1) — The taut-foliation corollary retains the sphere-bundle exception

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:2343–2344`: “with a taut foliation and infinite fundamental group is aspherical”.

**Claim:** Infinite fundamental group alone removes the exception already excluded in the preceding theorem.

**Witness:** The product foliation on `S²×S¹` is taut, as line 2315 says. Its fundamental group is `ℤ`, but its universal cover is `S²×ℝ`, with `π₂=ℤ`, rather than `ℝ³`.

**Repair and retest:** Carry the closed, connected, orientable, transversely oriented hypotheses and the exclusion of a finite `S²×S¹` cover into this corollary. Retain `S²×S¹` as a negative control: tautness and infinite `π₁` hold, while the added exclusion fails.

## R05 (P1) — A single suspension of the Poincaré sphere is not a manifold

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:2466–2469`: “The suspension … is a triangulated manifold”; also the example at 2532.

**Claim:** This example witnesses a triangulable manifold with no PL structure.

**Witness:** At a suspension vertex, a punctured conical neighbourhood has fundamental group the binary icosahedral group, of order 120. A punctured local `ℝ⁴` neighbourhood has trivial fundamental group. The double suspension is `S⁵`, which does admit PL structures.

**Repair and retest:** Use the double suspension only as a non-combinatorial triangulation of a topological manifold. Distinguish “this triangulation is not combinatorial” from “the manifold admits no PL structure”; provide a different, correctly sourced example for the latter implication. Neither single nor double suspension proves the present claim.

## R06 (P1) — The link of a face is only its transverse link

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:2389–2390`: “the realized link of a face is the boundary of a conical neighbourhood of its barycentre”.

**Claim:** The link itself describes the full local boundary for every face dimension.

**Witness:** Take a complex consisting of one closed edge and its vertices. The maximal edge has empty link. A neighbourhood of its midpoint is an interval and has boundary `S⁰`, with two points, not the empty set.

**Repair and retest:** State the local model using the join of the boundary of the face with its link, or restrict the assertion to vertices and state the transverse version separately. For the edge, `∂Δ¹ * ∅` gives `S⁰` under the augmented-link convention; its cone is an interval.

## R07 (P1) — The alternating Jones-span equality excludes split links

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1305–1306`: “`span V_L = c(L)` for alternating links”.

**Claim:** There is no split-component correction.

**Witness:** The two-component unlink is alternating and has crossing number 0. Its stated normalization gives `V=−t¹ᐟ²−t⁻¹ᐟ²`, whose span is 1. The three-component unlink similarly has span 2 and crossing number 0.

**Repair and retest:** State equality for non-split alternating links, and retain the general split-link formula: if there are `s` non-split summands, the span is `c(L)+s−1`. The two unlinks then give `1=0+2−1` and `2=0+3−1`.

## R08 (P2) — Distinguish raw and averaged signatures in the slice bound

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1723–1725`: “the slice-genus bound `|σ(K, ω)| ≤ 2 g_s(K)`”.

**Claim:** The raw signature notation introduced at 1713–1715 is used without the parameter restriction in the cited theorem, even after acknowledging failure of raw concordance invariance at roots.

**Witness:** `conway-signature` lines 282–284 restrict Theorem 2.12 to non-Knotennullstellen. `cha-livingston-signatures` lines 69–70 and 219–224 give slice knots with raw signature 2 at a prescribed Alexander root: `2≤2·0` fails.

**Repair and retest:** Give raw and averaged signatures distinct notation. State the all-parameter genus bound for the averaged signature, and state the raw bound on the source's admissible parameter set (also its off-root consequence). At `exp(iπ/3)`, the slice example has raw value 2, averaged value 0 and genus 0; the corrected all-parameter inequality is `0≤0`.

## R09 (P2) — Hatcher's essential-surface hypothesis is stronger than native incompressibility

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:2096–2097`: “an incompressible surface … is isotopic to a vertical or a horizontal surface”.

**Claim:** The native injectivity-on-`π₁` predicate suffices for Hatcher Proposition 1.11.

**Witness:** A small ball-boundary sphere in `T³=S¹×T²` is native-incompressible (`0→ℤ³` is injective). It is neither a union of circle fibres nor a horizontal cover of `T²`: its Euler characteristic is 2, not 0.

**Repair and retest:** State Hatcher's full connected, compact, irreducible ambient hypotheses and his essential, properly embedded surface condition, including its two-sided and boundary-incompressibility conventions. Cite `hatcher-3m` lines 374–402, 544–555 and 606–608. The sphere is excluded; a coordinate torus remains a valid vertical or horizontal example.

## R10 (P2) — Restore the third reducible Seifert-fibred exception

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:2098–2099`: “irreducible unless it is `S¹ × S²` or `S¹ ×̃ S²`”.

**Claim:** Infinite fundamental group eliminates all other exceptions.

**Witness:** `ℝP³#ℝP³` is Seifert fibred and reducible, with infinite group `C₂*C₂`. Hatcher Proposition 1.12 explicitly includes it: `hatcher-3m` lines 703–726, printed pages 18–19.

**Repair and retest:** Add connectedness and all three exceptions, or state the full source theorem without the unnecessary infinite-group restriction. The separating connected-sum sphere in `ℝP³#ℝP³` remains essential and the manifold now lies in the exception list.

## R11 (P2) — The stated Seifert invariants omit orientation data

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:2092–2094`: “determined … by … `(g; b; (α₁, β₁), …)`”.

**Claim:** This tuple classifies the unrestricted native Seifert-fibred spaces.

**Witness:** Circle bundles `T³→T²` and `(Klein bottle)×S¹→T²` both have genus 1 base, a section (`b=0`) and no exceptional fibres. Their total spaces have different orientability; their fibre orientation characters are trivial and nontrivial.

**Repair and retest:** Include the base orientability and fibre orientation character, with the Euler obstruction in the appropriate local coefficients, and state the equivalence relation on normalized exceptional data. Scott §3 supplies these data (`scott-geometries` lines 1520–1546, printed page 434). The two bundles then have different invariant tuples. Keep the simple displayed tuple as its explicitly oriented specialization, not the general classification.

## R12 (P2) — Finiteness needs nonparallel essential spheres and the source's surface convention

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:2031–2034`: “a bound on the number of disjoint essential spheres”.

**Claim:** A fixed compact manifold bounds the cardinality of such a sphere system without excluding parallel copies.

**Witness:** For every `N`, `S²×S¹` contains `N` distinct disjoint fibres `S²×{t_i}`. Each is essential. In the surface clause, native incompressibility also admits arbitrarily many disjoint ball-boundary spheres in irreducible `T³`.

**Repair and retest:** Require a pairwise nonparallel essential sphere system. For the separate surface finiteness theorem, use Hatcher's closed connected two-sided incompressible surfaces with no sphere components and the no-product-complement condition (`hatcher-3m` lines 432–435, printed page 11). All but one parallel fibre must be removed; ball-boundary spheres fail the surface hypotheses.

## R13 (P2) — Fox colouring over composite moduli is not vector-space nullity

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1268–1271`: “`p · p^r` … nontrivially `p`-colourable iff `p` divides the determinant”.

**Claim:** No prime or field hypothesis is attached to `p`.

**Witness:** The trefoil has 18 colourings modulo 6, including `(0,2,4)`, which satisfies all crossing equations. Its determinant is 3, and `6∤3`; 18 is not `6·6^r` for any natural `r`.

**Repair and retest:** Keep arbitrary modulus `n≥2`: with reduced Smith invariants `d_i`, the count is `n∏gcd(n,d_i)`, and nonconstant colourings exist exactly when `gcd(n,det K)>1`. State the nullity formula separately for prime `p`, and handle moduli 0 and 1 explicitly. Retests: trefoil modulo 3 gives 9, modulo 6 gives 18, modulo 1 gives only one colouring.

## R14 (P2) — Restore the missing surgery hypotheses

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1627–1632`: “two slopes … have distance one”; “on `T(r, s)` is a lens space iff …”.

**Claim:** The slopes need not be distinct, and the torus knot need not be nontrivial.

**Witness:** On the figure-eight exterior, two copies of the meridian both fill to `S³`, but have distance 0. For `T(1,2)`, 5-surgery is a lens space although `|5−1·1·2|=3`.

**Repair and retest:** State distance at most one generally and equality for distinct slopes. In the Moser iff, require coprime nontrivial torus-knot parameters `|r|,|s|>1`, treating the unknot separately and keeping primitive surgery slopes. Repeated meridians satisfy `0≤1`; the unknot case uses its unrestricted lens-space filling formula. The trefoil 5-, 7- and 6-surgeries retain their stated values.

## R15 (P2) — The forgetful topology assertion needs positive dimension

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:872–874`: “but not a topological embedding”.

**Claim:** Strictness holds for every compact manifold.

**Witness:** The section's own `S⁰` example has two diffeomorphisms and four continuous self-maps. Both spaces are discrete. The injective map from the two-point space to the four-point space is an embedding.

**Repair and retest:** State continuity and injectivity generally; state strictness for a nonempty positive-dimensional manifold, with the local oscillation argument. Record `S⁰` as the dimension-zero positive embedding case. The existing `S¹` sequence still proves non-embedding in positive dimension.

## R16 (P2) — Doubling does not create compactness

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:501–502`: “it is a closed manifold”.

**Claim:** The double is compact without assuming compactness of the input, despite “closed” being defined to include compactness.

**Witness:** Doubling `[0,∞)` along its boundary point gives `ℝ`, which is boundaryless and noncompact. Doubling the compact interval gives `S¹`, which is closed.

**Repair and retest:** Say the double is boundaryless, and closed when `M` is compact. Keep both examples: the half-line satisfies only the boundaryless conclusion, and the interval satisfies both.

## R17 (P2) — Connected sum needs dimension and Euler-characteristic qualifications

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:537–540`: “`M # N` is connected”; “for every `n`, `χ(M # N) = …`”.

**Claim:** These conclusions hold for all the connected, possibly noncompact manifolds allowed in the definition.

**Witness:** Removing an interval from each of two copies of `ℝ` and gluing the two pairs of endpoints gives two components, not one. An orientable surface with countably infinitely many handles has infinite-rank `H₁`, not a finite Euler characteristic.

**Repair and retest:** State `n≥1` for the construction, connectedness for `n≥2`, and the separate one-dimensional cases; retain the construction rather than silently excluding its other inputs. Give the Euler formula for compact manifolds, or an explicitly defined finite-type Euler characteristic. `ℝ#ℝ` then has two components; `S¹#S¹` has one; `T²#T²` still gives `−2=0+0−2`.

## R18 (P2) — Finite-volume cusps can have Klein-bottle cross-sections

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1903–1905`: “boundary components are tori … cusps `T² × [0, ∞)`”.

**Claim:** The native finite-volume predicate implies torus cusps without orientability.

**Witness:** The Gieseking manifold is complete, finite-volume and nonorientable with a Klein-bottle cusp; `gabai-meyerhoff-milley-mom` lines 944–946, Remark 10.9, printed page 21. Its cusp group is nonabelian, unlike `π₁(T²)=ℤ²`.

**Repair and retest:** Prove the general flat-cross-section statement, with torus or Klein-bottle cusps, and specialize to tori for orientable manifolds. The figure-eight complement retains one torus cusp; Gieseking gets one Klein-bottle cusp. Add nonemptiness to the separate positivity claim, since the empty manifold has volume 0.

## R19 (P2) — Genus-one lens spaces exclude the sphere

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:2246`: “`g(M) = 1` iff `M` is a lens space or `S¹ × S²`”.

**Claim:** All lens spaces have minimal Heegaard genus one.

**Witness:** The conventions include `L(1,q)≅S³`. Its Heegaard genus is 0, as the preceding iff and the section's first Check both say, although it has a stabilized genus-one splitting.

**Repair and retest:** Say nontrivial lens space (`p≥2` in the normalized convention), together with `S¹×S²`. Then `L(1,q)` satisfies only the genus-zero clause and `L(2,1)` has genus one.

## R20 (P2) — Consume proved pinned APIs instead of planning them again

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:866–868`: “prove that composition and inversion are continuous”; also 760–763 and 2090.

**Claim:** These are new targets beyond the pinned API.

**Witness:** `Diffeomorph.continuous_trans`, `continuousMul`, `continuous_symm`, and `isTopologicalGroup` are proved at the pin; `TauCeti.IsSeifertFibration.nonempty_homeomorph_circle` already proves the fibre assertion. Exact locations are listed below.

**Repair and retest:** Delete those duplicate targets and cite the declarations in the supplier contracts, retaining genuinely additional comparisons. Also consume the existing smooth-embedding local-flatness theorem rather than reasserting it in the “beyond the pinned API” list. The compact `S¹` group and the Hopf fibre still receive exactly the required properties from their native suppliers.

## R21 (P2) — Companion targets contradict the declared scope

**Location:** `TauCetiRoadmap/GeometricTopology/LeeFrobenius.lean:12–15`: “GT6 owns the deformation”; `FiniteVolumeExtension.lean:157–169` admits `finiteVolumeMostowPrasad`.

**Claim:** These files still assign this folder targets the README assigns to Part II. Several other companions assert algebra on free matrices, polynomials or words without a geometric comparison in this README.

**Witness:** `README.md:106–117` assigns Lee/Rasmussen and finite-volume Mostow–Prasad to Part II. `README.md:1906–1910` repeats the latter boundary; the companion's admitted theorem crosses it.

**Repair and retest:** Remove these out-of-scope targets from this folder. A separately scoped Part II may retain genuine headlines with actual prerequisite contracts. The revised base folder must have no Lee-deformation or finite-volume-rigidity proof target, and no algebraic stand-in offered as a missing geometric headline.

## R22 (P3) — The 25 companions are still API catalogues and calculation files

**Location:** `TauCetiRoadmap/GeometricTopology/SimplicialLinks.lean:88–94` (`#print axioms`); `LeeFrobenius.lean:1–4` (Mathlib subimports); `RealAlgebraicRealization.lean:12` (unrelated namespace); `TorusKnotTargets.lean:75–105` (coordinate identities).

**Claim:** The Lean-form rules apply to every listed file, not only `Suggested.lean`. The companions have unlisted declarations, forbidden imports/commands, missing declaration docstrings, calculation certificates and boundary/API statements instead of headline theorems. For example, `FiveTwoColoringTargets.lean:26–32` proves three small matrix calculations; `JonesMutantTableTargets.lean:36–51` admits table entries.

**Witness:** `TorusKnotTargets.lean:79` proves the rotation at time zero by simplification; the neighboring admitted endpoints do not become headlines by using `sorry`. `SimplicialLinks.lean:88` is the explicitly forbidden command itself.

**Repair and retest:** Delete the catalogue/calculation companions from the roadmap acceptance files; keep useful mathematics as sourced README targets or Checks. For padding: **delete it from `Suggested.lean`** and the companion files, never “prove it in place”. If any genuine headline is retained, give it the prescribed imports, namespace, docstring, matching README statement and real required definitions. Apply this to all 25 companions.

## R23 (P3) — Two convention Checks compute the wrong value

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:595–596`: “at `ε = 1` … fails to be injective”; lines 1143–1144: “[−1] or [1] according to the orientation of the core”.

**Claim:** These distinguish the intended open tube and Seifert-form conventions.

**Witness:** In the open radius-one normal tube of the unit circle, the inward vector reaching 0 has norm 1 and is excluded. Also bilinearity gives `θ(−x,−x)=θ(x,x)`, so reversing the core cannot change the one-by-one matrix.

**Repair and retest:** Use `ε>1` for failure of the open tube, or explicitly switch to the closed radius-one tube. Fix the Hopf-annulus sign under the stated convention and distinguish mirroring from basis reversal. Retests: the open radius-one image is `0<|z|<2`; replacing core `x` by `−x` leaves its matrix unchanged.

## R24 (P3) — Supply the missing locators and target-level dependency edges

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:450–465`, 911–918, 2386–2394; 2100–2101: “except for the listed exceptions”.

**Claim:** Every theorem has an exact source locator and its own route dependencies, but these blocks have no direct locator; the Seifert uniqueness statement neither lists its exceptions nor cites a result stating that conclusion.

**Witness:** Hatcher Proposition 1.13 concerns essential surfaces, and Lemma 1.14 concerns annuli, not the asserted uniqueness theorem (`hatcher-3m` lines 728–733, 761–764). Layer 4.9 uses the unknotting-one theorem of 5.4 while 5.4 lists all of 4.9 as needed.

**Repair and retest:** Add theorem/section and printed-page locators at the claims. State a precise Seifert uniqueness theorem, its full exception list and a source proving it; do not turn the boundary-restriction statement of Lemma 1.15 into uniqueness of the whole fibration. Split construction and consequence targets in the `Needs` lists: exterior construction before its irreducibility consequence (5.1/8.1), bridge-number definition before rational-knot classification (4.8/4.10), and prime decomposition before the unknotting-one consequence (4.9/5.4). These splits remove the reciprocal section edges.

## R25 (P2) — The concordance kernel includes smoothly slice classes

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1687`: “kernel is the smoothly non-slice topologically slice knots”.

**Claim:** This describes the whole kernel of the homomorphism from smooth to topological concordance.

**Witness:** The unknot represents zero in both groups, hence lies in the kernel. It is smoothly slice, so the stated description excludes the identity of the kernel.

**Repair and retest:** The kernel consists of all smooth concordance classes represented by topologically slice knots. Its nonzero classes are precisely those represented by smoothly non-slice, topologically slice knots. The unknot now gives the zero kernel class; a nonzero topologically slice class gives the intended contrasting example.

## Verified sound

Read: all 11 README layers, 26 Lean files, 13 previous findings, changes and writing rules. The requested `origin/main...HEAD` comparison has no outside-folder changes. The worktree is unchanged.

**Gate and elaboration.** The supplied gate at this exact head reports every check as zero and `OK`, including build, dependency, outside-folder and stray-file checks. Independently, `lake build TauCetiRoadmap.GeometricTopology.Suggested` succeeded (9153 jobs), and direct `lake env lean` on the acceptance file succeeded with precisely its 14 `sorry` warnings. After individual missing-import builds, all 25 companion copies elaborated. `FiniteVolumeExtension.lean` also reports overlapping-instance warnings for `PreconnectedSpace`/`ConnectedSpace`; the build succeeds. Copies with `#check @name` printed the 14 headline signatures and 262 companion declaration signatures. No silently dropped hypothesis was found in the 14 headlines; the companions' principal mismatch is their absent/out-of-scope README specification, not an inferred successful comparison against one.

The requested mechanical dependency check returned exactly:

```text
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

There was no `UPWARD`, `CYCLE` or `moved:` line. This check concerns roadmap supply; it does not resolve the target-level edges in R24.

**Pinned declarations opened.** Pins were checked against `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are library-relative file locators, not declarations inferred from a newer checkout.

| Object inspected | File and line at the pin; what the statement actually supplies |
|---|---|
| Weak Whitney topology and smooth families | `TauCeti/Geometry/Diffeomorphism/Topology.lean:85`, 95, 111, 125, 133: topology induced by `ContMDiffMap`, embedding into smooth maps, evaluation, continuous smooth-family map. No inverse smooth-family homeomorphism. |
| Composition and inversion | `TauCeti/Geometry/Diffeomorphism/Composition.lean:57`, 67; `Inversion.lean:215`, 241: compact manifold, locally compact model, Hausdorff target; `continuous_trans`, `continuousMul`, `continuous_symm`, `isTopologicalGroup`. Finite-dimensional real models satisfy the model condition. |
| Sphere inclusion | `TauCeti/Geometry/Diffeomorphism/Sphere.lean:307`, 317: both the continuity theorem and bundled continuous inclusion exist. |
| Smale and Watanabe | `TauCeti/Geometry/Diffeomorphism/Smale.lean:46`; `Disc.lean:58`, 77: the reference inclusion is the map of the homotopy equivalence; the relative disc group fixes the boundary pointwise and the proposition asks for an infinite-order element of `π₁`. |
| Annulus | `TauCeti/Geometry/Manifold/LocallyFlat/Annulus.lean:91`, 105: annulus boundary **ranges**, not an extension of arbitrary boundary parametrizations; nested locally flat spheres in the filled hull. |
| Smooth local flatness | `TauCeti/Geometry/Manifold/LocallyFlat/Smooth.lean:215`: `IsLocallyFlat.of_isSmoothEmbedding`, with boundaryless models and the immersion complement; a proved theorem. |
| Local flatness | `TauCeti/Geometry/Manifold/LocallyFlat/Basic.lean:690`: composition has a compatibility premise. The README's explicit product-chart argument supplies a genuine extension beyond that signature. |
| Sphere bounds ball | `TauCeti/Geometry/Manifold/Irreducible.lean:42`: every closed locally flat sphere map has a ball extension. |
| Simply connected | `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40`, 44, 70; `Mathlib/Topology/Connected/PathConnected.lean:577`: equivalence to the unit groupoid implies nonempty and path connected. Empty spaces cannot refute the Poincaré signature. |
| Knot group and isotopy | `TauCeti/KnotTheory/KnotGroup.lean:102`; `KnotTheory/SmoothLink/Isotopy.lean:39`: perfect commutator at every basepoint; parametrized ambient isotopy. Reversal of the unknot is absorbed by an ambient rotation. |
| Freedman | `TauCeti/KnotTheory/Slice/Freedman.lean:64`: perfect commutator implies topological sliceness, with native smooth-circle input. |
| Mostow | `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Mostow.lean:36`, 72: closed connected boundaryless manifold, dimension at least three. This is metric rigidity; the stronger homotopy-class theorem remains a separate prose target. |
| Virtual properties | `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/VirtualFibering.lean:62`; `VirtualHaken.lean:65`: closed connected hyperbolic three-manifolds and native finite-cover conclusions. |
| JSJ and geometry | `TauCeti/LowDimTopology/JSJDecomposition.lean:100`, 140, 194, 210, 248; `Geometrization.lean:144`: incompressible locally flat tori, inclusion-minimality, ambient-isotopy uniqueness and closed orientable irreducible hypotheses. |
| Seifert fibres | `TauCeti/LowDimTopology/SeifertFibration.lean:206`, 218: existence of a setoid fibration and the already proved circle-fibre homeomorphism. The definition itself supplies no global orientability. |
| Incompressibility | `TauCeti/AlgebraicTopology/FundamentalGroup/Incompressible.lean:42`: embedding plus fundamental-group injectivity; no sphere exclusion. |
| Realization | `TauCeti/AlgebraicTopology/SimplicialComplex/Realization.lean:432`, 457, 466, 471: subcomplex realization map, continuity, identity and composition. This does not alone supply general simplicial-map functoriality or a CW instance. |
| Triangulation | `TauCeti/Topology/TriangulationConjecture.lean:74`, 104: compact Hausdorff charted manifolds, no orientability clause; the zero-dimensional case is already proved. |

**Ownership and supplier resolution.** Roadmap-tool and board-package searches covered Diff topology, local flatness, connected sum, Mostow, Seifert fibrations, smooth triangulations and CW structures. Headline-name hits were this folder and its commented base sketches, with no conflicting live declaration in another readable roadmap. The base owns manifold/knot foundations; the resolved suppliers are:

| Consumed contract | Resolved passage |
|---|---|
| DifferentialGeometry boundary/corners, flows, Frobenius, integration, metrics | `TauCetiRoadmap/DifferentialGeometry/README.md:63` (boundary/corners); Layer 3, including time-dependent flows at 371–400; Layers 4, 5, 12, including metric existence at 915–926. Main was used for this existing roadmap. |
| HopfRinow connection, exponential, normal neighbourhoods, completeness | `TauCetiRoadmap/HopfRinow/README.md:244` (Layer 1 nondegenerate Levi-Civita and flow), 407 (normal neighbourhoods/Gauss lemma), 431 (Layer 3). Main was used. |
| SurfaceTopology classification and mapping classes | `TauCetiRoadmap/SurfaceTopology/README.md`, Layers 8 and 9: standard surfaces and Euler/genus formulas; PL/smooth/topological comparison maps and their bijectivity. The readable new-folder head was resolved with `roadmaps show`. |
| PlanarTopology low-dimensional topology | `TauCetiRoadmap/PlanarTopology/README.md`, Layers 5, 7, 8: Radó/Hauptvermutung, Schoenflies/tameness, PL/smooth uniqueness. The readable new-folder head was used. |
| Type-A Hecke trace | `TauCetiRoadmap/TypeAHeckeAlgebras/README.md:40` (H1), 143–160 (H2): arbitrary unit Hecke parameter, normalized trace, both stabilization constants and the one-way algebraic-braid-to-geometric comparison. Main was used. |

R02/R21 record failed contracts. Layout comparison used DifferentialGeometry, HopfRinow and TypeAHeckeAlgebras on main.

**Headline coverage.** All 14 headlines claimed statable in the introduction occur in `Suggested.lean`: annulus, Smale, Watanabe, Freedman, Mostow, virtual fibering, virtual Haken, Alexander's sphere theorem, cyclic knot-group recognition, Gordon–Luecke, JSJ, geometrization, Poincaré and Manolescu. The module docstring names Li, Weeks minimality, Property P/R, cyclic surgery, Kondo, Cerf, Kneser–Milnor and Novikov–Rosenberg as not statable and identifies their missing interfaces; it separately identifies Zeeman as open and does not assert it. Searches at the pin confirm that the surgery package has slopes rather than Dehn filling, and no Heegaard genus is available. The main file has no free `Prop` stand-in, sorry-defined data or option override. All 14 headlines resisted bare `simp`, `rfl`, `infer_instance`; the pinned search found no exact existing proof.

**Adversarial values (61 selected rows from 88 tests).** The table retains the 15 sampled targets, all 14 headlines and every mathematical finding; routine per-target controls are omitted. “Consistent” does not mean proved.

| Statement | Instance | Computed values / comparison | Result; change |
|---|---|---|---|
| 1.2 ball complement | `ℝ`, remove `(−1,1)` | Two components, boundary `{−1,1}`; dimension-one connectedness fails | Correctly excluded |
| 1.2 ball complement | `ℝ²`, remove open unit disc | One component, boundary `S¹`; radial coordinates `(θ,r)`, `r≥1` | Consistent; locator needed |
| 1.3 double | Half-line versus interval | `ℝ` noncompact versus `S¹` compact | R16 |
| 1.4 connected sum | `ℝ#ℝ`; `S¹#S¹` | Components `2` versus `1` | R17 |
| 1.4 sum Euler characteristic | `T²#T²` | `χ=−2=0+0−2`; `g=2` | Consistent under finite-type hypotheses |
| 1.4 orientations | `ℂP²#ℂP²`, `ℂP²#−ℂP²` | Forms `diag(1,1)`, `diag(1,−1)`; signatures 2, 0 | Orientation is necessary |
| 1.5 open normal tube | Circle, `ε=1` and `ε=2` | First image `0<r<2`, injective; second includes all inward length-one vectors at 0 | R23 |
| 1.8 genus | Sphere, torus, disc, punctured torus | `(χ,b)=(2,0),(0,0),(1,1),(−1,1)` give `g=0,1,0,1` | Previous repair valid |
| 2.1 locally flat composition | Axis then plane inclusion, and rotated axis | Slice coordinates `(x,0,0)` and `(0,x,0)`; transverse rank 2 in each | Product-chart repair works |
| 2.1 boundary/PL controls | Half-line; cone on trefoil | Endpoint has one punctured branch, not two; cone complement group nonabelian versus standard `ℤ` | Distinguishes boundary model and locally unknotted PL |
| Annulus headline / 2.3 | `n=0`, outer points ±2, inner points ±1 | Region `[-2,-1]∪[1,2]`, two intervals = `S⁰×I` | Consistent; parametrizations not prescribed |
| 3.1 topology | `S⁰`; `f_k(θ)=θ+k⁻² sin(kθ)` | Discrete injection `2→4` embeds; on `S¹`, displacement `k⁻²`, derivative error `k⁻¹`, second derivative sup 1 | R15; positive-dimensional Check works |
| 3.2 families | `F_k(θ,z)=exp(i sin(kθ)/k)z` | Curried rotation displacement ≤`1/k→0`; parameter derivative at 0 has norm 1 | R03 |
| 3.2 orthogonal inclusion | Reflection of circle; `O(2)` | Determinant −1, degree −1; not identity component; kernel consists only of identity | Consistent |
| 3.3 isotopy extension | Rotation of embedded circle | `Φ_t(z)=e^(it)z`, inverse `Φ_(−t)`; `Φ_t∘F₀=F_t` | Consistent; shrinking-knot families are only `C⁰` |
| Smale headline / 3.4 | Reference orthogonal group | `π₀ O(4)=C₂`, `π₁ SO(4)=C₂`; antipodal determinant +1, reflection −1 | Correct reference inclusion, not a homeomorphism claim |
| Watanabe headline | Rational degree-one class | Graph grading `A₂=ℚ` yields a nonzero rational `π₁` class, hence not finite order; identity has order 1 | Source supports the intended contrast |
| 4.3 core orientation | Annulus generator `x→−x` | `θ(−x,−x)=θ(x,x)`; both signs multiply to +1 | R23 |
| 4.4 two strands | `n=0,1,2,3` | `F_n=0,1,1−t,1−t+t²`; `(1+t)F_n=1−(−t)^n`; `F_n(−1)=0,1,2,3` | Correct polynomial division; no pointwise `0/0` |
| 4.6 HOMFLY | Unlink, Hopf, trefoil | `(v⁻¹−v)/z`, `vz+(v−v³)/z`, `2v²−v⁴+v²z²` | Skein recurrence agrees |
| 4.6 Alexander specialization | Positive Hopf | `P(1,−1,w)=−w`; `w=t⁻¹ᐟ²−t¹ᐟ²` gives `t¹ᐟ²−t⁻¹ᐟ²` | Previous sign repair valid |
| 4.6 component detection | `μ=1,2,3` | `V(1)=1,−2,4`; only first can equal 1 | Consistent for nonempty links |
| 4.7 Fox counts | Trefoil moduli `1,2,3,6,7` | Full counts `1,2,9,18,7`; nonconstant `0,0,6,12,0`; determinant 3 | R13 |
| 4.8 Jones span | `U₂`, `U₃`, trefoil, `T(3,4)` | Spans `1,2,3,5`; crossings `0,0,3,8` | R07 for split links |
| 4.9 prime factors | Trefoil, square, Hopf-chain | Knot factor counts `1,2`; Hopf#Hopf has 3 components and 2 prime link factors | Matches Hashizume operation |
| 5.1 exteriors | Unknot versus Hopf | Compact exterior boundaries: one versus two tori; groups `ℤ` versus `ℤ²` | Consistent construction tests; missing supplier R02 |
| 5.2 surgery | Unknot slopes `∞,0,5` | `S³`, `S¹×S²`, `L(5,1)`; `H₁=0,ℤ,C₅` | Convention consistent |
| 5.2 Hopf surgery | Framings `(0,0),(1,1),(3,2)` | Determinants `ab−1=−1,0,5`; homology `0,ℤ,C₅` | Distinguishes sign of off-diagonal linking |
| 5.3 Property P/R | Unknot; trefoil +1 | Unknot +1 gives trivial group, 0 gives `ℤ`; trefoil +1 has group order 120 | Nontriviality needed; source reduction checked |
| 5.3 cosmetic slopes | Trefoil `9,9/2` | Both `|p−6q|=3`, both `H₁=C₉`; slopes distinct | Compatible with Mathieu, homeomorphism not certified here |
| 5.4 cyclic slopes | Figure-eight meridian repeated | Both groups 1; slope determinant `|1·0−1·0|=0` | R14 |
| 5.4 Moser | Trefoil `5,7,6`; `T(1,2)` at 5 | `|p−6q|=1,1,0`; lens/lens/reducible; unknot example gives 3 yet lens | R14; nontrivial torus cases agree |
| 5.4 unknotting one | `8₃`, determinant 17 | Half-integral torus surgery would require `rs=8` or 9; neither is product of coprime integers >1 | Consistent obstruction |
| 6.1 concordance | Square versus granny | Square slice genus 0, signature 0; granny signature −4, genus at least 2 | R25: the kernel includes the zero class |
| 6.2 ordinary signature | Trefoil/figure-eight | Eigenvalues `−3,−1` and `±√5`; signatures `−2,0` | Determinants need not be units |
| 6.2 root signature | Trefoil at `exp(iπ/3)` | One-sided values `0,−2`; raw and averaged both −1 here | This example alone does not distinguish raw from averaged |
| 6.2 slice counterexample | Cha–Livingston root example | Raw 2, average 0, slice genus 0 | R08 |
| Freedman headline / 6.4 | Unknot; Alexander-one knots | Unknot commutator trivial/perfect, slice genus 0; trefoil Alexander polynomial not 1 | Hypothesis separates smooth and topological slicing claims |
| Mostow headline / 7.2 | Genus-two surface, closed hyperbolic 3-manifold | Surface deformation dimension `6·2−6=6`; rigidity range begins at 3 | Excluded dimension-two family is a valid negative control |
| 7.3 positivity | Empty manifold | Total volume0, not positive | R18; add nonemptiness |
| 7.3 cusp structure | Figure-eight; Gieseking | Torus cusp group `ℤ²`; Klein cusp group `⟨a,b∣aba⁻¹=b⁻¹⟩` | R18 |
| Virtual fibering headline | Finite cover degree `d`; circle mapping torus | Cover fibre cardinality `d`, not 0; pullback to `ℝ` is `F×ℝ` | Native finite-cover/fibration objects match conclusion |
| Virtual Haken headline | Surface-bundle cover | Fibre inclusion `π₁F→π₁M` injective; genus≥1 gives infinite group; spherical fibre gives trivial group | Haken surface predicate excludes the sphere case |
| Alexander headline / 8.1 | Equatorial sphere in `S³` | Two complementary balls, both `π₁=1`; ball-extension exists | Local flatness is not dropped |
| Knot-group headline | Unknot versus trefoil | Groups `ℤ` versus `⟨x,y∣xyx=yxy⟩`; trefoil has nonabelian `S₃` quotient | Native group equivalence excludes trefoil |
| Gordon–Luecke headline | Knot versus mirror; granny versus square | Reflection gives complement homeomorphism in first pair; second pair has equal groups but signatures `−4,0` | Conclusion allows reflection; group alone is not its hypothesis |
| 8.2 prime decomposition | `S³`, `S²×S¹`, `ℝP³#ℝP³` | Nontrivial prime factor counts `0,1,2`; middle is prime with essential sphere | Consistent; R12 concerns finiteness formulation |
| 8.2 finiteness | `N` parallel fibres in `S²×S¹` | Cardinality `N` unbounded, all spheres essential; one parallelism class | R12 |
| 8.4 vertical/horizontal | Ball-boundary sphere in `T³` | `χ(S²)=2`; any finite horizontal cover of `T²` has χ0 | R09 |
| 8.4 irreducibility | `ℝP³#ℝP³` | `π₁=C₂*C₂` infinite; separating sphere does not bound a ball | R10 |
| 8.4 invariants | `T³`, Klein×circle over `T²` | Same displayed `(g,b,k)=(1,0,0)`; orientation characters `0` and nonzero | R11 |
| JSJ headline / 8.5 | `T³`; Anosov torus bundle | Minimal torus counts 0 and 1; cutting the latter gives `T²×(0,1)` | Inclusion-minimality excludes redundant coordinate torus in `T³` |
| Geometrization headline / 8.6 | Same two manifolds | Whole geometries `E³`, `Sol`; piece counts 1,1 after 0,1 cutting tori | Piece formulation agrees with source's topological consequence |
| Poincaré headline | `S³`; Poincaré homology sphere | Groups 1 versus order 120; only first satisfies simply connected | Nonempty/path-connected binders verified |
| 9.2 rank/genus | `S³,L(2,1),T³` | Rank/genus `0/0,1/1,3/3` | R19 for `L(1,q)` |
| 10.2 asphericity | `S²×S¹`; `T³` | Universal covers `S²×ℝ` with `π₂=ℤ`, and `ℝ³` with `π₂=0` | R04 |
| 11.1 realization | Boundary of 0-simplex; two-point complex | Realizations empty and two points; cell counts 0 and 2 | Correct low-dimensional controls |
| 11.1 barycentre | One maximal edge | Face link empty; neighbourhood boundary two points | R06 |
| 11.3 triangulations | Single/double Poincaré suspension | Single suspension local punctured group order120; double suspension underlying space `S⁵` | R05 |
| Manolescu headline / 11.4 | Dimensions 0,5,6 | Dimension0 triangulable; counterexamples in5 can be nonorientable, orientable examples begin6 | Correct omission of orientability hypothesis |
| 11.5 collapse | Tree; triangle boundary; point cylinder | Tree reduces to one vertex, χ1; cycle χ0 and `π₁=ℤ`; point cylinder is one edge, collapses | Consistent elementary cases; fixed-triangulation Zeeman source not certified |

**Companion probes.** Bare `simp`, `rfl` and `infer_instance` closed none of the 69 admitted companion targets. The proved time-zero rotation closes by simplification; admitted matrix/polynomial table entries are still padding under the acceptance rule. Additional computed controls:

| Companion object | Inputs and computed values | Result |
|---|---|---|
| Brunnian words | Empty product 1; `[a,b]` reduced length 4; kill either letter →1 | Distinguishes Brunnian from identity |
| Composite meridian generators | `(F₃²)⋊C₂` with inversion has order18; two generators generate at most the order9 vector subgroup or an order6 dihedral subgroup | Three generators needed |
| Crossing-change form | `diag(−1,0)→diag(1,0)` has rank-one difference; signatures −1→1 | Difference2 meets `2 rank` bound |
| FiveOne / TwoStrandAlexander | `t⁴−t³+t²−t+1` at `t=1,−1` gives 1,5 | Polynomial normalization consistent |
| FiveTwo colourings | Smith torsion7: modulus7 gives49 solutions; modulus14 gives98 | Composite-modulus count differs from vector-space dimension |
| Indexed doubling | Small symmetric group `S₃` has order6, a 3-cycle has order3, a transposition order2 | Both cycle types needed |
| Jones cyclotomic | Primitive cube root `w`: `1+w+w²=0`; primitive sixth root `z`: `1+z+z²=2z` | Roots cannot be interchanged |
| KnotGrowth | `m=0,1,2,3,4` gives odd counts `0,2,2,6,10` | Matches recurrence values above |
| KnotMixedCycle | `(45)(123)` and `(35)(124)` have orders6; product `(13425)` order5; cube of first `(45)` | Nonabelian permutation controls |
| LeeFrobenius | `c=0`: dual numbers; `c=1` over `ℚ`: idempotents `(1±X)/2`; over `F₂`: `(X−1)²=0` | Characteristic2 split argument fails; scope R21 |
| Problem20 Fox | Mod3: each knot has3 constant colourings; two-component unlink has9 | Constant-colour counts discriminate component number |
| Shrinking isotopy | Spatial displacement ≤`2t→0`; derivatives need not approach identity | `C⁰` versus smooth-family distinction |
| SimplicialLinks | Triangle vertex link has two points; maximal edge link empty | Transverse link distinction R06 |
| Torus knot parameters | `(0,1)` gives an embedded circle; `(0,0)` constant; `(2,2)` has kernel size2 | Coprimality and zero cases separated |
| Trefoil mirror | Inverting both generators preserves `xyx=yxy`; central full twist maps to its inverse | Peripheral orientation cannot be discarded |
| TwoTangle | `e²=μe`; closure matrix determinant `μ²−1`; at `μ=1` kernel includes `(1,−1)`, at `μ=0` determinant−1 | Degenerate pairing is not invertible |

**Seeded locator audit (15 targets).** Printed pages are used. No README locator was labelled unverified; R24 identifies missing ones. Partial verification is distinguished from unread citations.

| Sample | Text at locator and outcome |
|---|---|
| 1.2 ball complements | No direct locator at the claim. Radial and one-dimensional tests above are sound; source certification cannot be supplied for an absent citation (R24). |
| 1.4 connected sum | `palais-extending` Theorem B, pp.275–276; `hirsch-differential-topology` lines4670–4679, Ch.4 Theorem6.6, p.117: orientation-compatible disc embeddings are isotopic. This supports choice independence, not the unrestricted connectedness/Euler claims (R17). |
| 2.1 closure beyond pin | Product-chart argument and pinned compatibility theorem inspected. Brown1962 could not be read; Brown1960 is a different paper and was not substituted for it. Smooth local flatness already supplied (R20). |
| 3.1 Diff topology | `hirsch-differential-topology` lines1481–1538, Ch.2 §1 pp.34–36; lines2653–2654, §4 Exercise9 p.64. Compact-domain topology/group background agrees; strictness needs positive dimension (R15). |
| 3.2 smooth families | No source locator for the asserted inverse continuity. It is false by the displayed oscillating family (R03). The pinned API supplies forward continuity only. |
| 4.6 HOMFLY/Kauffman | `freyd-polynomial` lines57–76, main theorem p.240, supports existence/uniqueness and skein normalization after change of variables. Kauffman/Lickorish locators remain uncertified; no claim that this source proves both theories. |
| 4.9 prime decomposition | `melikhov-local-knots` lines232–242, arXiv2511.19579v1, Theorem3.2 p.7, states non-split link factorization under Hashizume sum. The primary Hashizume paper and Lickorish Theorem2.12 were not readable. |
| 5.2 surgery | Unknot/Hopf slopes computed above; `moser-torus-knot`, Propositions3.1,3.2,4, pp.741–743, supports torus-knot fillings. Rolfsen Ch.9 remains uncertified; the full surgery-existence/Kirby calculus locator was not verified. |
| 5.3 P/R/cosmetic surgery | `kronheimer-mrowka-property-p` lines54–75, Theorems1–2 pp.296–297 (math/0311489v5), includes the nontrivial representation and reduction to Property P. Gabai §8 and Mathieu pp.9–10 were not readable. |
| 5.4 cyclic/unknotting one | Moser above; `kanenobu-murakami` lines31–41, Theorems1–2 p.499, supports the two-bridge classification. CGLS and Scharlemann primary locators not certified. R14 independently refutes the missing-hypothesis versions. |
| 6.2 signatures | `conway-signature` Props2.3/2.7, Theorems2.9/2.12, pp.3–6; lines238–245 and282–298 distinguish admissible parameters and averages. Supplemental `cha-livingston-signatures` Corollary2.1 p.2 and construction pp.3–5 gives R08. |
| 8.2 prime decomposition | `hatcher-3m` lines147–168, Proposition1.4/Theorem1.5 pp.4–5; lines432–435, Proposition1.7 p.11; lines473–474, Corollary1.8 p.12. Parallelism/no-sphere restrictions matter (R12). Milnor's primary paper unread. |
| 8.4 Seifert spaces | `hatcher-3m` Proposition1.11 p.16, lines606–608; Proposition1.12 pp.18–19, lines703–726; Proposition1.13/Lemma1.14 pp.19–20, lines728–733/761–764. `scott-geometries` §3 p.434, lines1518–1546. R09–R11/R24 identify mismatches. |
| 8.6 geometrization/Poincaré | `morgan-tian` math/0607607v2, Theorem0.1 p.5 lines175–179 and Corollary0.2(a) p.6 lines189–191 support the repaired Poincaré attribution. Scott §4 geometries table inspected. This is not a re-verification of Perelman's proofs. |
| 11.5 collapse/Zeeman | `rourke-sanderson` Ch.3 pp.39–40, lines1266–1287 supports collapse and deformation retraction. Zeeman and Kirby's exact conjecture locators are not certified, including the identification with a particular ordered-cylinder triangulation. No open conjecture was accepted as a proved theorem. |

Other direct source checks include `watanabe-diff-s4` Theorem1.1 lines32–36; `agol-virtual-haken` Theorems9.1–9.2 lines662–666; `manolescu-pin2` Corollary1.3 lines72–85; `calegari-foliations` Theorems4.5/4.35 lines5900–5902/6702–6707; and `gabai-meyerhoff-milley-mom` Remark10.9 lines944–946. These support the stated controls and exceptions, without certifying every proof in those works.

## Not verifiable

The legal-source pass covered all 85 References works: 42 readable, 2 unusable cached copies, 11 uncertified and 30 unavailable. Availability does not certify locators: the seeded table records what was read; remaining unsampled locators were not all certified. No source was copied into the repository or manifest edited. Existing requests were preserved; the review is not parked.

Below, “resolver failed” means the sources service and cache search yielded no readable legal copy; open-repository requests often returned429/503/timeouts. Paywalled locators remain uncertified.

| Source | Where looked / limitation |
|---|---|
| `kirby-problems` | Author PostScript could not be rendered; cached Drive copy has unverified provenance. |
| `lee-smooth-manifolds` | Publisher paywall; uncertified. |
| `lee-riemannian` | Resolver failed; no readable legal copy. |
| `palais-restriction` | Resolver failed; no readable legal copy. |
| `munkres-differential-topology` | Publisher paywall; uncertified. |
| `whitehead-c1` | Resolver failed; no readable legal copy. |
| `moise-geometric-topology` | Publisher paywall; uncertified. |
| `bing-triangulation` | JSTOR landing page; no open text. |
| `brown-locally-flat` | Resolver failed; no readable legal copy. |
| `quinn-ends-iii` | Project Euclid denial page; resolver failed. |
| `hatcher-smale` | Author PDF cached, but text extraction has corrupt character mapping. |
| `smale-s2` | JSTOR landing page; no open text. |
| `lickorish-knot-theory` | Publisher paywall; uncertified. |
| `burde-zieschang-knots` | Publisher paywall; uncertified. |
| `rolfsen-knots-links` | Publisher paywall; uncertified. |
| `birman-braids` | Publisher paywall; uncertified. |
| `turaev-alternating` | Resolver failed; no readable legal copy. |
| `morton-seifert` | Cambridge landing page without readable text; resolver failed. |
| `schubert-numerical` | Resolver failed; no readable legal copy. |
| `schubert-two-bridge` | Resolver failed; no readable legal copy. |
| `hashizume-decomposition` | Project Euclid denial page; resolver failed. |
| `garside-braid` | Oxford DOI returned403; resolver/open-repository search failed. |
| `epstein-word-processing` | Publisher paywall; uncertified. |
| `elrifai-morton` | Oxford DOI returned403; resolver/open-repository search failed. |
| `scharlemann-unknotting` | Publisher paywall; uncertified. |
| `ernst-sumners` | Cambridge landing page without readable text; resolver failed. |
| `gabai-foliations-iii` | Project Euclid denial page; resolver failed. |
| `mathieu-surgery` | Resolver failed; no readable legal copy. |
| `culler-gordon-luecke-shalen` | Resolver failed; no readable legal copy. |
| `gordon-luecke` | Resolver failed; no readable legal copy. |
| `freedman-topology` | Project Euclid denial page; resolver failed. |
| `mostow-rigidity` | Resolver chose a different PNAS citation, then403; exact IHÉS article not certified. |
| `prasad-rigidity` | Resolver failed; no readable legal copy. |
| `ratcliffe-hyperbolic` | Publisher paywall; uncertified. |
| `papakyriakopoulos-dehn` | JSTOR landing page; no open text. |
| `milnor-decomposition` | Resolver failed; no readable legal copy. |
| `waldhausen-irreducible` | JSTOR landing page; no open text. |
| `waldhausen-heegaard` | Resolver failed; no readable legal copy. |
| `jaco-shalen` | Resolver failed; no readable legal copy. |
| `johannson-boundaries` | Resolver failed; no readable legal copy. |
| `novikov-foliations` | Resolver failed; no readable legal copy. |
| `lickorish-foliation` | JSTOR landing page; no open text. |
| `zeeman-dunce-hat` | Publisher paywall; uncertified. |

Zeeman’s ordered-cylinder equivalence, the cosmetic-surgery homeomorphism and unlisted version-number correspondences remain uncertified. Damaged equation extraction was not used for errata. Ownership against unnamed open PRs without readable files was not checked.

## Source issues

- **Misprint** in cha-livingston-signatures at §1, printed p.2 (line63): the source says Alexander polynomials have value ±1 at −1; it should be value ±1 at 1, as used on p.3; affects a stated result.
- **Misprint** in cha-livingston-signatures at proof of Theorem2, printed p.5 (lines219–220): the source says the signature cases compare the fixed number of roots k with p; it should be the root index j compared with p; affects the proof.
- **Error** in calegari-foliations at Theorem4.37, printed p.167 (lines6876–6878): the source says a Reebless foliation forces π₂(M)=0 without the sphere-bundle exception; it should be exclude the spherical-leaf case, as the preceding discussion explains; affects a stated result.
