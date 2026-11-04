# Review of RootSystems (pull request #1278 at f33895a)
Folder: `TauCetiRoadmap/RepresentationTheory/RootSystems/`
**Verdict:** accepted

Full review of the folder at the same head the previous review read (no line of the folder changed since). No P1 or P2 finding. Three P3 notes. The gate, the dependency check, the direct elaboration of `Suggested.lean` (nine `sorry` warnings, nothing else), the signature check of all ten declarations and the one-tactic padding probes pass. The previous review's one blocking finding (duplicate ownership of general geometric faithfulness with the EnriquesSurfaces pull request) is not re-raised: the reasons are under **Previous findings**.

## R01 (P3) — Delete the duplicate companion file

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/GeometricFaithfulnessTargets.lean:1–17`, "Suggested forms for RootSystems 3G; README.md is definitive and this companion is nonexhaustive."

**Claim:** The file is a second acceptance module stating one theorem already in `Suggested.lean`.

**Witness:** Its only declaration, `geometricRepresentation_injective` (line 13), has the statement of `Suggested.lean:59`; a scratch probe closes it with `exact geometric_faithfulness cs`. It lacks `import Mathlib`, the prescribed module docstring, a declaration docstring, cites a section "3G" that the README does not have, and lives in the namespace `TauCetiRoadmap.RootSystems` rather than the roadmap's. Nothing in the README names it.

**Exact repair:** Delete the file; `geometric_faithfulness` in `Suggested.lean` is the headline. No mathematics is lost: both statements give the one-point injective map in rank zero, distinct images [1] and [−1] in rank one, and the orbit values (1,0),(3,2),(5,4) in infinite dihedral type. This repeats the previous review's R02 (its R03 in the round before), still unrepaired.

## R02 (P3) — Say where the layers consumers cite by number now live

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:11–38` (Scope and ownership) and the layer headings at lines 237, 406 and 504.

**Claim:** This revision replaces the six layers of the roadmap on main (root combinatorics; the Weyl group as a Coxeter system; abstract Coxeter combinatorics; chambers and the longest element; the classification; the Bourbaki numbering) by three layers with different contents under the same numbers 1–3, and nothing in the README tells a consumer where the material it cites by the old numbers now is.

**Witness:** On main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md:2253` needs "RootSystems layer 3; Mathlib `CoxeterSystem`" (abstract Coxeter theory) and line 1529 "RootSystems layer 4" (chambers); `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:125` cites Layer 4; `TauCetiRoadmap/TopologicalKTheory/README.md:264` cites Layer 3 "Coxeter exchange/deletion". At the open heads, KacMoody `README.md:61` ("RootSystems Layer 3 owns the abstract Coxeter combinatorics"), QuantumEnvelopingAlgebras `README.md:579` ("RootSystems Layers 1, 3 and 4"), TensorProductCombinatorics `README.md:1088` (Layer 5), LieHighestWeight `README.md:825` (Layer 4), ClassicalGroups `README.md:32` (Layers 1–4 and 6), SpinRepresentations `README.md:1166` (an anchor to "layer-6-the-bourbaki-numbering-and-integral-root-data"), McKaySkewGroup `README.md:261` (Layer 4), LefschetzPencilsAndVanishingCycles `README.md:211` (Layer 5), EnriquesSurfaces `README.md:561` ("RootSystems Layer 4's finite-parabolic longest elements") and PseudolineArrangementsAndOrientedMatroids `README.md:226` ("§3G") all cite the former numbering. At this head Layer 3 is the classification and there is no Layer 4, 5 or 6.

**Exact repair:** In Scope and ownership, add one dictionary sentence in the present tense, for example: "Consumers cite the root combinatorics as Layer 1, the Weyl group as a Coxeter system as Layer 2, abstract Coxeter combinatorics as Layer 3, chambers and the longest element as Layer 4, the classification as Layer 5 and the Bourbaki numbering as Layer 6; each is the corresponding Tau Ceti contract above, and the layers below are the remaining targets." Alternatively number the three new layers 7–9 so that no old number is reused with a new meaning. Either keeps every consumer citation resolvable without an edit outside this folder; the mathematics those consumers need is already supplied, by name, in the Tau Ceti contracts (lines 134–236).

## R03 (P3) — The hypothesis `1 ≤ n` in the type A headline is unused

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean:116–121`, "`(b : P.Base) {n : ℕ} (hn : 1 ≤ n) (h : TauCeti.HasCartanType P b (.A n))`".

