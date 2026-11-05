Verdict: design
Name: SpectralSequencesAndConvergence
Base: none
Owner: none

## Scope

The roadmap owns the common language of spectral sequences in an arbitrary abelian category 𝒜:
limit pages, convergence to a filtered object as a structure, conditional convergence, the
comparison theorem, the spectral sequence of a filtered complex and of an exact couple with the
identification of the two, and the recognition of Mathlib's spectral sequences of spectral objects
as convergent. It is a foundations roadmap: it supplies vocabulary and theorems that other
roadmaps now re-derive by hand (dimension counts, vanishing in a range, "E_2 = E_∞" arguments).

**Carrier.** The spectral sequence carrier is Mathlib's `CategoryTheory.SpectralSequence C c r₀`
(pages as homological complexes of shape `c r`, isomorphisms homology-of-page-r ≅ page-(r+1)),
with its cohomological instances `CohomologicalSpectralSequence`, `CohomologicalSpectralSequenceNat`
and `CohomologicalSpectralSequenceFin`. The roadmap defines no second page carrier; it builds the
cycle and boundary towers, the limit page and the convergence structures on top of that one.
Homological indexing is the mirror image through `ComplexShape` and is a Check, not a second
theory.

**Generality.** Every statement is for an abelian category 𝒜. Where the limit page is defined by
countable intersections and unions, the hypothesis is stated as what it is (existence of the
countable intersections and unions of subobjects concerned, in Mathlib terms
`HasCountableProducts`, `CountableAB4Star`, `AB5` or `IsGrothendieckAbelian` as the design finds
weakest); the stabilisation limit page needs no hypothesis at all. Convergence is a structure on a
pair (spectral sequence, filtered family (H^n, F^p H^n)), never a property of the pages alone, and
convergence in a set I of total degrees is the general form; convergence in all degrees is I = ℤ.
The filed wording's "filtration finite in each degree" is the finite case, which becomes a Check
of the general exhaustive-and-bounded theorems.

**Boundaries (owned elsewhere, imported by name).**

- DGFloer on main, Layer 1 item 3: the spectral sequence of an increasing filtered chain complex
  of modules over a ring, Weibel's classical convergence theorem 5.5.1(2) and the cohomological
  complete convergence theorem 5.5.10 in that module setting. This roadmap's abelian-category
  theorems specialise to those; the specialisation is a Check and the module theorems are not
  restated. DGFloer Layer 1 item 2 owns the Serre spectral sequences and their products.
- DerivedModuleAlgebra on main, §1.T.1: towers of modules, lim and lim¹, Mittag–Leffler
  vanishing, Milnor sequences; its first-quadrant double-complex spectral sequence with abutment
  filtration, edge maps and five-term sequence (module double complexes). AlgebraicTopology on
  main, Stage 6.0: lim and lim¹ of countable towers of abelian groups. This roadmap owns lim and
  lim¹ of a tower only in a general 𝒜 with countable products (kernel and cokernel of the shift
  map on the product), identified with those carriers on modules and abelian groups as Checks.
- StableHomotopyKTheory (#1227, merge order line 13), §7.22: bigraded exact couples and derived
  couples in any abelian category; §7.23: the spectral object of a filtered spectrum; §7.26:
  Boardman's conditional convergence for towers of spectra with abelian-group homotopy. This
  roadmap consumes §7.22's exact-couple carrier if it is merged first (it is earlier in the merge
  order), proves the identification exact couple ↔ filtered complex, and owns the
  abelian-category form of Boardman's theory; §7.26's abelian-group instance is a Check.
- SchemeAndStackFoundations on main (Leray and Čech-to-cohomology spectral sequences),
  ComplexKahlerGeometry K8 (Frölicher), HeegaardFloer and MorseTheory on main (finite filtered
  complexes of modules): these are instances; they stay where they are and are not re-planned.
- Multiplicative structures on spectral sequences, Adams and Atiyah–Hirzebruch sequences,
  spectral sequences in triangulated or stable ∞-categories beyond Mathlib's
  `Triangulated.SpectralObject` and its homological-functor image: out of scope.

## Final targets

Indexing: cohomological, E_r^{p,q} with d_r of bidegree (r, 1 − r), r ≥ r₀, decreasing
filtrations F^p; the homological mirror is a Check. Locators: `stacks-012K` is the Stacks Project
chapter "Homological Algebra" (its text is in the sources cache); Weibel, McCleary, Boardman,
Massey and Cartan–Eilenberg are cited by locator only (uncertified).

