# Review of PadicHodgeTheoryPartII (package, round 2)

**Verdict:** needs changes

Three findings: one P2 and two P3. The previous three findings are repaired. The README's principal mathematical statements survive the checks below, and the Lean file elaborates without messages. The remaining repairs concern an omitted hypothesis in its headline description, an inconsistent build guide, and the inventory of the newer pinned library.

## R01 (P2) — The torsor headline drops the open-image hypothesis

**Location:** `packages/PadicHodgeTheoryPartII/Suggested.lean:33`, continuing through line 35: “their images in an equivariant target have stabilizers with open derived part.”

**Claim:** The sentence starts with an arbitrary continuous ξ and asserts open derived stabilizers for its images, without the open derived image assumption of README §4.2.

**Witness:** Take G=GL₂, ξ=1, Y=T_ξ and j=id. Every component stabilizer is {1}; its intersection with SL₂(Q_p) is {1}, which is not open: [[1,pⁿ],[0,1]]≠1 converges to 1.

**Exact repair:** Split this bullet into the unconditional component formula of §4.1 and the conditional statement of §4.2. Before the latter write: “If ξ(Γ_K)∩G_der(Q_p) is open, then each component of a locally spatial equivariant target containing the image of a source component has open derived stabilizer.” Add transitivity only for the conclusion about every target component. Keep the missing-diamond explanation and do not add a substitute theorem. Tested repair: the trivial GL₂ example is excluded from the open-image clause, while its components and trivial stabilizers still satisfy the first clause; for a torus the derived intersection is {1}, open in {1}.

## R02 (P3) — The build guide contradicts the actual dependencies

**Location:** `packages/PadicHodgeTheoryPartII/README.md:111`: “Layers 0 and 1 are independent of each other”.

**Claim:** Neither layer needs the other.

**Witness:** README line 314 needs §0.2; line 324 needs §0.3. Section 1.1 defines its jump using §0.1 (line 250). These give three Layer-1-to-Layer-0 edges, not zero.

**Exact repair:** Replace the sentence by: “Layer 1 uses Layer 0's jump predicate in §1.1, degree sum in §1.5 and tested-vector sets in §1.6; Layer 0 does not depend on Layer 1. Layers 2–4 combine these inputs.” Also add §0.1 to §1.1's Needs clause and Layer 1's Dependencies. Tested against all three uses, this describes their actual direction and preserves the existing build order. No target needs moving.

## R03 (P3) — Refresh the pinned-library inventory and imported inputs

**Location:** `packages/PadicHodgeTheoryPartII/Suggested.lean:26`, continuing through line 28, lists as missing “the `p`-adic topology on `G(ℚ_p)`”; `packages/PadicHodgeTheoryPartII/README.md:47` assigns the derived-image equality to Milne, used again at line 445.

**Claim:** Rational-point topology remains unavailable, and the derived-image step is to be obtained from the source rather than the pinned API. These are stale boundaries at the specified pins.

**Witness:** `TauCeti/Topology/Algebra/PointTopology/Basic.lean:83,110` defines the point topology; `Group.lean:102` supplies `TauCeti.PointTopology.isTopologicalGroup`. `TauCeti/Algebra/AlgebraicGroup/Derived/Image.lean:97,113` supplies derived-image surjectivity and faithful flatness.

**Exact repair:** Remove rational-point topology from the missing-carrier list, retaining the genuinely missing Grassmannian, admissible-locus and crystalline carriers. Add the native point-topology declarations to the Tau Ceti contract and refer to them for this part of the ReductiveGroupsPartII contract. For §3.4, import `TauCeti.CommHopfAlgCat.mapPointsFunctor_derivedMap_app_surjective` (finite-type affine groups, injective coordinate map, algebraically closed value field), or `TauCeti.CommHopfAlgCat.faithfullyFlat_derivedMap` after algebraic closure (finite type, reduced target). Keep Milne as the mathematical locator and keep the new central-lifting theorem; do not rebuild the derived-image input. Tested repair: specialize the topology to k=R=Q_p and H=O(GL₂); specialize derived-image surjectivity to J°→f(J°) over k̄. For GL₂→PGL₂ the derived image has dimension 3, while for a torus it has dimension 0. These are exactly the two cases used by §3.4. This does not make the period-point headline statable.

## Verified sound

### Previous findings, checked individually