**Claim:** The statement holds at n = 0 as well.

**Witness:** `TauCeti.HasCartanType P b (.A 0)` gives `b.support ≃ Fin 0`, so the support is empty; a base with empty support admits only the root 0 in its signed natural expansions, and roots are nonzero (the diagonal pairing is 2 in characteristic zero), so ι is empty, `P.weylGroup` is the trivial closure and `Equiv.Perm (Fin 1)` has one element. Both sides have order 1 = 0!·1.

**Exact repair:** Drop `hn` from `weylGroup_equiv_perm_of_typeA` and the words "and n≥1" from README §3.2 line 561, or keep it as the validity range of `A n` and say so in the docstring. The A₁, A₂, A₃ instances (orders 2, 6, 24) are unchanged either way.

## Previous findings

- r9 R01 (P2, duplicate ownership of general geometric faithfulness with EnriquesSurfaces §5.2) — not re-raised, and the README is unchanged at lines 32–37. Reasons. (1) The brief asks this roadmap either to cite an existing owner or to say why it is the owner; the README says why (lines 32–37), and the reason is right: the general Coxeter sign and faithfulness theory belongs with root systems and Coxeter groups, not with surface geometry. (2) The supply direction is already fixed by the other side: EnriquesSurfaces lists RootSystems as a supplier (`TauCetiRoadmap/EnriquesSurfaces/README.md:41` and `:561` at its open head), so RootSystems is earlier, and the reverse ownership would create a cycle. (3) The duplicate declaration `coxeterGeometricFaithful` (`TauCetiRoadmap/EnriquesSurfaces/Suggested.lean:36`) and the duplicate construction (`README.md:525–533`) are in the later pull request, opened after this one; the repair, consuming RootSystems §1.3 instead of rebuilding it, is an edit of that folder, which this pull request may not make. A finding whose only repair lies outside the folder cannot block this folder; it is a finding for the EnriquesSurfaces review. (4) The two files declare different fully qualified names, so no build conflict arises. The remaining defect is recorded here for that review: EnriquesSurfaces §5.2 should cite RootSystems §1.2–1.3 for the sign criterion, faithfulness and the transports and keep only its T246 application.
- r9 R02 (P3, companion file) — not repaired; repeated as R01.
- r9 R03 (P3, add `sources.toml` to the roadmap folder) — dropped. No roadmap folder on main carries a `sources.toml` (none under `TauCetiRoadmap/`, at any depth); the manifest this project keeps is the board package's, which a roadmap pull request cannot edit, and a file in the folder that is not a roadmap file is a stray-file defect. The locators the finding asked for were verified in r9 and again below.

## Verified sound

### Scope, gate, build and signatures

The head is `f33895a5b297f27ff165d0ed2da8c7cea5c3145c`; the folder is unchanged since the previous review (0 changed lines). The prescribed outside-folder diff (everything except the roadmap folder and the family index) is empty; the family index files `TauCetiRoadmap/RepresentationTheory/README.md`, `Suggested.lean`, `metadata.toml`, `STATUS.md` and `PROGRESS.md` are byte-identical to main. The worktree is clean. The repository README and CONTRIBUTING were read; the README shape (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, three layers each ending with Examples and Dependencies, Downstream consumers, References) matches main's roadmaps. No LaTeX delimiters, process words, pull-request numbers, `lemma`, `set_option`, admitted data or non-Mathlib imports occur in the folder (grep, and the gate's scanners).

The gate rerun from the worktree:

