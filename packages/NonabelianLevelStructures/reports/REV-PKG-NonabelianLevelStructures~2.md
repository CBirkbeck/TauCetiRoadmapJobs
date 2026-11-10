# Review of NonabelianLevelStructures (package, round 2)

**Verdict:** needs changes

Nine findings: six blocking (P1/P2), three P3. The two Lean headlines elaborate and survive every padding probe. The mathematical congruences tested agree with the sources; the blockers concern an unowned proof input, duplicated ownership, and false ancillary assertions. No package source file was edited.

## R01 (P1) — The truth of CFSG has no supplier

**Location:** `packages/NonabelianLevelStructures/README.md:48`, also lines 118, 618 and 626: “§4.2 uses its truth to pass from the listed groups to every finite simple group.”

**Claim:** The listed-group Vdovin contract plus the pinned declaration supplies the unconditional theorem for arbitrary finite simple groups.

**Witness:** `TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean:54` defines a proposition; line 67 requires a proof of it. `TauCetiRoadmap/CFSGStatement/README.md:10` explicitly ends at its definition, not its proof. CFSGBasicProperties A0 only treats listed groups.

**Repair:** Keep the unconditional headline, but obtain a declared contract for the full Vdovin theorem for every nonabelian finite simple group outside PSL₂, including the passage from arbitrary simple groups to the list. One concrete repair is to expand `gap:vdovin-abelian-subgroups` in both README and the plan's gaps list to that full statement, with CFSGBasicProperties explicitly responsible for this additional input. Remove the claim that a proposition-valued definition supplies its truth. Alternatively name an actual earlier owner of the required classification theorem; none was found among the permitted suppliers. Merely adding an assumption of CFSG to the headline would narrow the promised theorem.

**Repair test:** The expanded contract must apply directly to an arbitrary `G` satisfying the Lean binders, without an additional classification witness. On the explicit A₇ instance below it yields divisor 7 and orbit size 42. F07's citation repair is correct; this is the separate ownership defect exposed by its new explanation, not a request to undo that repair.

## R02 (P2) — ArithmeticDynamicsPartII already owns two constructions

**Location:** `packages/NonabelianLevelStructures/README.md:203` and `:773`, with the ownership claim at line 7: “For an odd prime p and t = −2 both loci equal the punctured Markoff surface”.

**Claim:** This roadmap constructs the quotient-cover map and proves the prime-field epimorphic specialization as its own targets.

**Witness:** Open pull request #1686, `TauCetiRoadmap/ArithmeticDynamicsPartII/README.md:776`, constructs the quotient-cover map and compactification compatibility; line 810 explicitly proves the prime-field trace −2 epimorphic equality, including the empty p=3 case.

**Repair:** Import the epimorphic equality and its finite-field dictionary from ArithmeticDynamicsPartII §6.1; delete the duplicated theorem/proof target in §6.1 and update consumers to the supplier. In §0.5 consume the already constructed quotient-cover map from §6.0, retaining only additional properties not supplied there (in particular the stated surjectivity and precise proper/quasi-finite assertion, with the Gaschütz input). Update Scope and ownership and the supplier contract. Do not reverse the dependency.

**Repair test:** The imported specialization gives 40 points at p=5 and zero at p=3, exactly the recomputed values. The supplier's quotient example C₂→1 has coarse degrees 3→1, so no new map is required for the retained refinement.

## R03 (P1) — Even sign changes do not always enlarge the trace group

**Location:** `packages/NonabelianLevelStructures/README.md:655`: “also contains the even sign changes and is strictly larger.” The paragraph is quantified over every commutative ring.

**Claim:** Adjoining even sign changes strictly enlarges the polynomial action over every coefficient ring.

**Witness:** Over 𝔽₂, −x=x as polynomials. All three even sign changes are the identity, so adjoining them leaves the group unchanged. This also holds over every characteristic-two ring, including 𝔽₂[ε]/(ε²).

**Repair:** State the comparison uniformly as generation by the Vieta moves, permutations and even sign changes, without universal strictness. If strictness over ℤ is wanted, state it separately with its proof/source. Add the characteristic-two equality as a negative-control Check. The anti-action formulas remain unchanged.

**Repair test:** On (1,1,1) over 𝔽₂, (−x,−y,z)=(1,1,1); over ℤ it is (−1,−1,1). The revised statement accommodates both values.

## R04 (P1) — The ramification divisor is confused with the marking at unramified origins

**Location:** `packages/NonabelianLevelStructures/README.md:132`: “the reduced ramification divisor R_π is the marking”; also line 472's identification with a point of that divisor and line 545's unqualified geometric interpretation.

**Claim:** The marking always equals R_π, and every cusp stabilizer intersection is realized at a point of R_π.

**Witness:** G=1 and the identity nodal elliptic cover: the marking is the origin (one point), R_π=∅ (zero points), and A∩⟨[1,1]⟩=1. There is no point of R_π realizing that group. Section 0.1's own Checks give this distinction.

**Repair:** Say that R_π equals the marking over a ramified origin, whereas at an unramified origin the marking is the whole origin fibre and R_π is empty. In §§2.3 and 3.2 restrict the identification with a point of R_π to nontrivial inertia, retaining the stabilizer-of-an-origin-point formula for all pairs. Keep the definitions and congruence at c=1.

**Repair test:** G=1 now gives marking degree 1, ramification degree 0, stabilizer order 1, and congruence modulus 1. For S₃ with inertia order 3 the marking and R_π both have degree 2, so the ramified identification is preserved.

## R05 (P1) — Embeddings preserve the periods of existing points

**Location:** `packages/NonabelianLevelStructures/README.md:810`: “Formation of the slice and of L_a commutes with finite-field embeddings; orbit lengths need not.”

**Claim:** A finite-field embedding can change the rotation length of a point carried along that embedding.

**Witness:** For an embedding i, i(L_aⁿP)=L_i(a)ⁿi(P); injectivity gives L_aⁿP=P iff L_i(a)ⁿi(P)=i(P). Thus the complete sets of return times, and their least positive members, coincide.

**Repair:** Replace the final clause by: the embedding preserves the period of every embedded point; the larger field can add points and split a previously nonsplit conic. Add a Check distinguishing these assertions.