- **F01 — repaired.** README line 93 now says “Section 0.4 supplies `associatedCoefficient`”. All six §B0.4 references are gone. `TauCetiRoadmap/AutomorphicBundles/README.md:533` at #1069 is §0.4; lines 535–565 construct the associated finite locally free module for a flat affine group and an fpqc right torsor, with pullback, maps, tensors, base change and rank. The changed citation is exact. For the frame torsor of a line L, weight +1 gives L and weight −1 gives L∨, matching the convention used for the universal filtration.
- **F02 — repaired.** README line 51 now says “the filtered fibre functor `F_{b,μ}` of a pair (b, μ) and the admissibility predicate”; line 73 says “Section 1.7 supplies the Hodge invariants μ^♮ and the Galois average μ^◇”; line 77 says “its crystalline classical fibres”. The thirteen obsolete names have been replaced by section-based descriptions. The carrier attribution now explicitly says “the carrier that FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.1 names `FilteredPhiNModule K`” (line 61). Resolved these descriptions against PadicHodgeTheory §§3.3–3.6, 4.4, 5.5, BunGAndNewtonStrata §§1.7–1.9, 1.12, 1.23, 1.43, HeckeStacksAndLocalShtukas §HS2.11 and the two filtered-module suppliers. The retained `FilteredPhiNModule.IsWeaklyAdmissible` is explicitly named in `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4659,4687` at #879; it is supplier notation, not a claim of a pinned declaration. The initial resolver alert about it is not a finding.
- **F03 — repaired.** The Chen14 manifest now records `fetched_from = "https://www.numdam.org/item/10.24033/asens.2225.pdf"` and `licence_class = "open-repository"`. Chen14 line 2 records that exact origin. The stored hash and journal pagination agree. The unchanged SMF `url` is a second legal access link, not a conflicting fetch-origin assertion.

The additional repair-stage code-span change around F_(b,μ) is present. No changed mathematical hypothesis was hidden in these citation repairs. Their changed objects are also exercised in the table below. No prior finding was marked not actionable, and no settled finding is re-raised.

### Principles, scope and shape

Read all 25 numbered targets, their proof routes, all 25 Needs clauses, and all 82 Check bullets. There are five layers, each ending with Examples and Dependencies. The definitions in §§0.1–0.5 and 1.1 have their APIs and at least three Checks. Mathematical headings describe the objects needed for the five end results; the order is supported by the actual dependency edges, with the guide inconsistency isolated in R02. The plan does not claim to reproduce a source's chapter arrangement.

The extension begins where PadicHodgeTheory §§3.6 and 5.5 stop. It imports the period functors, weak admissibility, B(G), slope classification, Tannaka reconstruction and period towers. It owns the generic filtration/monodromy argument and the compact-image component specialization. Arbitrary connected reductive groups, ramification, nonquasisplit forms, nonminuscule cocharacters, and p=2 remain included. The topology lemma §3.3 covers every smooth connected affine group over a characteristic-zero local field, expressly distinguishing the earlier symplectic special case. No computational algorithm, copied source passage, sorry'd data, `set_option`, process handoff, machine path, or undeclared own Lean identifier occurs in the package text. Backticked mathematical expressions are notation, not claimed declaration names. Metadata is the valid topic-only entry. Five cited works have five manifest entries; no source fetch or manifest edit was needed.

### Source verification

Opened all 15 seeded targets at the cached texts and checked numbering, printed pages, hypotheses and proof steps. No locator is marked unverified by the author. The arithmetic statements are in characteristic zero, with algebraically closed residue field where needed. Chen's unramified setting is not silently used for arbitrary G: GLX explicitly supplies that extension. A corrected source formula is identified as corrected, not passed off as a literal theorem.