```text
gate RootSystems: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate at this head also reports `build=0`. The prescribed dependency check:

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. All seven `*Needs:*` blocks name only Mathlib, Tau Ceti and this roadmap's own sections. RootSystemsPartII (merge order line 192) and EnriquesSurfaces (not yet in the merge order) are named only as deferrals and consumers, never in a `*Needs:*` line. No supplier gap is declared and none is needed.

The pins of the pull request's `lake-manifest.json` are Mathlib `6b7abb3c` and Tau Ceti `a91d3aa`, and the checked-out packages are at those commits (main's manifest pins newer revisions; every name below was checked at the branch pin). `lake env lean` on `Suggested.lean` exited 0 in six seconds with exactly nine `declaration uses sorry` warnings (lines 41, 50, 59, 66, 81, 89, 101, 111, 120) and no other output. A scratch file importing the built module elaborated `#check @name` for all ten declarations and the three `DynkinType` aliases: every elaborated type carries the hypotheses its README statement names (rank-two: none beyond the Coxeter system; presentation: `CommRing`, `CharZero`, `IsDomain`, `Finite ι`, crystallographic, reduced; base-independent classification: additionally `Nonempty ι`, `IsRootSystem`, `IsIrreducible` and the base `b₀`; rational classification over ℚ with the same root-system hypotheses and no base; type A: finite reduced crystallographic, a base, `1 ≤ n`, no spanning). No binder disappeared. The same file ran the one-tactic probes (`rfl`, `simp`, `infer_instance`, and `exact` with the nearest library lemma: `simple_injective`, `weylCoxeterHom_surjective`, `existsUnique_dynkinType b₀`) on all nine admitted theorems: every probe fails, so none is padding. The companion file elaborates alone (one `sorry` warning) and its statement closes from the headline (R01).

### Headline theorems

The README's nine headlines are rank-two nonnegativity (§1.2), the sign/descent criterion (§1.2), geometric faithfulness (§1.3), integral realization (§1.4), completeness of the Weyl Coxeter relations (§2.1), presented length equals inversions (§2.1), classification independent of the base (§3.1), rational classification (§3.1) and the type A symmetric group (§3.2). All nine are stated in `Suggested.lean` on native carriers (`CoxeterSystem.geometricRepresentation`, `RootPairing`, `TauCeti.weylCoxeterHom`, `TauCeti.inversions`, `TauCeti.HasCartanType`, `TauCeti.DynkinType.rationalRootSystem`, `Equiv.Perm`), with one definition with a real body (`GeometricPositive`). The module docstring correctly claims that no headline lacks a carrier. The `export` lines re-export `TauCeti.DynkinType` and its constructors under the namespace main's CFSGStatement imports (`TauCetiRoadmap/CFSGStatement/Suggested.lean:2`); the targeted build of that module passed.

### Computed adversarial table