**Repair test:** At a=0,t=−2 over 𝔽₅, (y,z)=(1,2) has orbit (1,2),(2,4),(4,3),(3,1), of length 4. The same four distinct pairs form its orbit over 𝔽₂₅. A nonsplit conic can acquire new points without changing any old period.

## R06 (P2) — The rotation proof incorrectly removes eigenline points

**Location:** `packages/NonabelianLevelStructures/README.md:824`: “the conic equation with (y, z) ≠ (0, 0) excludes the eigenlines in the degenerate slices”.

**Claim:** The non-dihedral condition removes the eigenlines in a split degenerate slice, allowing the proof to consider only vectors with two nonzero eigencoordinates.

**Witness:** Over 𝔽₇ take a=1,t=6,P=(1,1,3). Its conic value is 1+9−3=0; all coordinates are nonzero; L₁(1,3)=(3,2)=3(1,3). It is an allowed eigenvector. Its period is 6.

**Repair:** Retain these points. For inverse distinct eigenvalues λ,λ⁻¹, either nonzero eigencoordinate already forces period ord(λ)=ord(λ⁻¹). Thus every nonzero vector has that period, including eigenline vectors. Keep the separate Jordan argument. Add the displayed example. CHEN2024 line 4296 uses precisely freeness on the whole punctured plane.

**Repair test:** The six vectors are (1,3),(3,2),(2,6),(6,4),(4,5),(5,1). Their period equals ord₇(3)=6. The exact-rotation theorem itself passed all 334 slice tests.

## R07 (P3) — The mapping-class supplier locator is obsolete

**Location:** `packages/NonabelianLevelStructures/README.md:102`, also lines 17, 186 and 263 and the two corresponding gap sections in `design/plan.json`: “C.0/moduli-monodromy”.

**Claim:** This is the locator of the supplier's orbifold identification in its package README.

**Witness:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:864` is §2.3, “Teichmüller uniformization of the pointed moduli stack”; lines 872 and 887 give the general identification and genus-one witness. C.0 occurs in its design, not its package README.

**Repair:** Repoint the direct citations and the two gaps' section/detail fields to §2.3, retaining the gap slugs and their genuinely additional Nielsen/Asada requirements. The existing genus-one orbifold identification is supplied; its absence is not alleged.

**Repair test:** The resolved section gives T(1,1)=ℍ, orbifold group SL₂(ℤ), and generic stabilizer of order 2, as §0.3 needs. No new supplier edge is introduced.

## R08 (P3) — The new Belyi ownership caveat is stale on main

**Location:** `packages/NonabelianLevelStructures/README.md:17` and `:114`: “BelyiMaps assigns that layer to a successor roadmap”.

**Claim:** The current main-branch BelyiMaps disowns Layer 10.

**Witness:** `TauCetiRoadmap/BelyiMaps/README.md:3903` develops Layer 10 itself; §10.4 at line 4115 states the existence theorem and cites its pinned implementation. The successor banner is absent from this main-branch file.

**Repair:** Delete both successor caveats. Retain the geometric citation to BelyiMaps §10.4, and record its pinned function-field input if used: `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair`, `TauCeti/FieldTheory/FunctionField/Belyi/Existence.lean:163`, for a function field with exact constants over a field algebraic over ℚ. Do not request a missing successor or recreate Belyi's theorem.

**Repair test:** For the function field of P¹ over ℚ̄ the input has exact constants and yields a Belyi map; the identity has branch set ∅⊆{0,1,∞}. F09 was repaired as requested against the older main; the added caveat no longer describes the supplied main.

## R09 (P3) — A coarse level point retains more than j

**Location:** `packages/NonabelianLevelStructures/README.md:925`: “A K-point of the coarse curve records only j”.

**Claim:** A coarse point of a level curve carries no information beyond its image on the j-line.

**Witness:** At p=13, §7.1 gives a degree-208 coarse level component. Above j=1 it has 208 distinct geometric points; after a finite number-field extension they are rational and share the same j. The coarse curve therefore distinguishes them.

**Repair:** Say instead that the map to the j-line forgets the level information and that distinct quadratic twists of an elliptic curve have the same j. The finiteness conclusion remains about the image of the finite set of level-curve rational points.

**Repair test:** Above j=1 the repaired statement allows 208 level points with one image. For an elliptic curve with j≠0,1728, distinct square classes still give distinct quadratic twists with that same image.

## Verified sound

### Finding-by-finding check of the previous repair

The previous review and repair report were read first. All eleven requested edits were made. “Repaired” below refers to the original issue; new defects or later supplier changes are identified separately.

| Earlier finding | Repaired passage | Status and independent check |
| --- | --- | --- |
| F01 | §5.2: “Chen displays the map with an injective arrow, but it is not injective” | Repaired. CHEN2024 lines 3847–3848 already say anti-homomorphism and display the hooked arrow. Inner conjugation and simultaneous inversion fix the traces. R03 concerns a different assertion in this changed paragraph. |
| F02 | §6.1: “absolute irreducibility is equivalent to commutator trace different from 2, not equal to 2” | Repaired. CHEN2024 line 4052 has the equality slip; Lemma 5.2.9 at line 3896 gives the unit criterion. |
| F03 | line 58: “exterior epimorphisms as the classes of surjections F_r → G modulo inner automorphisms of G” | Repaired. No claimed `ExteriorEpi` declaration remains; #850 §IG.3.2 supplies the prose object. |
| F04 | line 110 and §7.4: `mordell_finite` | Repaired. HeightsRationalPointsAndObstructions §4.6, README line 2054 at its head, names that theorem with genus≥2 and smooth projective geometrically connected hypotheses. |
| F05 | line 92: “§2.1, ‘Coarse parameter quotients’” and “§3.8, ‘Trace and excursion character comparison’” | Repaired. Both headings resolve at #1202, lines 562 and 886. Their field/characteristic restrictions are not silently used for integral invariants: the separate gap remains. |
| F06 | line 78: “§8.3, ‘Exact completion and tangent interfaces’” | Repaired. §0.4 no longer cites §8.2 for smoothing. SchemeAndStackFoundations §4.6 supplies the node hull; the equivariant extension remains an explicit gap. |
| F07 | line 48: “it is a Prop-valued definition, not a theorem” | Repaired as a citation. The definition and universe transport are at the pin, lines 54 and 67. R01 records the unowned proof input rather than repeating the old naming error. |
| F08 | line 25: “the same action as the left action e ↦ e ∘ α⁻¹” | Repaired. #850 README lines 2808–2813 gives this convention; inversion permutes Aut⁺, so both orbit sets agree. |
| F09 | line 17: “that roadmap assigns the layer to a successor roadmap” | Partly repaired: the requested caveat was inserted, but it is false against the current main. R08 gives the current witness and repair. |
| F10 | §3.2: “m′_c = 4, the least common multiple of the element orders 1, 2, 4” | Repaired. Independently enumerated all 96 relevant D₁₆ pairs: intersection orders {2,4}, m′=4, d′=2. The prior review's computed SL₂(𝔽₅) row supports the retained {±1} statement. |
| F11 | Lean line 120: `{G : Type u}`; line 122: `∀ (K : Type u)` | Repaired. Fresh elaboration and all nine `#check @…` signatures confirm the universe widening and no lost section hypotheses. |