1. **Cycle and boundary towers and the limit page.** For a spectral sequence E in 𝒜 starting at
   r₀, construct the towers 0 = B_{r₀} ⊆ B_{r₀+1} ⊆ … ⊆ Z_{r₀+1} ⊆ Z_{r₀} = E_{r₀} of subobjects of
   each E_{r₀}^{p,q} with E_r^{p,q} ≅ Z_r/B_r (`stacks-012K` line 2612–2624, Definition 20.1,
   tag 011N). Define Z_∞ = ⋂_r Z_r and B_∞ = ⋃_r B_r when they exist and the limit page
   E_∞^{p,q} = Z_∞/B_∞ (`stacks-012K` line 2625–2628, Definition 20.2, tag 011O). Define, for a
   position (p, q) at which the towers stabilise (Z_r = Z_{r+1} = … and B_r = B_{r+1} = … for
   r ≥ r(p,q)), the stabilised limit E_∞^{p,q} := E_{r(p,q)}^{p,q}, in any abelian category;
   prove it is independent of r(p,q), that it agrees with Z_∞/B_∞ when the latter exists, and
   that a bounded spectral sequence (finitely many nonzero E_{r₀}^{p,n−p} on each diagonal)
   stabilises at every position (`stacks-012K` line 3107–3130, Definition 24.7 and Lemma 24.8,
   tags 0BDU, 0BDV; Weibel §5.2, Definitions 5.2.1–5.2.5, uncertified). Degeneration at E_s
   (d_r = 0 for r ≥ s) gives E_s = E_∞ (`stacks-012K` line 2634–2637).

2. **Convergence as a structure.** For a family (H^n)_{n∈I} of objects with decreasing
   filtrations F^p H^n, define: weak convergence, a family of isomorphisms
   β^{p,q} : E_∞^{p,q} ≅ F^p H^{p+q}/F^{p+1} H^{p+q} for p + q ∈ I; convergence
   (E_{r₀}^{p,q} ⇒ H^{p+q}), weak convergence with ⋃_p F^p H^n = H^n and ⋂_p F^p H^n = 0;
   strong convergence, convergence with H^n ≅ lim_p H^n/F^p H^n (`stacks-012K` line 3131–3143,
   Definition 24.9, tag 012U, which also requires regularity; Weibel §5.2, Definition 5.2.11,
   uncertified). Morphisms of convergent spectral sequences are page morphisms (Mathlib
   `SpectralSequence.Hom`) together with filtered maps of abutments commuting with β. Prove: if
   for each n ∈ I the filtration of H^n is finite, the three notions coincide and H^n is an
   iterated extension of the E_∞^{p,n−p} (`stacks-012K` line 3152–3158, Lemma 24.11, tag 012W,
   for the filtered-complex case; Weibel §5.2, Definition 5.2.5 and the remark following
   5.2.6, uncertified).

3. **Conditional convergence and Boardman's theorem.** Formulate a spectral sequence with
   target through an unrolled exact couple … → A_{s−1} → A_s → … with E_s the cofibre terms
   (`helle-rognes2024` line 104–135, Definition 3.1 and Remark 3.2; the spectral sequence of the
   couple, line 136–144, Definition 3.3 and Lemma 3.4), in an abelian category with countable
   products and coproducts in which lim¹ of a tower is the cokernel of the shift map. Define
   A_∞ = colim A_s, A_{−∞} = lim A_s, RA_{−∞} = lim¹ A_s, the filtrations of A_∞ by images and
   of A_{−∞} by kernels (`helle-rognes2024` line 145–152, Definition 3.6); conditional convergence
   to the colimit (A_{−∞} = 0 and RA_{−∞} = 0) and to the limit (A_∞ = 0) (`helle-rognes2024`
   line 153–156, Definition 3.7, which cites Boardman 1999, Definition 5.10); the obstruction
   RE_∞ = lim¹_r Z_r of the cycle towers (`helle-rognes2024` line 71–80, Definition 2.3 and
   Remark 2.4, citing Boardman (5.1)); the whole-plane obstruction W (`helle-rognes2024`
   line 169–178, Definition 3.11, citing Boardman §§3 and 8). Theorems: a couple conditionally
   convergent to the colimit with RE_∞ = 0 gives weak convergence to A_∞ with complete
   filtration and the Hausdorff defect F_{−∞}A_∞ ≅ W; a couple conditionally convergent to the
   limit with RE_∞ = 0 gives strong convergence to A_{−∞} with RA_{−∞} ≅ W (`helle-rognes2024`
   line 163–168, Theorems 3.9 and 3.10, which cite Boardman 1999, 8.10 and 8.13; the
   half-plane cases, where W = 0 automatically, are Boardman's Theorems 7.1 and 8.2 as cited by
   StableHomotopyKTheory §7.26, uncertified). Helle–Rognes work in graded modules over a ring
   and warn against the general abelian case (`helle-rognes2024` line 53–55); the design states
   the exact hypotheses on 𝒜 (see Risks). Check: the abelian-group instance for towers of
   spectra is StableHomotopyKTheory §7.26.