Products act with the rightmost factor first; `alternatingWord i j k` ends in j for k > 0 (`Mathlib/GroupTheory/Coxeter/Basic.lean:396–399`). Coefficients are in the basis (αᵢ, αⱼ). S(n) = sin(nπ/m)/sin(π/m) for finite m, S(n) = n for m = 0.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| `GeometricPositive` definition (§1.1) | αᵢ; 0; αᵢ−αⱼ | coefficients (1,0): all ≥ 0 and one > 0, true; (0,0): no coefficient > 0, false; (1,−1): a coefficient < 0, false | Pass; a weak-cone definition would admit 0 |
| Positive and negative are disjoint | v=(1,1), −v | Positive(v) true; Positive(−v) false | Pass |
| Positivity does not define roots | infinite dihedral v=αᵢ+αⱼ | B(v,v)=1+1−2=0 ≠ 1, so not a root; positive | Pass; orbit condition needed |
| Gram entries | m=1,2,3,4,6,0 | −cos(π/m) = 1, 0, −1/2, −0.7071, −0.8660; m=0 gives −1 by convention (`Geometric.lean:120–125`) | Pass |
| Rank two, i=j | M i i = 1 | k < 1 forces k = 0; image αᵢ = 1·αᵢ + 0·αᵢ | Pass |
| `rankTwo_nonnegative`, m=2 | k=0,1; excluded k=2 | action (1,0),(1,0); formula (S(1),S(0))=(1,0), (S(1),S(2))=(1,0); at k=2 action (−1,0) | Pass; k<m needed |
| `rankTwo_nonnegative`, m=3 | k=0,1,2; excluded 3 | action (1,0),(1,1),(0,1); formula identical; k=3 gives (0,−1) | Pass |
| `rankTwo_nonnegative`, m=4 | k=0..3; excluded 4 | action and formula (1,0),(1,√2),(1,√2),(1,0); k=4 gives (−1,0) | Pass |
| `rankTwo_nonnegative`, m=5 | k=0..4; excluded 5 | both sides (1,0),(1,φ),(φ,φ),(φ,1),(0,1) with φ=1.618034=2cos(π/5); k=5 gives (0,−1) | Pass; noncrystallographic types included |
| `rankTwo_nonnegative`, m=6 | k=0..5 | both sides (1,0),(1,√3),(2,√3),(2,√3),(1,√3),(1,0) | Pass |
| `rankTwo_nonnegative`, m=0 | k=0..6 | both sides (1,0),(1,2),(3,2),(3,4),(5,4),(5,6),(7,6); no division used | Pass; all k allowed |
| Sine denominator | m=2,3,4,6 | sin(π/m)=1, 0.866, 0.707, 0.5, all nonzero | Pass |
| Convention witnesses (Conventions) | A₂; infinite entry | ρ(sᵢsⱼ)αᵢ=(0,1)=αⱼ; ρ(sⱼsᵢ)αᵢ=(−1,−1); ρ(sᵢsⱼ)αᵢ=(3,2) at m=0 | Pass; README values exact |
| `geometric_sign_criterion` | A₂, w=sᵢsⱼ, roots i and j | ℓ(w)=2, ℓ(wsᵢ)=3, ℓ(wsⱼ)=1; wαᵢ=(0,1) positive and i no descent; wαⱼ=(−1,−1), negative, j a descent | Pass both directions |
| Same, rank one | w=1, s | images +1, −1; lengths (0,1),(1,0) | Pass |
| Same, empty I | no i | both conjuncts vacuous | Pass |
| Positive root is nonzero | any w,i | ρ(w) invertible, αᵢ≠0, so "all ≥ 0" plus nonzero gives "some > 0" | Pass; Humphreys' "all cs ≥ 0" equals `GeometricPositive` on roots |
| `geometric_faithfulness` | empty I; rank one; infinite dihedral | orders 1=1; [1]≠[−1]; det B = 0 yet (sᵢsⱼ)ⁿαᵢ=(2n+1,2n)=(1,0),(3,2),(5,4) | Pass; no nondegeneracy |
| Reindexing by the A₂ transposition (§1.3) | w=sᵢsⱼ | Tρ(w)α₀=Tα₁=α′₀; ρ′(s′₁s′₀)Tα₀=ρ′(s′₁s′₀)α′₁=α′₀ | Pass |
| Direction of the native reindexing | three orthogonal nodes, e=(0 1 2) | `reindexGroupEquiv_symm_apply_simple`: generator 0 ↦ generator e(0)=1; forward map: reindexed 0 ↦ original e⁻¹(0)=2 | Pass; the Check separates the directions |
| Parabolic extension by zero | A₂, J={i} | Eσᵢ(1)=−αᵢ=σᵢE(1); B(E1,E1)=1 | Pass |
| `integral_geometric_realization`, A=[2] | x=1 | 1−(1·2)=−1; cast −1 = ρ(s)(1) = −1 | Pass |
| Wrong scale rejected | A=[1] | hypothesis needs 1 = 2·1, false; purported reflection 1−1=0 | Pass; zero map excluded |
| Integral A₂ | sᵢeⱼ | (0,1)−(−1)eᵢ=(1,1), equals real action | Pass |
| Degenerate integral lattice | A=[[2,−2],[−2,2]] | (sᵢsⱼ)eᵢ=(3,2); forms 2=2; det 0 | Pass; determinant not needed |
| Hypothesis existence | m=4,5,6 | 2cos(π/m)=√2, φ, √3 are not integers, so hA has no solution; theorem vacuous there, false nowhere | Pass; not narrowed |
| Reduction is not faithful | rank one mod 2, mod 3 | −1 ≡ 1 mod 2; −1 ≡ 2 mod 3 | Pass; README claims nothing modular |
| Humphreys' finiteness | §5.1 p.106 | source assumes finite S (`humphreys-coxeter line 4101`); the inputs used (`exists_isMinimalCosetRep`, `wordProd_alternatingWord_eq_of_mem_parabolic_pair`, `exists_rightDescent_of_ne_one`) have arbitrary index types at the pin | Pass; extension justified |
| `weylCoxeterHom_injective`, trivial cases | rank zero; A₁ | presented/Weyl orders 1=1, 2=2 | Pass |
| Marking excludes the swap (§2.1) | A₂ | intended generator 0 sends e₀ ↦ (−1,0); swapped generator sends e₀ ↦ (1,1) | Pass; generator equation `weylCoxeterHom_apply_simple` fixes it |
| Injectivity without spanning | M=ℚ³ with A₂ in a plane, x ∉ root span | on x+M₀ the reflections act as affine reflections in the lines ⟨y,αᵢ∨⟩=−cᵢ, which meet in one point because the Cartan matrix is nondegenerate (positive form on the root span); an element trivial on roots fixes that point and translates by 0 | Pass; the root action stays faithful, so W is the Coxeter group |
| Coxeter orders of a base | Cartan products 0,1,2,3 | `coxeterOrder` 2,3,4,6 (`Coxeter/Matrix.lean:93–95`) | Pass |
| `presentation_length_eq_inversions` | A₂ words [],[0],[0,1],[0,1,0],[0,0] | permutations (012),(102),(120),(210),(012); inversions 0,1,2,3,0; minimal lengths 0,1,2,3,0 | Pass; list length 2 of [0,0] is not minimal length |
| Lowering needs finiteness | H=[[2,−3],[−3,2]], β=(1,1) | H-norm −2, height 2; sᵢβ=(2,1), sⱼβ=(1,2), heights 3,3; A₂: sᵢ(αᵢ+αⱼ)=αⱼ, height 1 | Pass; `exists_mem_support_height_reflectionPerm_lt` has `[Finite ι]` |
| `classification_independent_base`, b₀ needed | hypothetical P with no base | "∀ b" vacuous, every valid t qualifies, uniqueness fails | Pass; `b₀` is in the signature |
| Base transitivity | A₁; A₂ | A₁: bases {α},{−α}, both Cartan [2], s exchanges them; A₂: 6 bases, 6 Weyl elements, disagreement counts 3,2,1,0 along (210),(120),(102),(012) | Pass; Humphreys §1.4 Thm, `line 579`, induction `line 581–587` |
| B₂ transport | swap T | T[[2,−2],[−1,2]]T=[[2,−1],[−2,2]]; det 2; A₂ det 3 | Pass; simultaneous reindexing |
| B₃ versus C₃ | long simple nodes at the pin | B n long iff i+1<n: B₃ nodes 0,1; C n long iff i+1=n: C₃ node 2 (`RootLength.lean:241–246`); the doubled edge sits at 1–2 in B₃ and no path automorphism moves it to 2–1 with the orientation reversed | Pass; oriented matching needed |
| Finite type is definite | [2]; empty; [[2,−2],[−2,2]] | q(1)=2>0; empty matrix PosDef vacuously; q(1,1)=0 for symmetrizers (1,1),(1,2),(2,1) | Pass; semidefinite rejected |
| Rank zero excluded | `Valid` at the pin | `A n` valid iff 1 ≤ n, `B` iff 2 ≤ n, `C` iff 3 ≤ n, `D` iff 4 ≤ n (`DynkinType.lean:156–161`); no rank-zero type | Pass |
| `rational_classification` inputs | native model | `rationalRootSystem` is `RootPairing (Fin t.numRoots) ℚ (Fin t.rank → ℚ) (Fin t.rank → ℚ)` (`Rational.lean:80`); `hasCartanType_rationalRootSystem` at `:191` | Pass |
| Uniqueness of the rational type | P ≃ model(t), P ≃ model(t′) | the composite equivalence transports `rationalBase t′` to a base of model(t) with Cartan matrix reindexed (`map_equiv_cartanMatrix`, `CartanMatrix.lean:377`); `existsUnique_dynkinType` at model(t) forces t=t′ | Pass |
| G₂ and B₂ conventions | pin | `cartanMatrix G2 = CartanMatrix.G₂ᵀ` (`DynkinType.lean:231`) with Mathlib `G₂ = [[2,−3],[−1,2]]`, so [[2,−1],[−3,2]], short node 0, long node 1 (`RootLength.lean:246`); `CartanMatrix.B 2` has (0,1)=−2, (1,0)=−1 (`Matrix/Cartan/Basic.lean:128–132`) | Pass; README matrices exact |
| F₄ long nodes; G₂ root count | pin | `F4` long iff i<2: nodes 0,1; `numRoots G2 = 12` | Pass |
| `weylGroup_equiv_perm_of_typeA` | A₁,A₂,A₃ | orders 2!,3!,4! = 2,6,24; positive roots 1,3,6; roots 2,6,12 = n(n+1) | Pass |
| Type A marking | A₂ generators (01),(12) | (01)(12)=(120) ≠ (12)(01)=(201); reversal swaps them | Pass; non-commuting, marking matters |
| Non-spanning type A | ℚ² dot pairing, root ±(1,0), coroot ±(2,0) | pairing 2; reflection e₁↦(−1,0), e₂↦(0,1), square identity; W order 2 | Pass; no spanning hypothesis |
| n = 0 (R03) | `HasCartanType P b (.A 0)` | support ≃ Fin 0, ι empty, both groups trivial | Holds; `hn` unused |
| A₁ numbered datum | pin docstring | roots ±2 in fundamental-weight coordinates, coroots ±1, dot pairing 2 | Pass |
| §5.1 sign character, rank zero | S empty | W trivial; "epimorphism onto {1,−1}" fails | Source issue retained |