Pattern searches found no remaining old `ExteriorEpi`, `finite_rationalPoints`, LP2 labels or smoothing citation to §8.2 in this package. The same current-supplier search found R07 and R08. No prior finding was marked “not actionable in this package”; none is being reopened on that basis.

### Principles, shape and acceptance-file audit

Read all 47 numbered sections, their API bullets, Checks and proof routes, all 47 target Needs lines, and eight layer dependency lists. The earlier adversarial table was used only for its actual computed instances, particularly the unchanged finite-group enumerations; its prose-only summaries were not treated as evidence of a full pass. The changed passages and the seeded sample were checked afresh.

The package retains general finite groups, all finite fields, and arbitrary commutative coefficient rings where promised. In particular the j=0 restriction in §4.1 does not discard the general-j congruence: that theorem is explicitly imported from ArithmeticDynamicsPartII §6.0. No algorithm is an endpoint; finite enumerations are examples and checks. No copied source passage, sorry-valued data, `set_option`, forbidden import or `lemma` declaration was found. The organization uses the mathematical progression from covers to cusps, stabilizers, obstructions and trace geometry; it does not name a source chapter as a layer or mandate a source's exposition. R01 and R02 prevent a clean ownership/principles verdict.

The README has the required introductory sections and eight layers, each with Examples and Dependencies. Its 17 explicit defining-API blocks have respectively 4,3,4,4,3,3,3,3,3,5,6,3,4,4,3,3,3 Checks. Each numbered target has hypotheses, a source locator and its own Needs line. I compared the upstream forms in StableReduction, SchemeAndStackFoundations and CFSGStatement on main. No machine paths, pull-request numbers, job identifiers, LaTeX delimiters or process narrative occur in the package text. The defects in individual assertions/Checks are R03–R06 and R09.

`Suggested.lean` has seven definitions with real bodies and two headline theorems, one `import Mathlib`, and no Tau Ceti imports. The definitions use native groups, permutations, orbit quotients, finite lcm and cardinalities. All nine own backticked names in the README are declared, and all nine declarations appear in the README. There are no admitted examples or API-theorem fillers.

Fresh `lake env lean` from the pinned content checkout succeeded with exactly two warnings, both `declaration uses sorry`, at lines 106 and 120. A scratch copy with `#check @name` for every declaration elaborated: finite-group assumptions, generation, prime, nonabelianness, PSL₂ exclusion and size bound are retained. `(r+1)/2` is the intended ceiling and `(ℓ^(r+1))^3` is the stated cubic threshold. Nothing was changed in the package to obtain this result.

Every sorried theorem was tested with `simp`, `rfl`, `infer_instance` and `exact Nat.one_dvd _` on copies. All eight attempts failed: simp made no progress, rfl did not identify the two sides, the goals were not typeclasses, and `one_dvd` had the wrong divisor. No padding finding. Native primitive/Nielsen automorphisms do not prove either orbit congruence.

The summary's headline coverage is:

| Headline | Acceptance-file coverage |
| --- | --- |
| Combinatorial congruence | `combinatorial_congruence`, line 106; faithful finite-group signature. |
| Simple-group congruence | `simple_group_congruence`, line 120; faithful signature, but the proof ownership is R01. |
| Cusp classification and vertical automorphism groups | Named in docstring; admissible stack, cusp fibre and its automorphism groupoid missing. |
| Representability criterion | Named in docstring; rigidification and morphisms of stacks missing. |
| Two Markoff components, their degree and genus | Named in docstring; level stack/coarse level curve missing. |
| Finiteness of j-invariants | Named in docstring; the particular coarse curve and its rational points missing. |
| Large projective monodromy and noncongruence | Named in docstring; geometric level-cover monodromy and its Out⁺–SL₂ comparison missing. |
| Cofinality | Named in docstring; étale fundamental group of the elliptic moduli stack missing. |
| Integral character-coordinate isomorphism | Named in docstring; group-scheme coaction and the specific invariant coordinate ring missing. |

No statable summary headline was replaced by a stand-in or omitted. The file does not try to construct missing moduli machinery just to state a substitute.

### Adversarial mathematics: computed values