| Target | Locator and text read | Verification |
|---|---|---|
| 0.4 | Chen14 §3.1, pp.739–740, line 781; Definition 3.3.1 and Lemma 3.3.2, p.742, line 930; GLX26 ¶14, p.32, line 1289 | Slopes have denominator dividing positive s; normalized φ^s-fixed vectors form the finite-field fibre. Decency gives the ambient identification. Admissibility is required only for the filtered Tannakian restriction. |
| 0.6 | Chen14 Proposition 3.3.4(1), pp.743–744, line 966, and Proposition 3.3.6(1), p.745, line 1034; GLX26 p.33, line 1319 | All representations and coefficient lines are tested, with scalar action allowed. The scheme-theoretic argument uses Chevalley on all value algebras. It deliberately avoids the erroneous single-mixed-power claim of part (2). |
| 1.1 | GLX26 Definitions 5.3/5.5, pp.33–34, lines 1340/1427; Propositions 5.4/5.6, pp.34–35, lines 1382/1435; Chen14 Lemma 4.2.2, p.747, line 1133 | Generic-point equality follows from the closed zero locus of a quotient-bundle section. Transport works for embeddings into a common closure. The extension to quasisplit G is in GLX. |
| 1.2 | GLX26 Proposition 5.7 and proof, pp.36–37, line 1501; orbit decomposition p.35, line 1464 | The source's Gal(E/k) indexing needs correction. The README's minimum over all weights in O, or all Γ_E-orbits inside O, proves both inclusions without normality of E/k. |
| 1.5 | GLX26 (5.30)–(5.36), p.39, line 1655 | Sum over an entire positive period. The README correctly uses σ₀^(−i) in the individual pairing and reindexes the whole sum. |
| 1.6 | GLX26 (5.37)–(5.38), pp.39–40, line 1686 | Dominant ν, the eigenvector equation, and nonzero occurring components yield the stated lowest-weight bound. |
| 1.7 | GLX26 proof of Theorem 5.8(2), p.40, line 1703 | Every coroot coefficient must be strictly positive. The README supplies the highest-weight argument from orthogonality to a one-dimensional geometric simple. |
| 2.1 | Chen14 §3.1, p.739, line 781; proof of Theorem 5.0.6(1), pp.750–751, line 1333 | The same decent field descends every φ-subobject. The README derives this from its unfiltered fibre construction, avoiding an admissibility cycle. |
| 2.3 | GLX26 Theorem 5.8(1), pp.37–38, lines 1591/1605; Chen14 Theorem 5.0.6 and proof, pp.750–751, lines 1303/1328 | Acceptability and genericity suffice. GLX explains removal of Chen's unramified restriction; strict HN positivity is not used for part (1). |
| 3.1 | GLX26 Lemma 5.10, p.40, line 1727; Stacks 054L line 3743, 02GL line 3577, 03WT line 3611, 01UA line 2128 | Finite E/Q_p, smooth nonempty geometrically integral X; étale chart, independent parameters, and a finite separable residue extension give K. The README validly generalizes the flag-variety instance. |
| 3.2 | GLX26 Proposition 5.9, p.40, line 1712, Theorem 5.2, p.32, line 1287; Serre79 §1.1 line 42 and Theorem 1, p.158, line 125 | HN irreducibility and acceptability retained; no unramified/minuscule restriction. The declared Sen contract has the correct strict residue-field hypothesis. |
| 3.3 | Serre79 §1.3, pp.157–158, lines 97–129 | This is a proof-route citation, not an assertion that Serre states the identical general lemma. Analytic charts, smoothness and dimension prove the extension to any smooth connected affine J; the reductive suppliers provide those inputs. |
| 3.4 | MilneiAG Proposition 8.20 and Corollary 8.21, p.131, lines 5283/5297; GLX26 Proposition 6.7, p.47, line 1991 | The commutator-generated description gives image/derived compatibility and connectedness. Central finite kernel plus dimension gives the lifting statement. The pinned native input should now be cited as R03 specifies. |
| 4.1 | GLX26 Lemma 6.12 proof, pp.50–51, lines 2143/2158 | The stabilizer is the compact Galois image up to conjugacy. The README supplies the connected finite-cover limit and invariant-clopen separation rather than using an unrestricted quotient-component formula. |
| 4.2 | GLX26 Lemma 6.12, pp.50–51, lines 2142–2176 | Source-stabilizer inclusion transfers openness only from an open-derived-image point. Transitivity is separately required to reach every component. README has both; its Lean docstring loses the first (R01). |

Also reopened GLX26 Definitions 2.1/2.3 and ¶4 (p.15, lines 607–627), Theorem 5.8(2), Proposition 6.6(1) (pp.45–46, lines 1920–1950) and Proposition 6.7 (p.47, lines 1991–2000) for the remaining headlines; Chen14 Lemma 3.3.5 and its Hom calculation (pp.744–745, lines 1008–1056) for the repaired HN/strictness citations; and Chen14 Definition 3.2.2/Proposition 3.2.3 (pp.741–742, lines 879–911) for the full tensor group.

### Computed adversarial pass

The table covers the sample, every headline, all 25 numbered targets, the repaired supplier wording, and each new finding. For untouched ancillary APIs, the first review's rows with computed values were re-read alongside the current text; no prose-only assurance from that review was treated as evidence. “Retain” means no repair for that statement. Out-of-scope tests are identified explicitly: the p-adic layers require characteristic zero; general fields are allowed only in the filtration and representation-theoretic statements. Every denominator s or orbit cardinality is positive/nonzero.