### Source sample

The cited Humphreys edition is the University of Washington course copy, OCR text in the sources cache (`humphreys-coxeter`, 186 pages, printed page numbers). Every seeded target was read at its locator:

| Seeded target | Locator and what the text says | Disposition |
|---|---|---|
| 1.1 Positive vectors and standard roots | §5.4 p.111: roots are the orbit w(αₛ), unit vectors; positive means all coefficients ≥ 0 (`line 4302–4313`) | Supports the statement; orbit condition as in the README |
| 1.2 Rank-two positivity and the sign/length theorem | §5.4 Theorem p.111 (`line 4324–4325`): ℓ(ws)>ℓ(w) ⇒ w(αₛ)>0, ℓ(ws)<ℓ(w) ⇒ w(αₛ)<0; dihedral step m=∞ with the values αₛ+2αₛ′, 2αₛ+3αₛ′ (`line 4366–4369`), finite m with ℓ₁(v₁)<m (`line 4370–4385`); §5.1 finite S (`line 4101`) | Supports; the explicit S(k) recurrence and the arbitrary-index extension are the roadmap's own, as the README says |
| 1.3 Faithfulness and transport | §5.4 Corollary p.113 (`line 4386–4389`); §5.3 reflection formula σₛλ=λ−2B(αₛ,λ)αₛ (`line 4226`), form preservation (`line 4229–4232`); §5.5 parabolic identification (`line 4390–4400`) | Supports |
| 1.4 Integral comparison | derived statement; §5.3 formula and §5.4 Corollary as above | Supports the derivation; the integral statement is the roadmap's, as marked |
| 2.1 Completeness of the relations | §1.9 Theorem p.16 (`line 809–811`): W generated by S subject only to (sₐs_β)^{m(α,β)}=1; proof by the Deletion Condition (`line 827`); §1.7 Corollary p.14 n(w)=ℓ(w) (`line 717`) | Supports; the source's setting is finite real reflection groups, the README's route is algebraic, as stated |
| 3.1 Classification independent of a base | §1.4 Theorem p.10 (`line 579`): any two positive or simple systems are W-conjugate; induction on the disagreement count (`line 581–587`); §2.9 p.39 (`line 1657–1664`): classification summarized, proof referred to Bourbaki/Humphreys Lie | Supports; the README calls §2.9 a summary |
| 3.2 Type A as a permutation group | §2.10 p.41 (`line 1756–1764`): n≥1, sum-zero hyperplane, n(n+1) roots εᵢ−εⱼ, simple roots εᵢ−εᵢ₊₁, W=Sₙ₊₁ permuting coordinates | Supports |