The table includes every seeded target, both Lean headlines, all finding targets, the changed mathematical passages and additional targets not covered numerically in the first review. Related identities sharing one construction are grouped to keep the report within the comment limit. “Inherited” explicitly identifies the earlier review's numerical evidence; all other numerical values below were recomputed in this round, by hand or by the independent scratch scripts.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions; §5.2 anti-action | r,t at (2,3,5) | r then t=(2,1,3); t then r=(2,5,7); γ₋ᵢ preserves all three traces | Correct direction; F01/F08 repaired. |
| Fricke normalization | upper/lower unit unipotents; identity pair | 4+4+9−12−2=3=tr[A,B]; identity gives 4+4+4−8−2=2 | Correct, including reduction mod 2. |
| §0.1 divisor, marking, monodromy bound | G=1 over dual numbers; S₃ inertia C₃; D₁₀ rotation | marking/R degrees 1/0; S₃ degree=6/3=2; dihedral centralizer quotient=1 versus normalizer quotient=2 | Geometric formulas correct after R04's distinction. |
| §0.2 Higman invariant and strata | C₂; S₃ transpositions; trace −2 over 𝔽₇ | inertia orders 1,3; −I+E₁₂ has inverse −I−E₁₂; coefficient ratio −1=6 is nonsquare in 𝔽₇ | Peripheral inversion can exchange strata; root-power convention correct. |
| §0.3 coarse branch quotient | C₁,C₂,C₃ | exterior/coarse sizes 1/1,3/3,8/4; inversion fixes C₂ pairs and fixes no nonzero C₃ pair | Correct; generic stabilizer not lost. |
| §0.4 local deformation | r=1,2; C₂³ | module ranks of Λ[[t]] over Λ[[T]] are 1,2; at r=2 derivative at t=0 is 0; a two-generator subgroup of C₂³ has size≤4<8 | Dense smooth locus and generation obstruction consistent; gaps retained. |
| §0.5 quotient functor | identity; C₂→1; C₂↪C₂² | image orders 2,1,2<4; coarse degrees 3→1 for the surjection | Extra properties meaningful, but construction belongs upstream (R02). |
| §0.6 outer quotient | C₂; SL₂(𝔽₇) | Out(C₂)=1 so degree remains 3; nonsquare determinant exchanges the two noncentral trace −2 classes | A single unstable stratum cannot be quotiented alone. |
| §0.7 cofinality; Belyi input | P¹ and its punctured open | identity map has degree 1 and branch set ∅; U=P¹ minus three points has three omitted points; a finite image of an affine curve is affine, so cannot be all P¹ | Open target essential; BBCL proof read. R08 is a stale ownership caveat. |
| §§1.1–1.2 gluing and normalization | C₁; C₂ polygon; ramified node of index 2 | trivial graph V=E=1; C₂ graph V=E=2; node fibre basis 1,ξ,η has length 3 against generic degree 2 | Reduced fibres, loops and absence of flatness are correct. |
| §1.3 finite data | C₁; F=S₃ with inertia C₃; wrong H-coset model H=C₂ | torsor sizes 1,6; inertia orbit count 6/3=2; wrong fibre size 6/2=3≠6 | Free transitivity excludes the wrong model. Changing x to xg gives g⁻¹φg. |
| §1.4 graph | C₁; C₂,u=1; C₂²,u=1,h≠1 | Betti numbers 1−1+1=1 and 2−2+1=1; last generated subgroup has size2<4, graph has 2 connected components | Connectedness criterion and half-edge convention pass. |
| §§1.5–1.7 balance, invariant set, standard cusp | C₂ and C₃, u=1; S₃ u=(123),h=(12) | h⁻¹u⁻¹h=u for S₃; M=C₃ gives index2; cyclic u=1 gives M=1 and 2/3 polygon components; I(C₂)=2,I(C₃)=4 | Correct. I counts also agree with inherited explicit enumeration. |
| §1.8 cusp classification/Higman word | S₃ u=(123),h=(12) | [u,h]=(132), [u⁻¹,h⁻¹]=(123), conjugation by uh=(13) sends latter to former | Word and direction correct. C₁ gives one cusp, C₂ two, both Higman 1. |
| §1.9 inversion | C₃,u=1,h generator; C₂ | C₃ sends [[1,h]] to distinct [[1,h²]]; C₂ inverse equals itself | Lift criterion excludes the C₃ example and permits C₂. |
| §§2.1–2.3 cusp automorphisms | S₃ rotation/reflection; abelian C₃ | (|Z|,|u|,k,|A|)=(1,3,1,3),(3,1,1,3); image/kernel sizes 3/1 and 1/3 | |A|=|Z||u|/k; marked-divisor interpretation needs R04. |
| §2.4 full-level comparison | n=2,3 | |SL₂(𝔽₂)|=6, −I=I; n=3 gives |SL₂(𝔽₃)|/2=24/2=12 and φ(3)=2 components | Correct exceptional stabilizer; n≥3 matters. |
| §2.5 dihedral obstruction | D₁₀ | |c|=5,m′=5,d′=1, divisor=5/gcd(5,5)=1; inherited two orbits each of size3 | Correct, including correction of source d′. |
| §3.1 positive Nielsen orbits | C₂,C₃; nonabelian S₃ | raw C₂ orbit=3, coarse=3; raw C₃ orbit=8, coarse=4; inherited S₃ coarse orbit=3 | Real permutation bodies have the required multiplication order. |
| §3.1 commutator transport | S₃ u=(123),v=(12) | [u,uv]=(132)=u[u,v]u⁻¹; [vu,v]=(123)=v[u,v]v⁻¹ | Positive moves preserve the conjugacy class, not the literal word. |
| §3.2 repaired D₁₆ Check | all 96 pairs with commutator conjugate to ρ² | (ρ,σ): A=⟨ρ⟩, intersection=⟨ρ²⟩ size4; (σ,σρ): A=intersection={1,ρ⁴} size2; all intersection sizes {2,4}; lcm=4, product=8; d′=8/4=2 | F10 repaired and discriminating. |
| §3.2 empty family and total operations | C₃,c=h; C₁,c=1 | empty lcm=1; d′(h)=3/3=1; trivial group m′=d′=1; every finite element order≥1 | No division by zero in headlines; empty-family convention is meaningful. |
| §3.3 combinatorial headline | inherited S₄ and SL₂(𝔽₅); fresh A₇ example | S₄: divisor3, orbit9; SL₂(𝔽₅): divisors5,3 and orbits40,72; A₇ c of order7 has centralizer7, m′=1 by §4.1, divisor7, orbit42 | 9=3·3,40=5·8,72=3·24,42=7·6. |
| §4.1 square subgroups | SL₂(𝔽₅),ℓ=5; D₁₀,ℓ=5 | r=1,s=0,k=v₅(2)=0 gives 0≤0; D₁₀ has k=1 but normal C₅ of order5 and no subgroup of order25 | Normal-subgroup hypothesis excludes the counterexample. |
| §4.2 simple-group headline | A₇, ℓ=7 and 17; A₅ exclusion | |A₇|=2520≤7⁶=117649; r=1 gives divisor7, orbit42; at ℓ=17, r=0, divisor1 and 2520≤4913. A₅ has abelian subgroup order5 with 125>60 | Numerical theorem passes. The general proof contract remains incomplete (R01). |
| §5.1 invariant quotient | (I,I),(unipotent,I); ℤ→𝔽₂; zero ring | both triples=(2,2,2) despite different conjugacy classes; reductions=(0,0,0); zero-ring coordinate algebras both zero | Quotient is not a classification of all orbits; no division by2. |
| §5.2 strict enlargement | 𝔽₂ and 𝔽₂[ε]/ε² | −1=1, so each even-sign map=id and enlarged group=original group | R03. |
| §5.3 matrix algebra | I,I; unit off-diagonals; off-diagonals 2 and1 | Fricke-minus2 values 0,1,4; generated algebras respectively scalars, full matrices, and index4 integral lattice; over ℚ last becomes full | Unit criterion works over rings; zero ring has 0=1 and the full zero algebra on both sides. |
| §5.4 trace strata | diag(3,4) over 𝔽₁₁; noncentral trace−2; char2 | order5; trace7; square diag(9,5) trace3; inverse trace7. Odd-p negative unipotent order2p; char2 gives −2=2=0 | Root-power clause is necessary. |
| §5.5 admissible traces | inherited q=2,3,5,7 enumeration | sets {1},{0},{1,3},{3,4,5,6}; example over 𝔽₅ has traces(0,2,3) and 11 mod5=1, generated order120 | Matches source exceptional list. |
| §5.6 diagonal outer group | q=4,5 | gcd(2,3)=1; gcd(2,4)=2; for q=5 N/C=PGL₂(5) has120 elements whereas N/(G·C) has2 | Correct quotient; inner subgroup has60 elements. |
| §5.7 normalizer | n=1; q=2,n=2 over 𝔽₄ | scalar conjugation fixes all matrices; diag(ω,1) sends upper unit entry1 to ω≠1 | Scalars included, nonrational nonscalar example excluded. |
| §6.1 prime epimorphic locus | p=2,3,5 | p=2 punctured zero-level has4 points but epimorphic trace0 locus empty; p=3 has0; p=5 has40 | Correct range; prime-field theorem duplicated upstream (R02). |
| §6.2 branch cycles | X*(𝔽₅) and eight further primes | at5 cycles=(14,20,8); γ∞γ₁₇₂₈γ₀ fixes every point; (3,3,3)→(3,3,6) | Correct signs/order and ramification interpretation. |
| §6.3 slice equation | p=5,(a,t)=(1,4),(0,3),(2,3); 𝔽₄ | conic counts1,9,10; polynomial X²+aX+1 at 0,1,a,a² gives1,a,1,a, so no root; matrix order5 | Characteristic-two irreducibility must not use a square-discriminant test. |
| §6.3 embedding compatibility | 𝔽₅↪𝔽₂₅, P=(0,1,2) | old/new return times are both4ℕ; four orbit vectors in R05 | Period claim corrected by R05. |
| §6.4 exact rotation/eigenline proof | 𝔽₇,a=1,t=6,P=(1,1,3) | conic value0, eigenvalue3, eigenvector period6=ord₇(3) | The theorem survives; its proof needs R06. |
| §6.5 every slice at small odd fields | all t≠2 and all a for q=3,5,7,11,13 | 6+20+42+110+156=334 slices; actual counts equal 0/2q, q−1/2q−1, q+1/1 according to case; every non-dihedral cycle length equals ord(L_a) | Zero mismatches; split degenerate eigenline points included. |
| §6.5 characteristic two | q=4,a=0,t=1 | y+z=1 gives4 points; swap has2 cycles of length2; no fixed point since y=z would give0=1 | Correct repeated-root case. |
| §6.6 vertical groups | traces3 and6 over 𝔽₇; D₁₀≤SL₂(4) | trace3 companion has order8, scalar intersection size2; trace6 roots2,4 have order3, intersection size1; dihedral cusp A size5 versus center1 | Non-dihedral hypothesis necessary. |
| §§7.1–7.3 components, counts, genus | p=5,7,11,13,17,19,23,29,31 | D=40,28,88,208,340,304,460,928,868; cycles=(14,20,8),(10,15,5),(30,44,14),(70,104,26),(114,171,37),(102,152,34),(154,231,41),(310,464,86),(290,435,69); both genus computations=0,0,1,5,10,9,18,35,38 | All nine table rows reproduced; positive branch generators transitive in all nine. |
| §7.2 fixed points | same primes | γ₀ fixed triple=(3,3,6) modp; c₀=(D+2)/3; c₁₇₂₈=(D+f_p)/2, f₅=0,f₇=2 | Source numerator D−3 fails at5; roadmap correct. |
| §7.3 lower bound | p=2304 threshold; inherited primes13≤p<2304 | p²/12=4p^(3/2) at threshold; each half-term sum<3p^(3/2), leaving >p^(3/2)+p/2>2; prior exact minimum5 at13 over337 primes | Bound coherent; no natural-subtraction junk. |
| §7.4 coarse points | p=13, nonbranch j=1 | 208 geometric coarse points map to1 j-value; genus5≥2; quadratic twists retain j | Finiteness route correct; Check corrected by R09. |
| §7.5 projective quotient | same nine primes | sign-block sizes all4; |Y*|=10,7,22,52,85,76,115,232,217=D/4 | Freeness and degree formula correct; origin would have orbit size1. |
| §7.6 monodromy parity | same nine primes | branch parities at5,7,11,23=(0,1,1), at13,17,19,29,31=(0,0,0); p=7 root order8<32√8 | Matches residue rule; full symbolic parity proof read in BBCL22 §3.3. |
| §7.7 composition factors | n=1,6,25 | orders1,6·24=144,125·120=15000; first two solvable; at25 the only nonabelian factor has order60=|PSL₂(5)| | CRT and prime-power kernel route correct; no PSL₂ over extension fields added. |
| §7.8 noncongruence | d=5,6,10 | 5!=120=5(25−1) is exceptional; 6!=720>6³=216; 10!=3628800>10³=1000 | Factorial obstruction valid for actual d≥10. |

