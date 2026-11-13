# TARGET-SpectralSequencesAndConvergencePartII: triage report

**Verdict: part-ii**, roadmap `SpectralSequencesAndConvergencePartII`, base
`SpectralSequencesAndConvergence`. The brief is `packages/SpectralSequencesAndConvergencePartII/target.md`.

## What was searched

- **Open targets and designs on the board** (consolidation): CohomologyOfGroups (#14491; full issue
  text read), FinitenessAndDualityOfGroups (#14492), VirtualFundamentalClassPartII (#13859). Also
  the base design `packages/SpectralSequencesAndConvergence/` (target, design README, review state).
- **Roadmaps on main and at the heads of the open pull requests**, with `roadmaps grep`, by object:
  Grothendieck / composite-functor spectral sequence, Cartan–Eilenberg resolutions, hypercohomology
  and hyper-derived functors, Künneth and universal-coefficient spectral sequences, change of rings
  for Tor and Ext, balancing of Tor, acyclic assembly, Bockstein spectral sequence and higher
  Bocksteins, multiplicative spectral sequences and Leibniz rules on pages, Leray, Čech,
  Hochschild–Serre, local-to-global Ext, `rightDerivedFunctorPlus`. `roadmaps overlaps` for
  ArithmeticGaloisDuality; `roadmaps resolve` on the finished `target.md` (nothing unresolved).
- **Roadmaps read in the relevant sections**: DerivedModuleAlgebra §S.1; AlgebraicTopology §5.1;
  SchemeAndStackFoundations §§2.2, 2.7, 2.15; DGFloer Layer 1 items 2–3; EnhancedDerivedSheaves §0.4;
  TopologicalSheafCohomology §1.4; ArithmeticGaloisDuality §D7.1 and R02.2 (§D7.1 re-read at its
  current head in this run); ArithmeticStatisticsPartVIII
  §5.16; InverseGaloisAndArithmeticFundamentalGroupsPartII Layer 5; NoncommutativeAndEquivariantIwasawa
  §F.3; ArithmeticLocallySymmetricSpaces ALS.1.7; CrystallineCohomology CR.3.3; K3BlochGroups;
  TangentialBordism.
- **Pinned libraries**: Tau Ceti `Algebra/Homology/SpectralSequence/*`, `SpectralObject/*`,
  `TotalComplex.lean`, `Monoidal/Homology/Kunneth/*`, `Monoidal/KFlat/*`, `UniversalCoefficient/*`,
  `PrincipalIdealRing.lean`, `CategoryTheory/Monoidal/Tor.lean`, `CategoryTheory/Abelian/LeftDerived.lean`,
  the Bockstein files of continuous cohomology; Mathlib `Algebra/Homology/SpectralObject/*`,
  `SpectralSequence/*`, `TotalComplex*.lean`, `DerivedCategory/{Plus,RightDerivedFunctorPlus,
  DerivabilityStructureInjectives,Ext/*}.lean`, `CategoryTheory/Triangulated/TStructure/SpectralObject.lean`,
  `CategoryTheory/Abelian/{Ext,RightDerived,LeftDerived,Projective/Ext,Injective/Ext}.lean`,
  `CategoryTheory/Monoidal/Tor.lean`.
- **Merge order** positions of every supplier and consumer named in the brief.

## What was found

1. **No overlap with the open targets and designs.** CohomologyOfGroups is a *consumer*: its
   statement says every spectral sequence is obtained from this Part II, and its extension sequence
   is "stated once, as the composite-functor sequence". FinitenessAndDualityOfGroups (group
   finiteness, duality, Farrell cohomology) and VirtualFundamentalClassPartII (stacks, Chow groups,
   virtual classes) share no object. No merge.
2. **The base is a board design, not a roadmap.** SpectralSequencesAndConvergence is in its sixth
   review round (needs changes), not on main, not in a pull request, not yet in `ORDER.txt`. It owns
   the convergence language, filtered complexes and exact couples, and explicitly excludes
   multiplicative structures. This target continues it in the same direction (standard
   constructions on its convergence structures, plus products), so **part-ii**. Merging into the
   base design was rejected: the target is broader than that design's scope, not narrower, and the
   base is near the end of its review.
3. **Already owned, so imported and not re-planned** (each named with its section in `target.md`):
   - DerivedModuleAlgebra §S.1 (main) owns the first-quadrant double-complex sequence in an abelian
     category with `E₂`, edge maps, five-term sequence, exact-rows comparison and naturality.
   - Tau Ceti owns the first-quadrant row/column filtration sequences, the first-quadrant
     "quasi-isomorphism on rows ⇒ on totals" theorem and acyclic-assembly form
     (`HomologicalComplex₂.quasiIso_total_map_of_rows`, `quasiIso_totalAugmentation_of_rows`), the
     Künneth short exact sequence over rings of global dimension ≤ 1, and the universal coefficient
     sequence. The filed "classical short exact sequences over a PID and over any hereditary ring"
     are therefore Checks (two-column degenerations), not targets.
   - Mathlib's `Abelian.Ext` is already computed from projective and from injective resolutions, so
     the balancing of Ext is a Check; the balancing of Tor (`Tor ≅ Tor'`) is an open Mathlib TODO
     and stays a target.
   - **ArithmeticGaloisDuality §D7.1** (#858, merge order line 61) states the general
     composite-functor sequence as a target with a proof route (abelian categories, enough
     injectives, the acyclicity condition, finite filtrations, edge maps). The filed "Why" calls it
     "named in passing"; that is inaccurate. Layer 3 imports it and owns only what it lacks: the
     composition criterion on `D⁺` (Stacks 13.22.1), the form for complexes and its identification
     with the second hypercohomology sequence (Stacks 13.22.2), the five-term sequence, naturality,
     and the homological and mixed-variance duals.
4. **Not owned anywhere**: Cartan–Eilenberg resolutions and hyper-derived functors as stated
   targets (ArithmeticGaloisDuality and NoncommutativeAndEquivariantIwasawa use them only inside
   proofs); the third-quadrant and half-plane double-complex cases; the general acyclic assembly
   lemma; Tor balance; the general Künneth sequence for complexes (AlgebraicTopology §5.1 owns only
   the singular-homology instance); change-of-rings for ungraded Tor and Ext; pairings on pages of
   filtered complexes and exact couples (DGFloer owns only the Serre instance); the Bockstein
   spectral sequence (no match anywhere; Tau Ceti has only first-order Bockstein maps for
   continuous cohomology).
5. **Graded instance elsewhere.** ArithmeticStatisticsPartVIII §5.16 (#1179, line 146) plans graded
   Tor balance, universal-coefficient, hyperhomology and change-of-rings sequences over graded,
   possibly noncommutative, algebras on a graded carrier. These are instances in another carrier,
   recorded as Checks. InverseGaloisAndArithmeticFundamentalGroupsPartII declares a gap
   ("dga-graded-tor-spectral-sequences") asking DGAInfinity for the same sequences; DGAInfinity on
   main has none. Both are consumer leads.

## Generality decisions

- **Layer 1**: totalisations for finite antidiagonals (any abelian category), `Tot^⊕` and `Tot^Π`
  (to be defined; Mathlib has no product total complex). Half-plane convergence is reduced to the
  base's §5.4 and §7.5, so no convergence theory is restated. Stacks proves the half-plane assembly
  lemmas only for abelian groups and says so; the brief asks the design to state the exactness
  axioms its proofs use and to fall back to module categories if necessary.
- **Layer 4 Künneth**: widened from "two complexes, one bounded below and flat" to `K, L ∈ D⁻(R)`
  with the derived tensor product (Stacks proves `D^b`). The flat form becomes a corollary. Tor
  statements are for commutative rings because Mathlib's `Tor` needs a symmetric monoidal category;
  Ext statements hold for any rings.
- **Layer 5**: kept at the generality of written proofs (May's primer and Massey: modules and
  exact couples of modules). Douady's pairing of spectral systems is *stated* in his exposé with
  the proof left to the reader, so it is conditional. Products on hypercohomology and
  composite-functor sequences have no open written source; flagged for the design to source or drop.
- **Layer 6 Bockstein**: widened from "torsion-free abelian groups / flat modules over a PID with a
  prime" to any commutative ring `A`, a nonzerodivisor `f` and an `f`-torsion-free complex (the
  Stacks setting of §15.97). The limit page `(H^n/f^∞-torsion) ⊗ A/f` holds under bounded
  `f`-power torsion in degrees `n` and `n + 1`, which over a PID is implied by the filed
  finite-type hypothesis. I derived this from the exact-couple tower formulas of base §6.2
  (`Z_{r+1} = k⁻¹(im f^r)`, `B_{r+1} = j(ker f^r)`) and checked it on `ℤ →p^r ℤ`. No open source
  states the limit-page formula; McCleary's (paywalled) does, by locator.

## Sources

Fetched through the sources service and recorded certified in `sources.toml`: `stacks-012K`
(Homological Algebra), `stacks-05QI` (Derived Categories), `stacks-more-algebra` (More on Algebra),
`may-primer` (author's page), `hatcher-at` (author's page), `douady1959` (Numdam). Every line
locator in `target.md` was read in the cached text. One fetch by tag `05E1` resolved to the
Commutative Algebra chapter, not More on Algebra; that entry was removed before the correct fetch.
May's primer prints no year; `year = 2009` is the PDF's creation date, noted in `version_note`.

Recorded `uncertified`, cited by locator only, following the base's practice: `weibel1994`,
`mccleary2001`, `cartan-eilenberg1956`, `massey1954` (JSTOR, DOI 10.2307/1969719). The service had
listed Weibel and Massey as missing because their landing pages are paywalled. They are settled as
uncertified and are not in `needs-references.toml`. Their chapter, section and theorem numbers are
marked "to be confirmed by the designer".

**`grothendieck1957`, answered since the first run.** The first run could not read it: Project
Euclid served a bot-protection page. An operator has since supplied a local copy of the published
paper, and the worker recorded it as `operator-local` and certified. This run read Chapter II
§§2.4–2.5 and Chapter III §§3.7–3.8 in the cached text and cites them by line:

- the two spectral sequences of a bicomplex with finite antidiagonals, (2.4.1): line 1226–1235
  (target 1.1); the sign convention of the total differential, line 1266–1268 (Carriers);
- the two hyperhomology spectral sequences of a left exact functor on bounded-below complexes,
  (2.4.2), line 1236–1252, and their construction from Cartan–Eilenberg resolutions, which are
  asserted unique up to homotopy with the proof referred to Cartan–Eilenberg, line 1253–1299
  (targets 2.1–2.3); the left-derived and contravariant variants, line 1304–1308 (2.4); the
  unbounded case for functors of finite injective dimension, signalled without proof at line
  1299–1304 and therefore not made a target;
- Théorème 2.4.1, the composite-functor spectral sequence for objects, line 1330–1337, with its
  construction at line 1309–1329; Remarque 1, the effaceability form of the acyclicity
  hypothesis, line 1338–1342 (now part of 3.1); Remarque 2, computation from an `F`-acyclic
  resolution as the second hyperhomology sequence of `G`, line 1343–1347 (3.2); Remarque 3, the
  degenerate cases, line 1348–1360 (2.3); Propositions 2.5.4–2.5.5 and the Corollaire, line
  1516–1570 (3.2, and an optional comparison in 3.3);
- the Leray spectral sequence obtained from Théorème 2.4.1, line 2421–2425 and Théorème 3.7.3 at
  line 2443–2456, and the Čech sequence of a covering obtained either from a bicomplex or from
  Théorème 2.4.1, line 2493–2509 (Checks).

The filed locator calls §2.4 "derived functors of a composite functor"; the section is titled
*Suites spectrales et foncteurs spectraux*, and the composite-functor statement is its Théorème
2.4.1. The manifest entry keeps the worker's recorded fields and gains these line locators and
its `cited_for`. The paper covers Layers 1–3 and two Checks, alongside Stacks. It changes no
target's generality. Grothendieck's theorem is for objects; Stacks Lemma 13.22.2 is the
derived-category form that 3.2 states.

No text is missing in this run, so no `needs-references.toml` was written. `sources check`
reports 0 problems on the merged manifest (11 entries), and `sources cache` finds every certified
text in the cache.

## Changes in this run

- The first run's `target.md`, report and manifest were never committed to the board, because the
  job was parked for the references request. They were restored from that run's unsubmitted
  output, and the manifest was merged with the worker's `grothendieck1957` answer.
- `grothendieck1957` locators were added to Carriers, 1.1, 2.1–2.4, 3.1–3.3, the Leray and Čech
  Checks, Sources and Risks (the open spine). Target 3.1 gains the effaceability form of the
  acyclicity condition. Target 2.3 gains the `F`-acyclic computation and the two degenerate cases
  as corollaries. Target 3.3 gains an optional commuting-square comparison.
- **Drift since the first run.** The base had a sixth review (needs changes). Its blocking finding
  shifts the total degree in §7.4's convergence of an exact couple to its *limit*. The review
  keeps the colimit theorem and §7.5 as they are. This roadmap uses only those: 1.2 for
  `Tot^Π`, and 6.2, where the Bockstein couple converges to its colimit. The Risks section now
  says so. The base's section numbers are unchanged at the board head. ArithmeticGaloisDuality
  §D7.1 (#858) is unchanged at its head. The merge-order positions are unchanged: line 17
  StableHomotopyKTheory, line 61 ArithmeticGaloisDuality, line 146 ArithmeticStatisticsPartVIII.
  The board still lists only CohomologyOfGroups, FinitenessAndDualityOfGroups and
  VirtualFundamentalClassPartII as open targets and designs, and no new pull request touches
  these objects. The `roadmaps grep` search for composite-functor and Grothendieck spectral
  sequences finds only CrystallineCohomology, ArithmeticGaloisDuality and
  InverseGaloisAndArithmeticFundamentalGroupsPartII, as before.
- A wording slip in the Risks section was corrected. ArithmeticStatisticsPartVIII (line 146) is
  *later* than this roadmap, which goes in after line 61, so it can import this roadmap.
- `roadmaps resolve` on the final `target.md` finds no unresolved cross-roadmap citation or Lean
  name. The tool did not check Mathlib names, so they were checked by hand in the pinned Mathlib:
  `rightDerivedFunctorPlus`, `DerivedCategory.Plus`, `totalFlipIso`, `Tor`, `Tor'` and the open
  balance TODO in `CategoryTheory/Monoidal/Tor.lean`, `IsFirstQuadrant`, `IsThirdQuadrant`,
  `spectralObjectMappingCone`, `TStructure.spectralObject`, `Functor.rightDerived`,
  `Functor.leftDerived`.

## Risks recorded for the design

The base may still move its section numbers. Its round-6 repair of §7.4's limit degree does not
touch the colimit and §7.5 clauses that this roadmap uses. The ownership of the composite-functor sequence: a
cleaner single direction would move ArithmeticGaloisDuality §D7.1 here and place this roadmap
before line 61, which needs a revision of #858. The graded duplicates in
ArithmeticStatisticsPartVIII §5.16. Carrier gaps at the pin: no product totalisation, no `D⁻`
left derived functor, no derived-functor composition, and no comparison of classical and `D⁺`
derived functors. Half-plane generality. Products without written proofs. Index offsets (periodic
Bockstein filtration, `Tor_{−p}`, Mathlib's page shift). The uniqueness of Cartan–Eilenberg
resolutions up to homotopy has no open written proof: Grothendieck asserts it and refers it to
Cartan–Eilenberg. How `Suggested.lean` can state headlines
whose convergence clause lives in the base.

## Suspicious text

None. No issue, pull request, roadmap, review or fetched page, including the Grothendieck text read
in this run, contained instructions addressed to the worker.

## Not done

No Lean was run (the triage writes none). No GitHub writes. Nothing in the triage waits on a
missing text.