| Statement | Instances tried | Values computed on both sides / negative control | Result; change |
|---|---|---|---|
| Conventions; repaired acceptable-set citations | Q_p(1); G_m with b=p^m, μ=h; ordinary/basic GL₂, p=2 or 3 | Q_p(1): φ=p⁻¹σ, t_H=t_N=−1; G_m: κ=m, μ♮=h, acceptable iff m=h. Basic b=[[0,1],[p,0]] has b²=pI, ν=(1/2,1/2), μ−ν=(1/2)α∨; ordinary difference=0. | Retain; twist and decency signs agree with suppliers. |
| 0.1 jump/API | Two-step filtration, zero vector, characteristic 2 | e₁ has jump 2, e₂ and e₁+e₂ jump −1; −1=min(2,−1). Zero lies in every step and in no step difference. In F₂, e₁+e₁=0 is excluded from the sum inequality. | Retain; exhaustion/separation exclude constant nonseparated filtrations. |
| 0.2 full-period sum/API | s=0,1; identity; 2-cycle (1,−1); 3-cycle (2,0,−5) | Empty sum=0; one term=d(v); identity gives s·d(v); 2-sum=0 versus wrong value 2; 3-sum=−3 and 2-sum=2. Recursion adds exactly the next entry. | Retain. |
| 0.3 tested sets | G_m rank one; GL₂ diag(p,1); zero | Newton exponent=sa, Hodge sum=sh; membership iff sa=sh=k. For GL₂, e₁ has (k,d)=(1,1), e₂=(0,0), but e₁+e₂ is no eigenvector. Zero has no jump. | Retain; not a vector-subspace carrier. |
| 0.4 decent fibre/API | Unit; slope 1/2 block with s=2; φ=pσ; zero | Unit fibre dimension 1 over Q_(p^s); half-slope block: φ²=pσ², fibre dimension 2. Unnormalized fixed space for pσ has dimension 0 by valuation, normalized space dimension 1. Zero has dimension 0. Tensor/dual slopes λ+λ′ and −λ retain denominators dividing s. | Retain. |
| 0.5 rank-one coefficient classification/Hom | s=1; s=2, jumps (1,−1); altered wrap; inadmissible projection | t_H=t_N=k in rank one. At s=2, sum=0 and v_p(det swap)=0; stable F(e₀+ce₁) has cσ(c)=1 and t_H=−1≤0=t_N. Wrap p changes t_N to 1≠0. Projection e₁+e₂↦e₂ for T=G_m², b=1, μ=(0,1) changes jump 0→1; that pair is inadmissible. | Retain; repaired HN and strictness suppliers are sufficient. |
| 0.6 invariant-line criterion | G_m, m≠0; b=1, μ=0; GL₂; mixed powers alone | At m≠0, H=G_m preserves the standard line with scalar a; vector stabilizer would be 1. At b=1, μ=0, all vectors are tested; lines of V⊕1 force scalar=1, giving H=1. For faithful χ of G_m, every single mixed power has dimension 1, while 1⊕χ has dimension 2. | Retain all representations; source part (2) is insufficient. |
| 0.7 comparison | Trivial pair; cyclotomic power; change of frame h | H=H_cris=1 for the trivial pair. For m≠0, ξ=χ^(−m), H=G_m of dimension 1. Frame change sends H↦hHh⁻¹; normal G_der maps to itself, so containment survives. | Retain full group and ambient conjugation. |
| 1.1 generic filtration/API; associated bundle | GL₂ standard/determinant; transcendental t; nonnormal cubic torus | Standard Fil¹_gen=0, Fil⁰_gen=V; K(1,t)∩k²=0 versus rational [1:0] giving ke₁. Determinant jump=1. For E=Q₅(5^(1/3)), V_E=E×E′ and diagonal V meets the weight-one factor in 0. Frame torsor: χ gives L, χ⁻¹ gives L∨. | Retain; all three Checks discriminate. |
| 1.2 threshold | Same cubic torus; GL₂; trivial weight over quadratic E/k | Cubic pairings are (1,0,0), minimum 0; Γ_E-orbit sizes 1 and 2. Gal(E/k)={1} at first embedding would give 1. GL₂ standard threshold 0, determinant 1. A repeated trivial component summed over Gal(E/k) gives 2v≠v. | Retain corrected orbit indexing. |
| 1.3 orbit average | Orbit sizes (1,2), pairings (0,3); cubic torus | min=0≤(0+6)/3=2; unweighted mean=3/2≠2. Cubic case: jump 0≤threshold 0≤average 1/3. | Retain. |
| 1.4 Frobenius transport | Unramified quadratic restriction-of-scalars torus; split group | In two factors, 1⊗σ sends (x,y)↦(σ(y),σ(x)); e₁'s isotypic factor goes to e₂. For split G, σ₀=1 and the factor stays itself. ρ(b) alone preserves both isotypic parts. | Retain; Frobenius direction fixed. |
| 1.5 full-period bound | G_m; GL₂ basic; doubled period | Rank one: d₁=m=pairing. Basic GL₂ at generic flag: every rational vector has jump 0, d₂=0≤0, while Newton k=1, so tested set empty. Repeating a full period m times yields d_(ms)=m d_s and RHS multiplied by m. | Retain; Needs 0.2 contradicts guide (R02). |
| 1.6 Newton lowest weight | GL₂ ν=(a,b), a≥b; torus | Newton exponents are sa or sb; lowest pairing b≤a or b. For torus χ, both sides equal k/s. For zero no occurring weight exists, and zero is excluded. | Retain; Needs 0.3 contradicts guide (R02). |
| 1.7 strict positivity | SL₂ weight n>0; ordinary GL₂; torus | Antidominant value −n gives −cn<0 for c>0, contradicting 0≤−cn. With c=0, sandwich 0≤0≤0 holds for λ=(1,0), but coroot pairing=1. λ=0 gives dimension 1; SL₂ λ=1 gives dimension 2. | Retain strict positivity and geometric highest weights. |
| 2.1 uniform descent | b=1; simple slope a/h with gcd(a,h)=1; diag(p,1) | σ-stable subspace is F⊗W with W rational; dimensions agree. Simple block only has ranks 0 and h. Distinct GL₂ slopes give exactly the two stable lines, descending to Q_p. | Retain; single s is independent of the subobject. |
| 2.2 minimal Hodge degree/rank loci | Fixed line L in a plane; zero/whole subobject; square-zero base | t_H(L)=1 at flag L, 0 elsewhere; rank(L→V/ℓ)=0 versus 1. Whole plane t_H=1, zero t_H=0. On k[ε]/ε², multiplication ε has geometric rank 0 but nonzero minor ε; its scheme rank-zero locus is (ε), not the whole thickening. | Retain: statement uses fibre values; supplier keeps scheme structure. |
| 2.3 generic admissibility | Ordinary GL₂; G_m; basic rank two | Slope-zero line at bad flag: t_H=1>0=t_N; at generic flag: 0=0. Rank-one condition h=m. Basic standard object total t_H=1=t_N, no proper subisocrystal; tensor/dual closure treats all representations. | Retain; does not require HN irreducibility. |
| 2.4 derived monodromy | Basic versus ordinary GL₂; torus | Basic μ−ν=(1/2)α∨, forcing all tested geometric weights to be central, so SL₂⊆H°. Ordinary c=0, slope-zero line has t_H=t_N=0 and ξ is reducible; SL₂ containment fails. Torus derived dimension=0. | Retain; no inference from a single representation alone. |
| 3.1 generic flags | P¹_E; dimension zero; finite separable base change | For t transcendental, kernel of E[T]→K is (0), transcendence degree=1; for algebraic t kernel≠0. Dimension-zero geometrically integral X=Spec E, K=FE. Nonempty qc étale fibre is a finite nonempty sum of finite separable fields. | Retain; n=0 causes no empty-choice problem. |
| 3.2 open period point | HN basic GL₂; finite extension; unacceptable torus | H contains SL₂ of dimension 3, and openness in H restricts to an open subgroup of SL₂. Restriction has finite index, preserving openness. Norm-one torus with μ=0, κ=1 mod 2 has 1≠0, hence no admissible point. | Retain all acceptability hypotheses. |
| 3.3 density | G_m, U=1+pZ_p; disconnected O₂; diagonal compact subgroup | Infinite U has closure G_m, dimension 1. Open SO₂ in O₂ has closure SO₂, missing one component. Diagonal compact subgroup of GL₂ has closure dimension 2<4; compactness alone fails. | Retain connectedness/openness; includes p=2. |
| 3.4 central lifting | GL₂→PGL₂ with J=GL₂,SL₂,T; determinant map | First two derived images have dimension 3 and finite μ₂ kernel, forcing upstairs SL₂. Torus image dimension 1<3 fails premise. det:GL₂→G_m with J=T has target derived dimension 0, but T misses 3-dimensional SL₂; kernel is not central. | Mathematics sound; import pinned derived-image input (R03). |
| 3.5 z-extension iff | GL₂→PGL₂, p odd/p=2; product with G_m | Image of SL₂(Q_p) has index 4 for odd p, 8 at p=2: open but not all. For a central extra character, determinant may be χ⁻¹≠1 while derived intersection remains open. Both directions use the specified lifted period data. | Retain; avoids rational surjectivity and image-in-derived assumptions. |
| 4.1 components | Trivial ξ; C={1,diag(1,−1)}; infinite compact image | C=1 gives singleton cosets and stabilizer 1. With g=[[1,1],[0,1]], conjugate involution=[[1,−2],[0,−1]]≠diag(1,−1), including p=2. A transitive finite Γ-set has one descended component; compatible finite quotients give one component for each compact orbit. | Retain cosets gC and conjugated stabilizers. |
| 4.2 ambient transfer | Y a point; reached component; extra free summand; torus | Point stabilizer=G(Q_p). Reached stabilizer contains gCg⁻¹ and therefore its open derived intersection. Free summand stabilizer=1, not open in nontrivial derived group. Torus derived group=1 is open in itself. | README sound; docstring's ξ=1, G=GL₂, j=id yields 0-dimensional stabilizer in 3-dimensional SL₂ (R01). |
| Repaired Sen citation; declared gap | Unramified character; logχ extension; strict-field χ; rank zero | Unramified inertia=1, Sen=0 despite infinite total image. logχ has nonzero nilpotent [[0,1],[0,0]]. Strict-field cyclotomic image is open in Q_p×; rank-zero image and closure are both 1. | Retain separate finite-K zero-Sen input and strict-field openness contract. |
| Quasisplit supplier gap | Split group; Res_(E/k)G_m, degree 3 | Split highest-weight orbit size 1. Cubic orbit size 3 gives W_O=E of k-dimension 3 and three one-dimensional geometric constituents, permuted by Γ_k. | Precise, minimal declared extension of split 10B. |
| R02/R03 inventory controls | Count dependency edges; affine GL₂ points | Edges 1.1→0.1, 1.5→0.2 and 1.6→0.3 give 3, versus guide's 0. Native point topology evaluates GL₂ matrix coordinates in Q_p; u_n=[[1,pⁿ],[0,1]]→I and det u_n=1. | Repair guide and missing-carrier inventory. |