For the fresh A₇ test, the permutations on {0,…,6} have image tuples u=(1,2,3,4,5,6,0) and v=(0,2,1,4,6,3,5). Their generated subgroup has 2520 elements; their commutator has image tuple (6,3,1,0,2,4,5), of order7. Simultaneous-conjugacy representatives followed by the inversion quotient and the two positive transvections give exactly 42 classes. The PSL₂ exclusion is consistent with orders: odd q gives values 2448 at17 and3420 at19; even q jumps from504 at8 to4080 at16, never2520. The table tests a non-boundary case of the headline rather than only its divisor-one case.

### Sources: seeded sample and repaired passages

All locators below were checked in the supplied line-numbered legal cache. CHEN2024 is the published author copy, whose printed page is extraction-page number plus 300. No manifest entry is flagged unverified; ASADA2001 and VDOVIN1999 are settled uncertified entries and were not requested again. All six cited works already have exactly one manifest key, including their preprint/published-version notes. No source fetch or manifest change was necessary.

| Sampled target | Locator read and source evidence | Outcome |
| --- | --- | --- |
| §0.2 Higman invariant/strata | CHEN2024 lines 1070–1094, Definition 2.3.1 and Proposition 2.3.2, p.327; lines 1101–1133, Remark 2.3.3 and Definition 2.3.4, p.328; Situation 2.5.14, lines 1821–1837, p.346 | Faithful cotangent character, primitive root choice, local constancy and [b,a] orientation agree. Coprime powers change the generator, not necessarily its class. |
| §1.8 cusp classification | CHEN2024 lines 3139–3154, Theorem 4.8.4/Definition 4.8.5, p.379; lines 3178–3200, Proposition 4.8.6, p.380 | Isomorphism classes, good path and the commutator word all agree; no equivalence with a discrete automorphism groupoid is claimed. |
| §3.1 positive Nielsen orbits | CHEN2024 lines 184–195, §1.1, p.305; lines 3440–3446 and 3473–3477, after Theorem 4.10.5 and footnote 28, p.387 | Correct outer and central-inversion quotients; the precise later statement supports the package. The introductory coarse-degree sentence has the source error recorded below. |
| §4.1 square subgroup | CHEN2024 lines 3540–3568, Lemmas 4.12.1–4.12.2, pp.389–390; lines 3577–3584, Corollary 4.12.4(a), p.390 | j=0 direct-product argument valid; package does not copy the invalid powering argument for j>0. General-j degree result is imported separately. |
| §4.2 simple-group congruence | CHEN2024 lines 3573–3593, Theorem 4.12.3/Corollary 4.12.4(b), p.390; lines 3599–3615, Corollary 4.12.5(b), p.391 | Exact PSL₂ exclusion, nonabelianness, threshold and ceiling agree. Source mathematics supports the theorem; R01 is missing formal ownership of an input. VDOVIN1999 remains uncertified. |
| §5.2 polynomial outer action | CHEN2024 lines 3824–3859, Proposition 5.2.5, pp.396–397 | Anti-action and generators checked; corrected noninjectivity supported. The source does not supply the package's universal strict-enlargement claim (R03). |
| §5.4 trace strata | CHEN2024 lines 3651–3664, Definition 5.1.1, p.392 | Fixed roots and union of Higman strata agree; trace invariance under inversion checked separately. |
| §6.2 trace branch cycles | CHEN2024 lines 4097–4139, Proposition 5.2.20, pp.403–404; lines 4148–4154, Remark 5.2.21, p.404 | Three formulas and cycle/ramification dictionary agree. The package correctly imposes non-dihedrality, missing from the displayed source proposition. The even-field extension uses the supplied finite-field trace dictionary and polynomial identities; it does not rely on the source's opening p≥3 clause alone. |
| §6.3 arbitrary-level slices | CHEN2024 lines 4232–4259, proof of Lemma 5.3.1, pp.406–407 | Equation and matrix exact. The embedding-period exception is the package's false addition (R05). |
| §6.5 split/nonsplit/parabolic | CHEN2024 lines 4267–4389, proof of Lemma 5.3.1, pp.407–409 | Full conic counts and even-characteristic swap verified; nonsplit degenerate fibre correctly repaired to one point. Source's split proof covers eigenlines, unlike the package's §6.4 route (R06). |
| §7.1 two Markoff components | CHEN2024 lines 4645–4662, Theorem 5.5.7, p.416; lines 4710–4726, opening §5.6, p.417; lines 4763–4765, Theorem 5.6.3, p.418 | Conditional transitivity and two-copy geometry agree, with p≥5 preventing the empty p=3 case. |
| §7.2 branch/cusp counts | CHEN2024 lines 4730–4761, Propositions 5.6.1–5.6.2, p.418 | Corrected c₀ count; f_p and divisor sum match direct cycle counts. |
| §7.3 genus | CHEN2024 lines 4763–4787, Theorem 5.6.3/proof, pp.418–419; lines 4788–4798, Theorem 5.6.4/proof, p.419 | All four residue constants and lower-bound route agree; nine numerical genus values independently recomputed. |
| §7.5 projective quotient | CHEN2024 lines 4812–4855, §5.6.2/Theorem 5.6.6, pp.419–420 | Central lifting, free even-sign action and D/4 quotient degree agree for p≥5. |
| §7.7 congruence factors | CHEN2024 lines 4866–4875, proof of Corollary 5.6.8, p.421 | CRT, quotient monodromy and prime-field PSL₂ composition factors agree. |