4. **The spectral sequence of a filtered complex.** For a cochain complex K in 𝒜 with a
   decreasing filtration by subcomplexes F^p K: E_0^{p,q} = gr^p K^{p+q}, E_1^{p,q} =
   H^{p+q}(gr^p K), d_1 the connecting morphism of 0 → gr^{p+1} → F^p/F^{p+2} → gr^p → 0, the
   induced filtration F^p H^n(K) = im(H^n(F^p K) → H^n(K)), and E_∞ containing gr H^n(K) as a
   subquotient when it exists (`stacks-012K` line 2964–3000 and 3010–3080, Definitions 24.1 and
   24.5 and Lemmas 24.2–24.6, tags 012L, 012M, 012N, 012O, 012P, 012Q; Weibel §5.4, Theorem
   5.4.1, uncertified). Prove: if the filtration of each K^n is finite, the spectral sequence is
   bounded, the filtration of each H^n(K) is finite and the sequence converges to H^*(K)
   (`stacks-012K` line 3152–3158, Lemma 24.11, tag 012W); the Euler-characteristic identity in
   K_0 for a bounded sequence with finitely many nonzero terms on some page (`stacks-012K`
   line 3175–3182, Lemma 24.12, tag 0BDW).

5. **Classical and complete convergence.** (a) If the filtration is exhaustive (⋃_p F^p K = K)
   and in each degree n there is p₀(n) with F^p K^n = 0 for p ≥ p₀(n), the spectral sequence
   converges to H^*(K) with the induced filtration, which is exhaustive and separated in each
   degree (Weibel §5.5, Theorem 5.5.1, uncertified; `stacks-012K` line 3202–3210, Lemma 24.13,
   tag 0BK5, for the variant with hypotheses on H^n(F^p K)). (b) If the filtration is exhaustive
   and complete (K^n ≅ lim_p K^n/F^p K^n) and the spectral sequence is regular, it converges
   weakly to H^*(K); if moreover it is bounded in each total degree, it converges strongly; the
   lim¹ term is the obstruction (Weibel §5.5, Theorem 5.5.10, uncertified; Eilenberg–Moore §7,
   uncertified). Check: for 𝒜 = modules over a ring and the increasing
   filtration of DGFloer Layer 1 item 3, (a) and (b) are DGFloer's theorems and the convergence
   structures agree.

6. **Exact couples.** Bigraded exact couples (D, E, i, j, k) in 𝒜, the derived couple
   (D' = im i, E' = H(E, jk)) and the spectral sequence of an exact couple (`stacks-012K`
   line 2653–2704, Definition 21.1, Lemma 21.2, Definition 21.3 and Lemma 21.4, tags 011Q, 011R,
   011S, 011T; Weibel §5.9, Definitions 5.9.1–5.9.3, uncertified; Massey 1952, uncertified).
   Consume StableHomotopyKTheory §7.22's carrier when it is on main or earlier in the merge
   order; otherwise own it. The exact couple of a filtered complex (D^{p,q} = H^{p+q}(F^p K),
   E^{p,q} = H^{p+q}(gr^p K)) and the identification of its spectral sequence with target 4's
   (Weibel §5.9, 5.9.4 and the discussion after it, uncertified; `stacks-012K` line 2834–2905,
   §23, construction through differential objects, tags 012B–012D).