No README locator is flagged unverified. The page numbers are printed pages. No passage was copied.

### Pinned declarations and contracts

Every backticked library name in the README was found at the branch pin (an automated grep over all of them, then by hand for the 60 declarations the contracts and `Needs` lines rely on). Opened and compared with the README's description of their hypotheses:

- `TauCeti/GroupTheory/Coxeter/Geometric.lean:125,161,479,490,525`: form, reflection, representation, form invariance, exact orders; the docstring (`:99–105`) says faithfulness is not proved there.
- `TauCeti/LinearAlgebra/RootSystem/Coxeter/Presentation.lean:57–85`: `weylCoxeterHom` under `Finite ι`, `CharZero`, `IsDomain`, crystallographic; surjectivity adds `IsReduced`; no spanning. `Coxeter/Matrix.lean:278` the base matrix.
- `Inversions/Basic.lean:50,153,170`, `Inversions/Exchange.lean:138`, `Inversions/Length.lean:82–85,148`: inversions and least length, under finite reduced crystallographic hypotheses, no spanning.
- `FiniteType/Classification.lean:122–127`: `existsUnique_dynkinType` with `IsRootSystem`, `IsIrreducible`, `Nonempty ι`; `Isomorphism.lean:51–58,137`: rigidity with both pairings spanning; `SimplyConnectedRootDatum/Rational.lean:80,87,191,235`; `DynkinType.lean:108,156,222–231,416`; `RootLength.lean:241`; `NumberOfRoots.lean:47`; `Weyl/Dihedral.lean:52–56,138`; `Weyl/Group.lean:153,337`; `Lowering.lean:92`; `Chamber.lean:137,140`; `FundamentalDomain.lean:122,133,186,232` (linear order, strict ordered ring, both reducednesses, spanning on the theorem); `LongestElement.lean:194–266`; `Positive.lean:114,117`; `StrongExchange.lean:413–463`; `Matsumoto.lean:138`; `Parabolic.lean:101,236,280,311`; `Dihedral.lean:167`; `Bruhat.lean:159,195`; `Poincare.lean:87,146`.
- Mathlib: `RootSystem/Defs.lean:120,195,422`; `Base.lean:122,155,638`; `BaseExists.lean:112–113,196,321` (field, characteristic zero, spanning, crystallographic, reduced, as the README says); `CartanMatrix.lean:130,135,150,172,355,377` (`map_equiv_cartanMatrix` is a `lemma` with `omit [IsDomain R] [Finite ι]`, as the README says; `equivOfCartanMatrixEq` requires `IsRootSystem` on the target); `Finite/Nondegenerate.lean:191,205`; `WeylGroup.lean:55,62,162`; `GroupTheory/Coxeter/Basic.lean:127,137,140,163,396,516`; `Length.lean:195,268,294`; `LinearAlgebra/Finsupp/Defs.lean` for `lmapDomain` and `linearEquivFunOnFinite`; `LinearAlgebra/Matrix/Cartan/Basic.lean:114,128,137`.