Also read the two headline congruences at CHEN2024 lines 3429–3468; integral trace theorem at lines 3786–3812 and Appendix 6.2 lines 5131–5159; repaired irreducibility slip at lines 4037–4059; CHEN2018 Theorem 4.2.2, lines 1386–1396; BBCL22 Theorem 2.2.3 and its actual quotient construction, lines 612–649; MP18 Theorems 1.3–1.4, lines 90–103. For the parity rule not fully read last round, BBCL22 Proposition 3.3.2, Proposition 3.3.3 and Corollary 3.3.4, lines 1317–1361, give the fixed-point counts and the mod-16 calculation. The connected level component, its coarse curve and a suitable open of the projective quotient are distinguished in the cofinality application.

### Library and cross-roadmap ownership

The pinned declarations were inspected, not inferred from near-match search results. The following are the principal concrete pin witnesses; paths in this table are library-relative.

| Object / declaration | File and line at the pin; what was checked |
| --- | --- |
| `commutatorElement` | `Mathlib/Algebra/Group/Commutator.lean:28`: xyx⁻¹y⁻¹ convention. |
| `Equiv.prodShear`, `Equiv.prodComm` | `Mathlib/Logic/Equiv/Prod.lean:300` and `:84`: dependent shear and coordinate swap, giving the stated pair permutations. |
| `Equiv.mulLeft`, `Equiv.inv` | `Mathlib/Algebra/Group/Units/Equiv.lean:99`; `Mathlib/Algebra/Group/Equiv/Basic.lean:242`: left multiplication and pointwise inversion. |
| `MulAction.toPermHom`, product action | `Mathlib/Algebra/Group/Action/End.lean:184`; `Mathlib/Algebra/Group/Action/Prod.lean:88`: action on both coordinates. |
| `MulAction.orbit`, `orbitRel`, quotient | `Mathlib/GroupTheory/GroupAction/Defs.lean:49`, `:287`, `:349`: range of the orbit map, same-orbit relation and quotient. No automatic global transitivity. |
| `Subgroup.centralizer`, `Subgroup.zpowers`, `IsConj` | `Mathlib/GroupTheory/Subgroup/Centralizer.lean:30` and `:35`; `Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean:31`; `Mathlib/Algebra/Group/Conj.lean:32`: commuting membership, integer powers, conjugacy. |
| `Finset.lcm`, `Finset.lcm_empty` | `Mathlib/Algebra/GCDMonoid/Finset.lean:48` and `:57`: fold initialized at 1. |
| `Nat.factorization`, `Nat.totient` | `Mathlib/Data/Nat/Factorization/Defs.lean:51`; `Mathlib/Data/Nat/Totient.lean:38`: prime multiplicities and coprime residue count. Headlines only factor positive finite element orders. |
| `Function.minimalPeriod`, `Monoid.exponent` | `Mathlib/Dynamics/PeriodicPts/Defs.lean:246`; `Mathlib/GroupTheory/Exponent.lean:72`: zero for nonexistent positive period/exponent; finite-group uses avoid these junk cases. |
| `IsSimpleGroup` | `Mathlib/GroupTheory/Subgroup/Simple.lean:38`: includes nontriviality and normal-subgroup dichotomy, but not nonabelianness or classification. |
| `Matrix.ProjectiveSpecialLinearGroup` | `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36`: quotient of SL by its center, not by an arbitrary scalar subgroup. |
| `CongruenceSubgroup.Gamma`, `IsCongruenceSubgroup` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:42`, `:164`: reduction kernel and existence of a containing nonzero level. |
| Alternating simplicity and order | `Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:201`, `Alternating.lean:141`: hypotheses 5≤Nat.card and Nontrivial respectively. |
| `FreeGroup`, `Matrix.trace`, `Algebra.adjoin` | `Mathlib/GroupTheory/FreeGroup/Basic.lean:459`; `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`; `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:35`: native carriers/operations, not substitutes for the proposed geometry. |
| Fricke identity | `TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:231`: arbitrary CommRing, two determinant-one matrices. |
| Branch triple and connectedness | `TauCeti/Combinatorics/PermutationTriple/Basic.lean:76`, `:447`: σ∞σ₁σ₀=1; connectedness includes nonzero degree and transitivity. |
| Euler characteristic and genus | `TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean:67`, `:169`, `:208`: cycles minus degree; truncated genus; connected hypothesis removes truncation. |
| Covering monodromy | `TauCeti/Topology/Covering/Monodromy/Basic.lean:63`: topological covering functor, not an algebraic stack comparison. |
| CFSG proposition and transport | `TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean:54`, `:67`: definition and conditional universe transfer; R01. |
| Existing Nielsen move | `TauCeti/GroupTheory/FreeGroup/Nielsen.lean:45`: generator multiplication automorphism, not a positive-orbit cardinality theorem. Simple pair permutations needed by the two headlines are legitimate specializations. |
| Existing Belyi existence | `TauCeti/FieldTheory/FunctionField/Belyi/Existence.lean:163`: function field and exact constant field, algebraic over ℚ; R08. |

The near-match file's group-closure, centralizer, orbit and PSL₂ hits were compared by object. They supply the generic carriers and elementary operations, not the two divisibility assertions. Searches at the pins for the cusp obstruction and orbit congruence objects found no existing theorem to replace either headline. Searches through `roadmaps grep` covered the open heads and main for Nielsen, Higman, nonabelian levels, trace/invariant coordinates, normalizers and congruence composition factors. The board package index was read before resolving the mapping-class supplier; that package exists in this checkout and was read directly.

Cross-roadmap citations were resolved anew. The useful resolved sections are listed here, with current witnesses rather than the older review's head line numbers:

| Supplier | Resolved content |
| --- | --- |
| ArithmeticDynamicsPartII, #1686 | §§0.1,1.4,2.1–2.4,3.6–3.7,4.2; §§6.0–6.6 and7.2–7.4a. README lines 767 and796 begin the geometric/trace contracts. §7.4a at978 handles p≡1 mod4 and the isolated p=11 assertion, not the requested p≡3 branch. R02 records duplicate ownership. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | §IG.1.2 tangential fibres (line1094), IG.1.3 base extension (1335), IG.1.4 family outer action (1438), IG.3.1 punctured Riemann existence (2586), IG.3.2 exterior epimorphisms (2808), IG.5.4 admissible covers/stable marked G-curves (5847,5877). The marking convention distinguishes unramified full fibres from ramification divisors. |
| AnabelianGeometryAndNonabelianChabauty | §§1.1–1.2: tangential fibre functor and analytic orientation; local inertia orbits; good paths; symmetric good paths and their existence. The cotangent generator and ordered relation are retained in the package. |
| StableReduction on main | Layers1–3, README lines372,405,467: normalization/conductor, looped dual graphs with half-edge valence, dualizing sheaf and clutching. |
| SchemeAndStackFoundations on main | §§1.19,1.21,1.23 at lines2923,3055,3124; §3.2 at4845 (generically étale Riemann–Hurwitz); §4.6 at5574, node hull at5592; §4.15 at6037. Geometry applications here use the characteristic-zero/tame range. |
| AlgebraicModuliForArithmeticGeometry, #853 | §5.1 at8413 and vertical kernel at8525; §8.3 at9725, framed scheme completion and completed atlas presentation. Closedness, flatness and finite presentation are conditions of the actual rigidification; the central finite subgroup in the imported elliptic construction has these conditions. Geometric-point extension remains a declared gap. |
| ModularCurvesPartII, #913 | §§3.1,3.11,3.12 at900,1203,1220: Drinfeld full levels, coarse j-line, Deligne–Rapoport level-H stack. Full levels have N-gons and fixed-pairing components, compatible with the package's comparison. |
| ArithmeticGaloisRepresentations | §§1.7,4.3,4.4: Burnside absolute irreducibility, PSL₂/PGL₂ automorphisms in their stated q-range, and Dickson classification with subfield embeddings. The package handles q=2,3 separately when using the q≥4 automorphism theorem. |
| LanglandsParameterStacks, #1202 | §§2.1 and3.8 at562,886. Coaction equalizer and characteristic-zero tuple invariants; the integral all-ring extension is explicitly a gap. |
| ClassicalArithmeticCompletion on main | §§4.57–4.58: Markoff–Hurwitz moves with even signs, level surfaces and trace surface; §4.76 at9139: finite-field point count. No second surface carrier is introduced. R03 corrects how the two action groups compare after base change. |
| MappingClassGroupsAndCanonicalRepresentations package | §2.3 at864, genus-one Check at887; old C.0 citation repaired by R07. Nielsen boundary-word/loop and Asada contracts remain distinct from the supplied orbifold identification. |
| HeightsRationalPointsAndObstructions | §4.6 at2052, `mordell_finite` at2054, restated in §6.4. Correct genus≥2, smooth projective geometrically connected range. |
| BelyiMaps on main | Layer10 at3903, §10.4 at4115, with native existence theorem; R08. |
| CFSGBasicProperties on main | A0 at787 and scope at18–20: listed-group finiteness/simplicity, explicitly not completeness of the classification. The existing Vdovin gap is list-only; R01. |

The overlap file reports no conflicting PR head, dropped cited id, or citation defined only by an open revision. Its five closest roadmaps were considered: ArithmeticDynamicsPartII (#1686), InverseGaloisAndArithmeticFundamentalGroups (#850), ModularCurvesPartII (#913), StableReductionPartII (#1841) and AdelicImagesAndModularCurves (#1727). Their scopes distinguish general Hurwitz covers, congruence level stacks, stable-curve deformation/positivity, and adelic torsion images from this package's cusp obstruction theory. The concrete overlap requiring repair is R02. There is no duplicate fully qualified declaration of either Lean headline in the inspected ownership search.

### Supplier order and declared gaps

Fresh mechanical dependency output:

```text
depcheck: 236 roadmaps, 2142 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No forbidden supplier from the brief is cited. The direct dependency order is sound; it does not prove completeness of the contracts (R01) or disjoint ownership (R02).