7. **The comparison theorem.** For a morphism f : E → E' of spectral sequences converging
   strongly to (H^n, F) and (H'^n, F') in degrees I (or converging with bounded-below
   filtrations), if f_r is an isomorphism on some page r ≥ r₀ then f_∞ is an isomorphism on
   limit pages and the abutment map H^n → H'^n is an isomorphism for n ∈ I (Weibel §5.2,
   Theorem 5.2.12 and its proof, uncertified; Eilenberg–Moore §7, uncertified; the strong
   version from Boardman 1999, uncertified).

8. **Consequences.** For a spectral sequence converging to (H^n) in degrees I: if E_r^{p,n−p} = 0
   for all p and some r ≥ r₀ then H^n = 0 (n ∈ I); if E_s^{p,n−p} = 0 for all but finitely many
   p and the sequence converges with finite filtrations, then over a field k with finite
   dimensions dim H^n = Σ_p dim E_∞^{p,n−p} ≤ Σ_p dim E_r^{p,n−p}, with equality for every r if
   the sequence degenerates at E_r; the two-column and two-row degenerate cases giving long exact
   sequences and the edge morphisms E_{r₀}^{n,0} → H^n → E_{r₀}^{0,n} in the first-quadrant case.

9. **Mathlib's spectral objects converge.** For a spectral object X : `SpectralObject C EInt`
   with `X.HasSpectralSequence data` (`CategoryTheory.Abelian.SpectralObject.spectralSequence`),
   define the abutment A^n := H^n(⊥ ≤ ⊤) with the filtration by the images of H^n(⊥ ≤ i) (or of
   H^n(i ≤ ⊤), as the orientation of `data` dictates); identify the spectral sequence with that of
   the exact couple of the tower (H^n(⊥ ≤ i))_i; prove that under `IsFirstQuadrant`,
   `IsThirdQuadrant` and the finite-rows core the sequence converges strongly to (A^n) with
   finite filtrations and E_∞ ≅ gr A. For a filtered cochain complex, identify the spectral
   sequence of `HomotopyCategory.spectralObjectMappingCone` composed with the cohomology
   functor (`Triangulated.SpectralObject.mapHomologicalFunctor`) with target 4's spectral
   sequence, pages, differentials and induced filtration, recording the page offset and the
   reindexing of Mathlib's endpoints (i₀, i₁, i₂, i₃). Check: DerivedModuleAlgebra's
   first-quadrant double-complex abutment on main is an instance.

10. **Convergence in a range of degrees.** State and prove targets 2, 5, 7 and 8 for a set I of
    total degrees, so that a spectral sequence that converges to H^n only for n > n₀ is a
    convergence structure in this sense. Check: the shape of the statement of the Browning–Sawin
    theorem, a spectral sequence of ℓ-adic Galois representations converging to a complex whose
    i-th cohomology is the compactly supported cohomology of a space of morphisms for i above an
    explicit bound (`browning-sawin2020` line 57–75, Theorem 1.1, and line 568–587, Theorem 2.7,
    with line 1250–1254 citing Stacks 012K for the convergence of the descending-filtration
    spectral sequence), is expressible with this roadmap's definitions. The geometry of that
    paper is not in scope.

`Suggested.lean` states targets 1, 2, 4, 5(a), 7, 8 and 9 with `sorry`, against the pinned
Mathlib carriers, with only the definitions of towers, limit pages and convergence structures
they need, a single `import Mathlib`, no sorry'd data and no `set_option`.

## Suppliers

- Mathlib (pinned): `CategoryTheory.SpectralSequence`, `CohomologicalSpectralSequence`,
  `CohomologicalSpectralSequenceNat`, `CohomologicalSpectralSequenceFin`;
  `CategoryTheory.Abelian.SpectralObject`, `SpectralObject.HasSpectralSequence`,
  `SpectralObject.spectralSequence`, `SpectralObject.IsFirstQuadrant`,
  `SpectralObject.IsThirdQuadrant`, the cores `coreE₂Cohomological`, `coreE₂CohomologicalNat`,
  `coreE₂CohomologicalFin`, `coreE₂HomologicalNat`; `HomotopyCategory.spectralObjectMappingCone`;
  `CategoryTheory.Triangulated.SpectralObject` and `mapHomologicalFunctor`; `EInt`;
  `CategoryTheory.Functor.IsMittagLeffler` (on types); the Grothendieck axioms
  `HasExactLimitsOfShape`, `CountableAB4Star`, `AB5`, `IsGrothendieckAbelian`;
  `Limits.HasCountableProducts`. The pinned Tau Ceti has no spectral-sequence material.
