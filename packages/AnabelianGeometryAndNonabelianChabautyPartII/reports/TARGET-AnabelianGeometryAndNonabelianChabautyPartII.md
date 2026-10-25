# TARGET-AnabelianGeometryAndNonabelianChabautyPartII triage report

Verdict: **duplicate**. The owner is **GaloisSectionsPadicPeriodMaps**, a board package on board pull request #1205 at head 73538ce. The final targets are in its Layer 9 (§§9.3–9.5), with §§0.3–0.5, 1.8 and 9.1. No new design job should be created.

## What the target is

The issue form gives only a title ("Anabelian geometry and nonabelian Chabauty, Part II"). The stated reason is that the target was queued in the explorer as DESIGN-AnabelianGeometryAndNonabelianChabautyPartII. I read the board issue (#231) and the explorer issue it links (CBirkbeck/tauceti-explorer #3475) read-only, as data.

The explorer job's brief says the paper extractions propose exactly one continuation in this direction: "Part II: Galois sections and p-adic period mappings", from Betts and Stix (Annals 201, 2025). It is to be designed as GaloisSectionsPadicPeriodMaps, with final theorems Theorem A, Theorem B and Theorem 6.5. So the target's content is the Betts–Stix Part II. Nothing in the issue or the explorer brief asks for anything broader.

## What I searched

- **The base roadmap.** AnabelianGeometryAndNonabelianChabauty is open as roadmap pull request #1021 (head 63d51d5); it is not on main.
  - I read its scope, conventions and supplier contracts, the target list of Layers 3–7, all of Layer 7 (§§7.0–7.6), its downstream consumers and its references, and its `Suggested.lean`.
  - It stops at §7.1: section classes, the section map, injectivity, the section conjecture as a named proposition, and cuspidal packets. Beyond that it covers Kim's dimension conjecture with its conditional routes (§§7.2–7.4), the thrice-punctured line (§7.5) and Kim's eventual-equality conjecture (§7.6).
  - It plans no Selmer sections, no finite descent comparison and no Lawrence–Venkatesh obstruction.
- **Board packages.** I read every folder name under `packages/`, the package index for this job and `merge-order/ORDER.txt`.
  - `packages/GaloisSectionsPadicPeriodMaps/design/README.md` is titled "Anabelian geometry and nonabelian Chabauty, Part II: Galois sections and p-adic period mappings". Its "Structure" section has a merge entry naming this very job. That entry says the queued DESIGN-AnabelianGeometryAndNonabelianChabautyPartII came from route 1 of the Betts–Stix extraction and would design the same Part II under another id. It asks for that job to be retired.
  - The package's reviews are in its `reports/`: REV-PKG~3 accepted it, conditional on seven declared supplier gaps. RT~1b (red team, needs_changes) lists one P2 and two P3 findings on supplier attributions.
  - Its package README is not in this checkout. I read it at the head of board pull request #1205 (open, head 73538ce): ten layers, with Theorems A and B at §§9.4–9.5. It is at line 206 of the merge order, after its base (line 196) and all its suppliers.
- **The three open targets.** Each was compared by mathematical object:
  - RefinedTraceMethodsPartII: Hochschild, cyclotomic and refined trace methods.
  - ProetaleCohomologyOfPAdicCurvesAndTowers: pro-étale cohomology of p-adic curves and the Drinfeld tower.
  - RationalAnalyticPrismatization: rational analytic prismatization and its stacks.
  - None of them concerns Galois sections, Selmer sections, finite descent or Lawrence–Venkatesh loci. No merge.
- **Neighbouring packages.** I read the opening and scope of each:
  - MordellLawrenceVenkateshPartII: hypersurfaces and Shafarevich finiteness by period maps.
  - HeightsRationalPointsAndObstructionsPartII: uniform Bogomolov and uniform Mordell–Lang.
  - InverseGaloisAndArithmeticFundamentalGroupsPartII: Hurwitz homological stability.
  - EllAdicHomotopyTypesAndWeights, EtaleHomotopyTypes, TropicalAndBerkovichArithmetic, ColemanIntegrationPartII, MotivicStructuresInModuliOfCurves.
  - None owns the Betts–Stix theorems. The only package that cites GaloisSectionsPadicPeriodMaps is its own design.
- **Open roadmap pull requests** (`roadmaps grep`), for Betts, Selmer sections, the finite descent locus, the section conjecture, Harari–Stix, the Lawrence–Venkatesh locus, Galois section, Bresciani and birational sections.
  - Betts–Stix is cited only as a source of comparison inputs: CohomologyComparisons (#1064, Propositions 3.19–3.20, a supplier of the owner), PadicHodgeTheory (#1062) and SchemeAndStackFoundations.
  - The Bresciani hits in AlgebraicModuliForArithmeticGeometry and ShimuraCompactifications concern stack-theoretic lemmas, not section finiteness.
  - No other roadmap owns Theorems A or B.
- **Other possible continuations of the base**: Neukirch–Uchida, Coates–Kim, Betts–Dogra, Ellenberg–Hast, and Pop's birational anabelian theorem. `roadmaps grep` found no match on main or in any open roadmap pull request. The board packages do not mention them either. They are outside this target (see the brief's Scope).
- **Pinned libraries** (Mathlib 6b7abb3, Tau Ceti a91d3aa, from `lake-manifest.json`):
  - GitHub code search for "section conjecture", "anabelian", "GaloisSection" and "SectionConjecture" found nothing in either library. The Tau Ceti "Chabauty" hits are power-series and formal-group helpers, not Chabauty theorems.
  - Tau Ceti's `ContCohomology/Nonabelian` directory returns 404 at the pinned revision, as the base roadmap says.
  - The library does not own the target.

## Sources

I fetched three works through the sources service from arXiv (open-repository, certified) and read the numbered extractions:

- `betts-stix-2022`, arXiv:2204.13674v1:
  - Definition 1.1 (line 36) and Theorem A (line 44), p. 1;
  - Theorem B (line 66), p. 2, with the Harari–Stix and Stoll context at lines 57–64;
  - §1.1 points (1) and (2) (lines 109–115);
  - Definition 2.17 and Remark 2.18 (lines 632–642);
  - Definition 6.2, Lemma 6.4 and Theorem 6.5 (lines 2247–2286);
  - Theorem 7.1 (line 2812).
  - I checked the publication record of the Annals version (201 (2025), no. 1, 79–166, DOI 10.4007/annals.2025.201.1.2) on the journal's page. I did not compare its numbering, and the manifest says so.
- `harari-stix-2010`, arXiv:1005.1302v2: Theorem 2.1, p. 11 (line 391).
- `stoll-2007`, arXiv:math/0606465v3: §2, p. 4 (line 129); Definition 5.4, p. 16 (line 633); Conjecture 9.1, p. 38 (line 1536). The owner's references cite Definitions 5.2 and 5.4. The finite descent locus itself is Definition 5.4, and I cite that.

Running `sources check` on the manifest reports 0 problems. No text was unreadable, so I wrote no `needs-references.toml`. No source passage was copied.

## Why duplicate, not merge-into or part-ii

- **Not merge-into.** That verdict joins an open target or design on the board, and GaloisSectionsPadicPeriodMaps is neither: it is past design and review, an accepted package now in red team. The brief's step 1 sends a target that a board package already plans to `duplicate`, naming the owner.
- **Not part-ii.** The target *is* a Part II, but its Part II already exists and is designed. Opening a second design under the name AnabelianGeometryAndNonabelianChabautyPartII would plan the same theory twice. That violates the "imported, never planned again" principle, which the owner's own Structure note flags.
- **Generality.** The owner states the theorem at the generality the source supports. §9.3 gives finiteness at every self-conjugate finite place of an arbitrary number field. Theorem A (no CM subfield) and Theorem B are its specialisations. So there is no more general statement for a new design to take up.
- **Name.** The header names GaloisSectionsPadicPeriodMaps, where the work lives. No new folder is proposed. For a duplicate the Name line creates nothing; the closing note names the Owner.

## Risks carried into the verdict

- The owner is in red team with fixable supplier-attribution findings. If it were withdrawn, this target should be reopened under the Betts–Stix scope.
- The owner's acceptance depends on seven supplier gaps.
- The base is still pull request #1021.
- The Annals numbering is unchecked.

## Untrusted text

The issue text, the explorer brief, other packages' READMEs and reviews, and the fetched papers were all treated as data. The explorer brief contains working instructions for explorer workers: run a checker script, write packets, do not run git. These are addressed to that job, not to this one, and I followed none of them. No text asked for credentials, network tools or writes outside this job. No GitHub writes were made.