The eight gap slugs agree exactly between the README and `design/plan.json`: punctured-torus-nielsen, asada-cofinality, gaschutz-generating-pairs, equivariant-node-smoothing, geometric-point-completion, integral-rank-two-invariants, vdovin-abelian-subgroups, markoff-alternating-three-mod-four. Each names a supplier. The contracts specify the needed coefficient/characteristic/finite-group hypotheses and their comparison data; no absence of one of these declared outputs was counted as an unowned prerequisite. R01 concerns an additional, undeclared passage beyond the list-only Vdovin contract. R07 updates the section of two existing contracts without changing their slugs. No second request was made for an uncertified source.

## Not verifiable

- ASADA2001 §7 and VDOVIN1999 Theorem A: the primary texts are paywalled and explicitly settled as uncertified. They remain cited by locator. CHEN2024's restatement and BBCL22's cofinality application were read; these do not certify the inaccessible primary proofs.
- The reported PSU₃(4) component degrees 1 and184 in the Layer4 example were not independently enumerated. They are source-reported values at CHEN2024 lines3520–3523, not a computed verification in this round.
- Full proofs of the future stack constructions and declared supplier gaps do not exist in this acceptance file. The review verifies their explicit contracts, mathematics at the cited locators and the stated small-instance tests; Lean elaboration is not represented as a proof of those targets.

