# Triage report: TARGET-CohomologyOfGroups

**Verdict:** `design`, under the filed name **CohomologyOfGroups**. It is a new roadmap, not a
Part II and not a merge.

No roadmap, package or library owns the general homology and cohomology of discrete groups that
the target asks for. Several roadmaps in review restate pieces of it locally for their own use.
The target is restated at the generality the sources support, and its ownership direction is
corrected (target.md, Risk 3).

## Second run: after the references answer

The first run asked for one text, SwanPPeriod60. A human has since waived it (the manifest
records `status = "waived"` with the answer's link). This run finishes the job without it:
- **Swan.** 8.2 cites SwanPPeriod60 Thms. 1 and 2 by locator. The waived entry is kept unchanged,
  with `venue` and `cited_for` added. The statements of 8.2 are checked against the open
  restatement in Hutchinson13 line 499–504. Nothing is requested this time, so no
  `needs-references.toml` is written.
- **Fresh checks.** I re-ran each check of the first run against the index of 14:34 and the board
  as it is now:
  - *Open pull requests.* The set of 449 is unchanged. The heads of SchemeKTheoryOperations
    (#1229), K3BlochGroups (#1430) and MappingClassGroupsAndCanonicalRepresentations (#2266)
    moved. Every section this triage cites in them was read again at the new heads and still
    says the same: SchemeKTheoryOperations §6.7, K3BlochGroups §§4.1, 4.15 and 5.2 (with the four
    named targets), and MappingClassGroupsAndCanonicalRepresentations §1.1.
  - *Board.* No new target or design touches group (co)homology. The three open items listed in
    the brief are the ones of the first run, so the consolidation verdicts stand.
  - *Spectral-sequence suppliers.* SpectralSequencesAndConvergence is still a board design whose
    latest review asks for changes, and its section numbers are as cited.
  - *Merge order.* The lines of the restating roadmaps are as recorded in Risk 3.
  - *Pins.* Every Lean name in target.md was found again in the pinned Mathlib and Tau Ceti.
- **New in target.md.**
  - *Transgression.* MappingClassGroupsAndCanonicalRepresentations §1.1 now cites a Tau Ceti cochain
    transgression, so I checked it in the pins. `TauCeti.ContCohomology.IsTransgressionLift` and
    its `cocycle` are stated for any topological group. The map
    `TauCeti.ContCohomology.transgression` and its five-term exactness assume a profinite group.
    target.md now consumes the lift (Scope, 4.3). The transgression for every group, through a
    set-theoretic section, is owned here as an extension of the profinite map.
  - *Locators.* MilneCFT Prop. 1.39 is split by item: (d) is the projection formula, and (a)–(c),
    (e) are associativity, graded commutativity and naturality. Prop. 1.30 and Cor. 1.33
    (pp. 70–71) are added to 7.2 for injectivity.
  - *HS53 locators.* Checked again against the section headings of the cached text (printed page
    = PDF page + 109), and corrected:
    - 1.1 now cites Ch. I §2 Prop. 1 (p. 111) and §4 (p. 114). §1 holds only definitions.
    - `d₂ = −c ∪` is Ch. III §6 Thm. 4, not §5.
    - The transgression is Ch. III §3 (p. 128), and the degree-`m` sequence is §4 Thm. 2.
  - *Library name.* 8.2 names Tau Ceti's degree-0 cyclic cup form,
    `TauCeti.TateCohomology.cup_characterConnectingClass_eq_groupCohomologyπEven`.
- **NSW.** I fetched the PDF of version 2.3 again. The host still answers with the authors'
  landing page, so the entry is unchanged and its locators remain for the designer to confirm.

## 0. Consolidation with the open targets and designs

- **TARGET-FinitenessAndDualityOfGroups** (#14492). Read in full. Its objects are:
  - the types FP_n, FP and FL;
  - cohomological, geometric and virtual dimension;
  - duality and Poincaré duality groups;
  - Euler characteristics;
  - Farrell cohomology.

  None of these is an object of this target. Its scope says "the carriers and the products are
  those of CohomologyOfGroups", and its rationale says it is separate because it consumes this
  roadmap. It is therefore a consumer, not an overlap. To keep the direction single, target.md
  states 3.2's finiteness hypothesis directly on resolutions rather than through FP_∞. No merge.
- **TARGET-SpectralSequencesAndConvergencePartII** (#14490). Read in full. Its objects are:
  - double complexes;
  - Cartan–Eilenberg resolutions and hyper-derived functors;
  - the composite-functor sequence;
  - Künneth, universal-coefficient and change-of-rings sequences;
  - products and the Bockstein sequence.

  All of these are in an arbitrary abelian category. It is the general supplier: this target
  takes its Layers 2–5 as instances (invariants and coinvariants on `Rep k G`). The only contact is
  its Check that applies Layer 3 to invariants under a normal subgroup, which says "CohomologyOfGroups
  consumes it". target.md fixes the boundary: that Check stays there; the `E₂` identification,
  edge maps, transgression, products and low-degree consequences are owned here. That is a shared
  supplier relation, not a second plan of the same theory. No merge.
- **DESIGN-VirtualFundamentalClassPartII** (#13859). Stacks, Chow groups and virtual classes. No
  common object. No merge.
- **SpectralSequencesAndConvergence**. This board package is not in the list of open
  targets/designs; its design review asks for changes. It is a supplier (convergence structures).

## 1. Is it planned already? Searches and findings

Searches were made by mathematical object with `roadmaps grep` over the 449 open roadmap pull
requests and main, by `grep` over the board's packages, and over the pinned Mathlib and Tau Ceti:
- the Lyndon / Hochschild–Serre sequence;
- stable elements;
- periodic cohomology, generalised quaternion groups and Swan;
- Hopf's formula and Schur multipliers;
- Cartan–Leray, equivariant homology and the Borel construction;
- Mayer–Vietoris for amalgams and HNN extensions, and "Lyndon sequence";
- the Pontryagin product;
- hyperhomology;
- G-CW complexes;
- the cup product on `groupCohomology`.

**Library (pins).**
- *Mathlib.* `groupCohomology`, `groupHomology` and `tateCohomology`, with resolutions,
  functoriality, long exact sequences, Shapiro, low degrees and finite cyclic groups. There is
  **no cup product** on the ordinary carriers.
- *Tau Ceti, discrete carriers.* Corestriction in all degrees (`TauCeti.groupCohomology.corestriction`
  with `cor ∘ res = [G:S]` and naturality), the homological transfer and Verlagerung,
  inflation–restriction exactness in every positive degree under vanishing
  (`TauCeti.groupCohomology.HInfRes_exact`), and Sylow injectivity.
- *Tau Ceti, Tate cohomology.* A full Tate cohomology toolkit, with the Tate cup product (associative,
  graded commutative, projection formula), Tate's theorem, Tate–Nakayama, two-periodicity for
  cyclic groups and the Herbrand quotient.
- *Tau Ceti, profinite groups.* For **profinite** groups: the continuous cup product in all
  bidegrees, the continuous Mackey formula (profinite, `ℤ` coefficients), and the explicit
  five-term sequence.
- *Tau Ceti, homological algebra.* The algebraic Künneth sequence and the universal-coefficient
  sequence for complexes, and first-quadrant bicomplex spectral sequences.
- *Missing from the pins.* No extension spectral sequence for any group. No cup or cap product on
  `groupCohomology` or `groupHomology`. No hyperhomology, no stable elements, no Tate duality, no
  periodicity theorem, no tree or amalgam sequence, no Pontryagin product, no Hopf formula.
- *Comparison.* The continuous–discrete comparison in all degrees is only an existence statement,
  and only for finite groups (`TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`).

**Roadmaps on main.**
- ProfiniteCohomology owns continuous cohomology of profinite groups and its cup products. It
  explicitly excludes the Hochschild–Serre spectral sequence (its "Out of scope" list).
- ClassFieldTheory consumes the Tate toolkit (Layer 0) and owns class formations.
- AlgebraicTopology §5.3 owns the Cartan–Leray sequence of a regular cover with finite deck group;
  §8.15 owns the non-freeness of `C_p × C_p` actions on spheres.
- FreeGroupsAndLimitGroups Layer 4 owns graphs of groups and Bass–Serre theory, with no
  (co)homology.
- ClassifyingSpaces owns `K(G,1)` models.

None of them owns a target of this roadmap.

**Roadmaps in review that restate a piece locally.** None owns the general statement:
- SchemeKTheoryOperations (#1229) §6.7: integral group hyperhomology for complexes in degrees
  `≥ 0`, with its two spectral sequences. HomologicalStabilityOfGeneralLinearGroups (#2036) uses it.
- K3BlochGroups (#1430):
  - §4.1: integral hyperhomology again.
  - §5.2: "targets of this roadmap" `finiteGroup_stableElements` (`ℤ₍ᵣ₎` coefficients),
    `finiteGroup_homologyDuality`, `quaternionPeriodicHomology` and `finiteGroup_period_fromSylow`.
- MappingClassGroupsAndCanonicalRepresentations (#2266, merge order line 293) §1.1. It proves the
  cohomological Hochschild–Serre sequence and five-term sequence for **arbitrary discrete
  groups**, saying the profinite owners do not cover them. This is the largest local restatement
  of Layer 4.
- InductionRestrictionPartII (#1154): the central-extension five-term sequence by hand ("neither a
  spectral-sequence API nor Hopf's formula is assumed to be in the library").
- ModularCurvesPartII (#913) §15.4: the cohomology sequence for one amalgam, citing Serre's
  *Arbres* II §2.8. AutomorphyLiftingBeyondTaylorWiles (#1824) and the board design
  ArithmeticLocallySymmetricSpacesPartII (WM.5) consume that sequence.
- NoncommutativeAndEquivariantIwasawa (#1307) §F.3 and ArithmeticGaloisDuality (#858) R02.2: the
  Hochschild–Serre sequence for **profinite** groups. Finite groups are only an instance, and
  infinite discrete groups are not covered.

Since the general theory has no owner, the verdict is not `duplicate`. Since the theory is not an
extension of a single roadmap in the same direction, it is not `part-ii`. ProfiniteCohomology and
its Part II go in the profinite/Galois direction, and AlgebraicTopology goes in the topological one.

**Name.** `CohomologyOfGroups` is used by no roadmap on main, no open pull request
(`roadmaps overlaps` reports none), and no other board package.

## 2. Generality changes made in target.md

1. Hyperhomology and hypercohomology over any `k`, in both variances, for bounded-below complexes,
   identified with derived-category Tor/Ext. SchemeKTheoryOperations §6.7 and K3BlochGroups §4.1
   are instances.
2. The cup product for any equivariant bilinear pairing, not only `M ⊗ N`.
3. The filed "agreement with the continuous cup product for a profinite group" is restated
   correctly:
   - agreement for discrete topological groups, through a named comparison isomorphism;
   - for profinite groups, the continuous cup is the colimit of the discrete cups over the finite
     quotients.

   Comparing the abstract group cohomology of a profinite group with its continuous cohomology
   would be false in general.
4. The double coset formula for any group with one subgroup of finite index. The filed Layer 7 was
   titled "finite groups"; the finite case is a Check.
5. Stable elements for every module, in cohomology, homology and Tate cohomology. The
   `ℤ₍ᵣ₎`-coefficient form of K3BlochGroups §5.2 is an instance.
6. Free-action periodicity stated algebraically: an exact sequence of cohomologically trivial
   modules from `ℤ_χ` to `ℤ`. The CW homology-sphere form is the geometric instance, with the
   orientation character tracked (period dividing `2(n+1)`).
7. The degree-`m` form of the five-term sequence (HS53 Ch. III Thm. 2), as well as the five-term
   sequences themselves.

## 3. Direction of supply (the main correction to the filed plan)

The filed text says the roadmap "records the comparisons" with SchemeKTheoryOperations §6.7,
K3BlochGroups §4.1, NoncommutativeAndEquivariantIwasawa §F.3 and ArithmeticGaloisDuality R02.2.
It also says that "after this roadmap merges those sections are revised to import it".

Both cannot hold. Recording a comparison makes those roadmaps suppliers, so they would have to
come earlier in the merge order; importing makes them consumers, so they would have to come later.

target.md recommends a single direction:
- CohomologyOfGroups depends only on main, the pinned libraries and the two spectral-sequence
  roadmaps.
- It is ordered before every roadmap that restates a piece of it: merge-order lines 30, 37, 61,
  64, 71, 139 and 293.
- Their comparisons and imports are made in their own revisions; the Consumers section lists
  which section imports which target.
- Only comparisons with roadmaps on main (ProfiniteCohomology, AlgebraicTopology) are stated here.

The alternative, and its cost, is recorded as Risk 3 for the designer.

## 4. Sources

**Read for this triage** through the sources service; every locator in target.md was checked in
the cached text:
- **HS53**: AMS open back file, `publisher-open`, certified. It treats arbitrary groups. It gives
  Ch. I §5 Prop. 5, Ch. I Prop. 7, Ch. II Thms. 2–3, Ch. III §1, §3, Thms. 2 and 4. Its
  introduction (HS53 line 30–38) says its two spectral sequences are not known to agree beyond
  `E₂`, which is Risk 2.
- **Loh19**: author's page, certified. Thm. 1.5.1, Thms. 3.2.12 and 3.2.18, Prop. 3.2.13,
  Cors. 3.2.21 and 3.2.23, Thms. 4.3.3 and 4.3.7. Printed page = PDF page − 8.
- **MilneCFT**: author's page, certified. Ch. II §1 treats an arbitrary group; Props. 1.38–1.39
  are on pp. 73–74.
- **SerreArbres**: Astérisque 46 on Numdam, certified. II §2.8 Prop. 13 and the amalgam example on
  pp. 167–169.
- **Hutchinson13**: arXiv, certified. It restates the stable-element theorem (§3, p. 11, citing
  Brown III.9–III.10) and Swan's p-period theorem (Thm. 3.1, p. 12).

**Recorded without the text:**
- **NSW**: the service fetched the authors' landing page, not the PDF of version 2.3. It is cited
  only for the profinite comparisons, through ProfiniteCohomology and ArithmeticGaloisDuality,
  with locators for the designer to confirm.
- **Brown82** and **CE56**: paywalled and recorded `uncertified` with chapter locators, as the
  issue form asks ("cite by locator"). Brown is a checklist only; target.md follows neither its
  chapter order nor CE's.

**Waived** (cited by locator, without the text): **SwanPPeriod60**, Swan, *The p-period of a
finite group*, Illinois J. Math. 4 (1960), Thms. 1–2.
- Hutchinson attributes the p-period theorem used by K3BlochGroups and by this target's 8.2 to
  this paper, not to the *Periodic resolutions* paper the issue form lists.
- The first run requested it: the Project Euclid PDF came back as a bot-protection page, CORE
  returned 403, and the author's bibliography page has no PDF. A human has since waived it.
- 8.2 cites it by locator. Its statements were checked against Hutchinson's open restatement
  (Hutchinson13 line 499–504).

**Dropped from the filed list:**
- Lyndon, Duke Math. J. 15 (1948): historical precursor, superseded for every statement by HS53
  (open). Its DOI did not resolve and it is not open.
- Swan, *Periodic resolutions for finite groups*, Ann. of Math. 72 (1960) (JSTOR,
  DOI 10.2307/1970135): it concerns realising periods by finite complexes, a non-goal. The first
  fetch used a wrong DOI, which resolved to an unrelated paper; that entry was removed.
- Hopf (1942): EuDML gave only a record page, and the service attached another paper's metadata.
  Hopf's formula is cited from Löh (open) instead.
- Chiswell (1976): paywalled at the publisher, and its theorem number could not be checked. Serre's
  Prop. 13 (open) covers 6.1.

**Missing texts:** none. Every citation is certified, uncertified (paywalled, by locator) or
waived, and the job asks for nothing.

## 5. Untrusted text

No issue, pull-request, roadmap or fetched text contained instructions to run commands, change
files outside the job, use credentials or contact services. Nothing to quote as suspicious.

## 6. Files written

- `packages/CohomologyOfGroups/target.md`
- `packages/CohomologyOfGroups/sources.toml`: 9 sources, including the waived SwanPPeriod60;
  `sources check` reports 0 problems.
- this report
- no `needs-references.toml`: nothing is missing.

`roadmaps resolve` on target.md (second run, against main and the index of 14:50) reports only
SpectralSequencesAndConvergence and its Part II as "found nowhere". They are a board design and a
board target, so they are not yet in any pull request. No Lean name is unresolved.