### Ownership and citations

Ownership was searched by object (injectivity of `geometricRepresentation`, root signs, the marked presentation, base-independent classification, the type A identification) over main, the board packages and the open heads with the roadmaps grep service. The only other builder of general geometric faithfulness is EnriquesSurfaces at its open head (see Previous findings). KacMoody (merge order line 3) consumes abstract Coxeter theory and does not build the geometric representation. RootSystemsPartII at its head owns integral dominance, the Stembridge step and folding, as the README's deferral says. The Tau Ceti pin owns everything the README lists as consumed; nothing consumed is restated as a target. The seven cross-roadmap references in Scope and Downstream consumers resolve: LieHighestWeight Layers 1–2, ClassicalGroups Layer 3, ReflectionInvariantTheory §4, CFSGStatement L0 and ReductiveGroups §9 on main; RootSystemsPartII §§1–3 and EnriquesSurfaces §5.2 at their open heads. The citation resolver reports no unresolved roadmap citation or Lean name. The consumer-side citations into the former layer numbering are R02.

### Not verifiable

- **Bourbaki, Lie Groups and Lie Algebras 4–6**, DOI 10.1007/978-3-540-34491-9, Ch. IV §1, Ch. VI §§1,4: Springer, paywalled; cited by locator only, as in every earlier round. Not reopened.
- **Humphreys, Introduction to Lie Algebras**, DOI 10.1007/978-1-4612-6398-2, §§9–11: Springer, paywalled; same.
- **Björner–Brenti**, DOI 10.1007/3-540-27596-7, §3.3: Springer, paywalled; same.
- **Kac, Infinite-Dimensional Lie Algebras**, DOI 10.1017/CBO9780511626234, Ch. 4: Cambridge landing page only, no legal full text; same. It supplies terminology only.
- No new fetch was attempted: the fetch command records entries in the board manifest, which a review must not edit, and these four citations were settled as paywalled in rounds 7–9. Every claim that depends on them is a standard textbook fact also located in the accessible Humphreys text above.

## Source issues

- **Error** in humphreys-coxeter at §5.1, Proposition, printed p.107: the source says every Coxeter system has a unique epimorphism onto {1,−1} sending each generator to −1; it should say homomorphism, surjective only when the generating set is nonempty; affects a stated result.