### Suppliers, ownership and merge direction

Resolved citations again; did not reuse the previous round's section numbers from memory. Main is `5fc1aa8`; pinned Mathlib is `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The source cache remains the version named in the manifest. The following are the actual main/head sections read (line numbers refer to the README itself, without the display tool's added header).

| Supplier | Resolved files/sections and evidence |
|---|---|
| PadicHodgeTheory #1062 | `TauCetiRoadmap/PadicHodgeTheory/README.md:682,705,754,894,1071`: §§3.3,3.4,3.6,4.4,5.5; filtered G-functor at 766 and crystalline tensor realization at 1112. Finite-K zero-Sen criterion is distinguished from the declared strict-field gap. |
| Filtered-module suppliers #879/#1312 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4582,4655`: R07.3.1–R07.3.2 names the notation and invariants. `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:240`: §0.2 has general perfect-residue coefficients and the tensor/exact-category/scalar-change API; R07.3.2 explicitly spells out the strict-morphism and abelian-category clauses of that API. |
| VectorBundlesAndIsocrystals #1205 | `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:213,255,279,295`: the four named VB0 interfaces, including q-Frobenius for E=Q_(p^s), positive block rank, algebraically closed residue field, split exact sequences and slope tensor/dual rules. |
| MotivesAndAlgebraicCycles #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1116,1130,1149,1229`: §§6.1–6.3 and 6.8; abstract reconstruction, subquotient criterion, fibre torsors, scalar extension and conjugation. |
| BunGAndNewtonStrata #1241 | `TauCetiRoadmap/BunGAndNewtonStrata/README.md:374,399,450,509,693,1026`: §§1.7–1.9,1.12,1.23,1.43. Exactly s Frobenius factors, integral Kottwitz invariant, dominant decent representative and bounded z-lifting including component-coset surjection. |
| HeckeStacksAndLocalShtukas #1252 | `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1440,1486,1530,1580,1646`: HS2.11–HS2.13,HS2.15–HS2.16. λ=μ⁻¹ conversion and κ=−μ♯ at 1489–1502; classical finite-field points, central comparison and nonemptiness. General transitivity retains finite-level component openness. |
| ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:591,853,2447`: RG2.0.2,RG2.0.4,RG2.1.5; point topology and analytic charts, completed unramified field with infinite transcendence degree, z-extensions. Native point topology now belongs in the pin contract (R03). |
| ArithmeticGaloisRepresentations #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:779,4861`: §§1.1,7.6; continuous representations, closures, scalar extension and image closure. Image compatibility may be applied after algebraic closure and descended; it does not assert surjectivity on Q_p-points. |
| Flag/bundle/rank suppliers #1038/#1069/#853 | `TauCetiRoadmap/ShimuraData/README.md:534` supplies parabolicTypeVariety; `TauCetiRoadmap/AutomorphicBundles/README.md:533` supplies associatedCoefficient; `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:976` supplies rankLocus. A quotient of fixed finite projective rank and the scheme cut out by minors are retained. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:967,996`: §0.8 and etale_coordinates, including smoothness and relative dimension. |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md:1030,1230,1262,1949,2253,4087,4143`: Layers 1,2,3,6,7,10/10B. Read representation/comodule, Lie, subgroup, semisimple-derived, root/Galois and split highest-weight supplies. The quasisplit-orbit classification is not already its split theorem. |
| DiamondsAndVStacks #820 | `TauCetiRoadmap/DiamondsAndVStacks/README.md:1058,5441,7082,8395,9035`: D0.6,D3.10,D5.3,D5.16,D6.5. Compact clopen separation and qcqs finite-stage limits are exactly the restrictions §4.1 uses; no unrestricted quotient-component rule is imported. |
| DeligneWeightsAndPurity #929 | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1092`: §2.2 is specifically Sp(V)(Q_ℓ), not the general smooth-connected-affine statement. It is cited as the special case in Scope. |