## Source issues

- **Error** in CHEN2024 at §1.1, printed page 305: the source says the coarse degree is the exterior orbit size or twice that size; it should be the orbit size or half that size; affects a stated result.
- **Error** in CHEN2024 at §4.11, printed page 388: the source says the odd-dihedral centralizer obstruction is two; it should be one, since a primitive rotation centralizes exactly its cyclic subgroup; affects nothing.
- **Gap** in CHEN2024 at proof of Lemma 4.12.2, printed pages 389–390: the source says bounded cyclic intersection makes the indicated power subgroup disjoint; it should justify the product independently, since C₄ and its C₂ subgroup refute that inference; affects the proof.
- **Misprint** in CHEN2024 at proof of Corollary 4.12.4, printed page 390: the source says part (c) follows; it should refer to the second assertion of part (b); affects nothing.
- **Error** in CHEN2024 at Proposition 5.2.5, printed page 397: the source displays an injective trace-action arrow; it should display an ordinary arrow, since inner automorphisms and simultaneous inversion lie in the kernel; affects a stated result.
- **Misprint** in CHEN2024 at proof of Proposition 5.2.16(d), printed page 402: the source says absolute irreducibility is equivalent to commutator trace equal to two; it should say different from two; affects the proof.
- **Gap** in CHEN2024 at proof of Proposition 5.2.16(d), printed page 402: the source treats both chosen projective generators as involutions in the dihedral case; it should also treat a rotation paired with a reflection, whose product is an involution; affects the proof.
- **Error** in CHEN2024 at Proposition 5.2.20, printed page 403: the source maps every absolutely irreducible image into the non-dihedral trace locus; it should require non-dihedral image, as the triple (6,0,0) over 𝔽₇ shows; affects a stated result.
- **Misprint** in CHEN2024 at Remark 5.2.21, printed page 404: the source gives the γ∞ matrix an upper-right entry minus one; it should be plus one for b mapping to ab; affects nothing.
- **Error** in CHEN2024 at proof of Lemma 5.3.1, printed page 408: the source says a nonsplit degenerate full conic is empty; it should contain the single point (a,0,0), removed only on the non-dihedral locus; affects nothing.
- **Misprint** in CHEN2024 at proof of Lemma 5.3.1, printed page 409: the source says the characteristic-two matrix is diagonalizable over the base field; it should allow its quadratic extension, as X²+aX+1 over 𝔽₄ can be irreducible; affects the proof.
- **Error** in CHEN2024 at Proposition 5.6.1(a), printed page 418: the source says the branch-fibre count is (D−3)/3; it should be (D+2)/3, one fixed point plus (D−1)/3 three-cycles; affects a stated result.
- **Error** in CHEN2024 at Theorem 5.6.4, printed page 419: the source asserts finiteness of elliptic curves over the number field; it should assert finiteness of j-invariants, since the argument bounds coarse level points and quadratic twists retain j; affects a stated result.