- DGFloer on main, Layer 1 item 3 (module filtered complexes, Weibel 5.5.1(2) and 5.5.10) and
  item 2 (Serre): instances and Checks for targets 5 and 9.
- DerivedModuleAlgebra on main, §1.T.1 (towers, lim, lim¹, Mittag–Leffler, Milnor sequences for
  modules) and its first-quadrant double-complex spectral sequence with abutment: Checks for
  targets 3 and 9. AlgebraicTopology on main, Stage 6.0 (lim, lim¹ for abelian-group towers).
- StableHomotopyKTheory (#1227, merge order line 13): §7.22 exact couples and derived couples
  (target 6), §7.23 the spectral object of a filtered spectrum, §7.26 Boardman's theorem for
  spectrum towers (Check for target 3). The new roadmap is inserted in the merge order after
  StableHomotopyKTheory, its last supplier not on main.

## Consumers

- Open pull requests that cite Mathlib's spectral objects and re-derive convergence by hand:
  ArithmeticGaloisDuality (#858; first-quadrant sequences, "E_2 = E_∞" arguments),
  LefschetzPencilsAndVanishingCycles (#873; Leray filtration and its graded pieces),
  ClassicalAdicEtaleCohomology (#875), CrystallineCohomology (#857), WeightsInEtaleCohomology
  (#1001), ArithmeticLocallySymmetricSpaces (#871; stratification exact couple with finite
  convergence), DerivedDeRhamCohomology (#868; conjugate spectral sequence of a tower with its
  own finite-convergence law), SchemeKTheoryOperations (#1229; coniveau exact couple),
  TangentialBordism (#942; Adams exact couple), PadicDifferentialEquationsAndRigidCohomology
  (#1002).
- AlgebraicTopologyPartII (#1694), DGFloerPartII (#1799) and StableHomotopyKTheoryPartII
  (#1733), which apply Serre, Tate and loop-fibration spectral sequences in a range of degrees.
- Open designs likely to need the vocabulary: GaloisActionOnEtaleCohomology (#6149),
  HochschildHomologyAndHKR (#6158).
- A future roadmap on the geometric circle method (Browning–Sawin), whose main theorem is a
  convergence statement in a range of degrees (target 10).

## Sources

- `stacks-012K`: The Stacks Project, chapter "Homological Algebra", §§20–25 and §31 (spectral
  sequences, exact couples, differential objects, filtered differential objects, filtered
  complexes, double complexes, inverse systems), tags 011N, 011O, 011Q–011T, 012B–012J,
  012K–012W, 0BDU–0BDW, 0BK5, 0130, 02N0–070E. Open repository; certified, in the cache.
- `browning-sawin2020`: T. Browning, W. Sawin, *A geometric version of the circle method*,
  Ann. of Math. 191 (2020), no. 3; arXiv 1711.10451v3 read, Theorems 1.1 and 2.7 and
  Proposition 2.5. Open repository; certified, in the cache. The preprint's numbering was used;
  the design should check it against the journal version it cites.
- `weibel1994`: C. A. Weibel, *An Introduction to Homological Algebra*, CUP 1994, §5.2
  (Definitions 5.2.1–5.2.11, Comparison Theorem 5.2.12), §5.4 (Theorem 5.4.1), §5.5 (Classical
  Convergence Theorem 5.5.1, Complete Convergence Theorem 5.5.10), §5.9 (exact couples,
  5.9.1–5.9.4). DOI 10.1017/CBO9781139644136. Paywalled; cite by locator, uncertified.
- `boardman1999`: J. M. Boardman, *Conditionally convergent spectral sequences*, Contemp. Math.
  239 (1999), 49–84, DOI 10.1090/conm/239/03597; Definition 5.10, Theorems 7.1 and 8.2 (locators
  as cited by StableHomotopyKTheory §7.26; not read). The author's page could not be reached
  and no other legal open copy was found. Paywalled; cite by locator, uncertified.
- `helle-rognes2024`: G. O. Helle, J. Rognes, *Boardman's whole-plane obstruction group for
  Cartan–Eilenberg systems*, Doc. Math. (open access); the copy on the second author's page at
  the University of Oslo was read (author page; certified, in the cache). §2 (Definitions
  2.3, 2.5, 2.7: limit page, RE_∞, exhaustive, Hausdorff and complete filtrations, weak, plain and
  strong convergence), §3 (Definitions 3.1, 3.3, 3.6, 3.7, 3.11 and Theorems 3.9–3.10: exact
  couples, conditional convergence, Boardman's theorems and W), §§5–7 (Cartan–Eilenberg
  systems and the interchange morphism).
- `eilenberg-moore1962`: S. Eilenberg, J. C. Moore, *Limits and spectral sequences*, Topology 1
  (1962), 1–23, DOI 10.1016/0040-9383(62)90093-9, §7 (convergence and the comparison theorem
  with complete filtrations). The publisher's page is treated as paywalled by the sources
  service; recorded uncertified, cite by locator.
- `mccleary2001`: J. McCleary, *A User's Guide to Spectral Sequences*, 2nd ed., CUP 2001,
  Ch. 2 (§2.2 convergence, §2.3 comparison), Ch. 3 (§3.1 filtered complexes, exact couples).
  DOI 10.1017/CBO9780511626289. Paywalled; cite by locator, uncertified.
- `massey1952`: W. S. Massey, *Exact couples in algebraic topology (parts I and II)*, Ann. of
  Math. 56 (1952), 363–396, DOI 10.2307/1969805. Paywalled; cite by locator, uncertified.
- `cartan-eilenberg1956`: H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton 1956,
  Ch. XV (spectral sequences, §§1–4). Paywalled; cite by locator, uncertified.

## Risks

- **Paywalled spine.** Weibel, McCleary, Cartan–Eilenberg, Massey and Boardman cannot be read;
  the open spine is the Stacks chapter (which covers targets 1, 2, 4, 6 and the finite and
  bounded cases of 5) plus Eilenberg–Moore and Helle–Rognes for completeness, conditional
  convergence and the comparison theorem. Boardman's theorem numbers were taken from
  StableHomotopyKTheory's citations and are unverified; the design must state Boardman's
  theorems in its own words from the open formulations and keep the locators marked uncertified.
- **No limit page in the library.** Mathlib's `SpectralSequence` records pages only; E_∞,
  abutments and convergence must be built from scratch, and the Z_∞/B_∞ definition needs
  countable intersections and unions of subobjects with exactness hypotheses that the design has
  to pin to Mathlib's Grothendieck-axiom classes.
- **Index conventions.** Mathlib's spectral-object pages use endpoints (i₀, i₁, i₂, i₃) and a
  page offset relative to classical E_r (DGFloer records "native page r+1 is classical E_r"
  for its reindexing; StableHomotopyKTheory says the cohomological core starts at page two);
  getting the identification in target 9 wrong by one page or one sign is the main technical
  risk.
- **Ownership edges.** StableHomotopyKTheory (#1227) is a pull request: if its §7.22 exact
  couple carrier changes or is removed, target 6 must own the carrier; if its §7.26 is widened to
  abelian categories, target 3 shrinks to the Cartan–Eilenberg-system and comparison material.
  DGFloer on main cites a Tau Ceti file (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean`
  at a later commit) that the pinned Tau Ceti does not contain; the design must re-check the pin
  and treat that file's declarations as DGFloer's, not its own.
- **lim¹ in a general abelian category.** Boardman's theory and the complete convergence
  theorem use lim and lim¹ of towers and Mittag–Leffler vanishing. In a general AB4* category
  Roos's theorem on derived limits fails (the Neeman–Deligne counterexample noted at
  `helle-rognes2024` line 53–55); the design must state target 3 and target 5(b) either for
  Grothendieck abelian categories, or for AB4* categories with lim¹ defined as the cokernel of
  the shift on countable products and Mittag–Leffler proved from that definition, and must not
  assume more of 𝒜 than the proofs use. The pinned Tau Ceti and Mathlib have lim¹ only for
  types (`CategoryTheory.Functor.IsMittagLeffler`), modules (DerivedModuleAlgebra §1.T.1) and
  abelian groups (AlgebraicTopology 6.0).
- **Terminology.** "Converges" means different things in Weibel (bounded below, exhaustive),
  Stacks (regular, abuts, complete) and Boardman (strong, conditional); the roadmap must fix one
  dictionary for the whole library and record the translation of each source's term.