Ran the prescribed dependency check:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The current citation resolver found no unresolved roadmap citation or roadmap Lean name; its warning that it could not inspect Lake packages was handled by manually opening the pinned files below. The supplied overlaps file has no conflicting head, dropped cited ID, revision-only ID or lost incoming citation. A fresh overlap query cannot index this unported package by name (“no roadmap PadicHodgeTheoryPartII on main or in an open roadmap pull request”), so its package-specific overlap facts were checked against the provided index and the suppliers read above.

Ownership searches used `roadmaps grep` across main and the 438 indexed open heads for generic filtrations, filtration jumps, full-period degree sums, crystalline/generic monodromy, decent fibre functors, invariant-line criteria, subisocrystals, central lifting and torsor components. Read the closest scopes: `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:5` (#1511) owns two-lattice Hodge structures and bi-analytic Ax–Lindemann; `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:5` (#1843) owns integral tensor-adapted lifts and displays. Neither owns this generic crystalline argument. BunG, Hecke and PadicHodgeTheory are suppliers, with ownership divided as above. Integral generic filtrations in #1843 and Frobenius slope filtrations of differential equations are different objects, not this rational intersection filtration. No same fully qualified declaration can collide: this Lean file declares none.

Read the board package index before searching other packages. AnalyticNumberTheory at #123/head 310e834 owns analytic number theory, and LogicAndDefinabilityInNumberTheory at #164/head 972ee8e owns logic/definability and counting, not these constructions. The third listed board package was unavailable as recorded below; no claim of universal absence is made for it.

Both declared gaps have exactly matching slugs in `design/plan.json` and README lines 53/107, named suppliers and quantified needs. The quasisplit gap is the one orbit-classification/descent extension of split highest-weight theory; Sen openness is a single theorem over algebraically closed residue fields. Neither is unowned, an upward dependency, or a demand to reconstruct an already supplied theorem. Acceptance after repairs can remain conditional on `quasisplit-highest-weights` and `serre-sen-openness`.

### Pinned declarations, headline coverage and Lean validation

Opened the following declarations, rather than relying on the old pins or search-name matches:

- `Mathlib/Algebra/Module/Submodule/Defs.lean:39`: Submodule is closed under addition and scalar multiplication; it asserts no filtration exhaustion or separation.
- `Mathlib/RingTheory/WittVector/Isocrystal.lean:112,179`: Isocrystal is a module with Frobenius-semilinear equivalence, with no finiteness/filtration field. isocrystal_classification requires algebraically closed residue field and finrank=1, and produces an integer-slope standard line.
- `Mathlib/RingTheory/AlgebraicIndependent/Defs.lean:54`: injectivity of polynomial evaluation.
- `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:43,142`: Scheme.Hom.isOpenMap and UniversallyOpen.of_flat, with Flat and LocallyOfFinitePresentation hypotheses.
- `Mathlib/RingTheory/Etale/Field.lean:194`: Algebra.FormallyEtale.iff_exists_algEquiv_prod, requiring EssFiniteType over a field. The quasi-compact étale fibre in §3.1 supplies the finite product; a nonempty fibre excludes the empty product.
- `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean:101`: TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer, with finitely generated defining ideal and equality on every commutative value algebra, including nonreduced ones.
- `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188` and `Tannaka/GroupFunctor.lean:138`: fgPointTensorIsoEquiv and pointsFunctorIsoTensorAutFunctor reconstruct the points of an already given Hopf algebra; they do not construct the filtered crystalline category.
- `TauCeti/Algebra/AlgebraicGroup/Derived/Basic.lean:69`, `Derived/Functoriality.lean:68`, `Derived/Connected.lean:153`, `Isogeny/Basic.lean:78`: the four cited derived/isogeny objects. Connectedness uses an algebraically closed field and finite type; central isogeny means finite faithfully flat with central kernel.
- `TauCeti/Algebra/AlgebraicGroup/Derived/Image.lean:58,81,97,113`: comap_derivedDefiningIdeal_of_injective, derivedMap_injective, mapPointsFunctor_derivedMap_app_surjective and faithfullyFlat_derivedMap; these explain the inventory repair R03.
- `TauCeti/Topology/Algebra/PointTopology/Basic.lean:83,110` and `Group.lean:102`: native topology of algebra-valued points and its topological group instance. These specialize to Q_p; they are not missing.
- `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71` does have a native reductivity predicate. `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` has BDeRhamPlus, and `Mathlib/RingTheory/Grassmannian.lean:185` has the module Grassmannian functor. Neither is the represented reductive flag scheme or the B_dR-affine Grassmannian with admissible locus. The old review's broad claim that Tau Ceti has no reductivity predicate is not reused.

The README lists five headline groups at line 7, and all five appear in the module docstring:

| Headline | Docstring | Remaining obstacle at the actual pins |
|---|---|---|
| Generic admissibility, §2.3 | lines 10–17 | Represented Fl_μ with generic point and filtered G-isocrystals/weak admissibility; not just an ordinary module Grassmannian. |
| Generic derived monodromy, §2.4 | lines 18–22 | The crystalline G-representation of that filtered pair and its period comparison. |
| Open-derived-image period point, §3.2 | lines 23–28 | The B_dR-affine Grassmannian, admissible cell and classical crystalline fibre; rational-point topology itself is present (R03). |
| z-extension comparison, §3.5 | lines 29–31 | Those period cells/fibres for the specified lifted data and their comparison. |
| Compact-image torsor components/stabilizers, §§4.1–4.2 | lines 32–36 | Diamonds and locally profinite torsors over Spd K; describe the open-image hypothesis correctly (R01). |

No statable headline is missing, and no substitute or free Prop predicate is used. The definitions needed to supply these objects would construct period categories and geometry, not a few simple predicates on existing carriers.

Executed the authorized `lake env lean` command on the package's Suggested.lean from the pinned content checkout: **exit 0, no output and no warnings**. It imports Mathlib once and declares nothing. Exhaustive one-tactic padding probe: **0 sorried theorems out of 0**, hence no probe copy or tactic run is applicable. Elaborated-signature comparison: **0 declarations out of 0**, hence no declaration exists on which to issue `#check @name`, and no section binder can be silently lost. No Tau Ceti import required a build. No Lean process remains running.

## Not verifiable

- The published Inventiones version of GLX26 was not opened. The manifest explicitly uses arXiv v3 numbering and pages, which were read; no cited claim depends on published numbering.
- The board index lists LawrenceVenkateshMethod at #345/head 9ee7ac3. A read of `packages/LawrenceVenkateshMethod/README.md` at that head returned HTTP 404. Its board-package ownership could not be compared. The other two indexed board packages and the indexed roadmap heads were searched/read as described above.
- The standalone overlap tool has no entry for this unported package; the supplied package-specific overlaps report, rather than a nonexistent current PR entry, is the available overlap evidence.

All five cited source texts were readable. There is no missing-reference request. No suspicious instruction in the reviewed data was followed.

## Source issues

- **Misprint** in Chen14 at Lemme 3.3.5, p.744: the source describes the underlying object as a sum of Q_(p^s)-lines; it should be a sum of K₀-lines with the indicated coefficient action; affects nothing.
- **Error** in Chen14 at Proposition 3.3.4(2) and Proposition 3.3.6(2), pp.743–745: the source tests only individual mixed tensor powers of one faithful representation; it should allow finite sums as well, or retain all representations as in part (1); affects a stated result.
- **Error** in GLX26 at Proposition 5.7 and equation (5.29), pp.36–38: the source indexes refined weight orbits by automorphisms of the reflex field; it should index all distinct Γ_E-orbits inside the Γ_k-orbit; affects a stated result.
- **Gap** in GLX26 at Proposition 6.7, step (4), p.47: the source treats the lifted crystalline image as lying in the derived group; it should first deduce derived containment of its Zariski closure and then apply Sen openness; affects the proof.

The second item has the concrete witness G=G_m, faithful χ, b=1, μ=0: all individual mixed powers are one-dimensional and impose no restriction, yielding G_m instead of the actual trivial monodromy. README §0.6 avoids this error. For GLX's refined-orbit error, the cubic torus and repeated trivial weight are the explicit numerical witnesses in the table.

Two earlier source diagnoses are not reissued as demonstrated errors. An étale chart over Aⁿ_E can be composed with Aⁿ_E→Aⁿ_Q_p because E/Q_p is finite separable; GLX Lemma 5.10's Q_p base is therefore not itself a misprint. For the full-versus-neutral monodromy terminology, Chen14 Definition 3.2.2 and GLX26 Definition 5.1 differ, but that alone does not prove their crystalline groups differ in this strict-field setting. The package's explicit full-group construction and ambient comparison are valid without requiring such an erratum.
