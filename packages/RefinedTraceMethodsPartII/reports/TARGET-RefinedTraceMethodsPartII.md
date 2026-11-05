# TARGET-RefinedTraceMethodsPartII: triage report

**Verdict: `part-ii`. Name RefinedTraceMethodsPartII, base RefinedTraceMethods.** The brief is `packages/RefinedTraceMethodsPartII/target.md` and the manifest is `packages/RefinedTraceMethodsPartII/sources.toml`.

## What was filed

The issue gives only a title ("Hochschild, cyclotomic and refined trace methods, Part II") and says it was queued in the explorer. It has no statement and no sources. No target was merged into it. The board holds no explorer routing list for this Part II: I checked `packages/RefinedTraceMethods/` (metadata, review, reports) and the board metadata. The scope therefore had to be derived from where the base stops and from what no roadmap owns.

## Step 0: consolidation with open targets and designs

| Open item | Objects | Overlap? |
| --- | --- | --- |
| DESIGN-ProetaleCohomologyOfPAdicCurvesAndTowers (#2083) | Pro-étale cohomology of p-adic curves and the Drinfeld tower (`packages/ProetaleCohomologyOfPAdicCurvesAndTowers/target.md`) | None. No THH, TC, K-theory or integral syntomic calculations. Its own report also found no overlap with this target. |
| TARGET-AnalyticStacks (#2078) | Light solid Q_p, analytic stacks and their six functors, nuclear modules with descent, Fredholm/connectivity criteria | None. This brief keeps out of nuclear/solid analytic geometry. Efimov-style continuous invariants are listed as a separate unowned topic, not planned here. |
| DESIGN-RationalAnalyticPrismatization (#2025) | Rational analytic prismatization with Q_p coefficients (Gelfand stacks, analytic de Rham/Hyodo–Kato stacks, twistor stack) | None. This brief uses only integral relative and filtered prismatic cohomology over δ-rings, for finite chain rings. `packages/RationalAnalyticPrismatization/target.md` says explicitly that it does not continue the integral prismatic chain. |

None of these plans the same theory, so the verdict is not `merge-into`.

## Step 1: is it planned already?

**Base roadmap.** I read RefinedTraceMethods at its open PR #1493: scope, all nine layers' headings, §§2.6, 2.9–2.10, 4.17–4.20, 8.1, 8.7–8.8, Downstream consumers and References.

- The base owns the general machinery but not the calculations.
- §4.19 states that the full calculation of K_*(k[t]/t^n,(t)) is not one of its targets.
- §4.18 mentions the truncated polynomial towers only as an input.
- Downstream consumers announces later applications that use the nilpotent and henselian trace theorems, continuity and truncating excision.
- Its only use of Krause–Nikolaus is the free E₁ form of Bökstedt periodicity (§2.6). The DVR-quotient part is not used.

**Searches by object.** I ran `roadmaps grep` over main and all 367 open heads, and grep over every board package (README, design, target files). The patterns covered: truncated polynomial; coordinate axes; cuspidal curve and y^a − x^b; bi-relative and Geisser–Hesselholt; finite chain ring, Angeltveit and Brun; Z/p^n K-theory; prismatic cohomology relative to a δ-ring; filtered prismatic cohomology; Krause–Nikolaus and quotients of DVRs; O_K/π^n; big de Rham–Witt; syntomic. I also searched the unowned neighbours: polygonic spectra, Witt vectors with coefficients, Dotto; real THH and real TC; logarithmic THH; Lindenstrauss–McCarthy and K-theory of endomorphisms; Kaledin; Antieau–Vezzosi and HKR in characteristic p; Elmanto–Morrow; Ausoni, redshift, Hahn–Wilson; Clausen–Mathew hyperdescent.

**Findings.**

- **KTheoryFiniteLocalFields (#1281)** owns the Hesselholt–Madsen route. That covers pointed-monoid THH in the classical genuine model (§5.16), the big Witt comparison (§5.16a), λ-graded TR of regular noetherian F_p-algebras, K of truncated polynomial algebras over regular noetherian F_p-algebras and in characteristic zero (§5.17), log THH of a DVR (§5.9) and K of local fields (Layer 6). It owns no coordinate axes, cusps, perfectoid bases or finite chain rings. Its truncated-polynomial theorem becomes a Check of target 5, and its TR theorem an input to target 2.
- **GeneralAlgebraicKTheoryPartII** (board design) owns purity, redshift and CMNN. The height-one statement L_{T(1)}K(R) ≃ L_{T(1)}K(R[1/p]) is there, so it is only a Check here.
- **ArithmeticKTheory (#1418)** owns étale descent with ℓ invertible.
- **MotivicEtaleKTheory (#1470)** says outright that it adds no "finite-coefficient étale descent, norm-residue theorem, p-adic regulator, arithmetic K-group computation or trace theory".
- **PrismaticCohomologyPartIII (#1070)** §6.28 leaves out the K-theoretic consequences (BS22 Corollaries 14.2–14.3). Base §8.7 takes the sheaf statement.
- **HermitianKTheoryOfPoincareCategories (#1266)** has no real trace.
- **ChromaticHomotopyTheory** (board) consumes the base and owns no K-computations of rings.
- **No owner anywhere** for: K-theory of coordinate axes; planar cusps; O_K/ϖ^n (finite chain rings); truncated polynomials over perfectoid rings; relative/filtered prismatic cohomology over δ-rings.
- **Pinned libraries.** A GitHub code search of Tau Ceti finds p-typical Witt vector files and nothing on THH, TC, algebraic K-theory, cyclic homology or big Witt vectors. Mathlib has p-typical `WittVector` and no big Witt vectors. A code search shows only the default branch, so this is a lead, not a proof at the pinned commit. Nothing in the pinned libraries owns any target here.
- **A board design guess.** The board design `packages/SchemeKTheoryOperationsPartII/design/README.md` calls continuous K-theory of thickenings "RefinedTraceMethodsPartII's concern". That was a guess by another design and is not a filed statement. Formal towers and continuity mod p are already base §4.18. Efimov-style continuous invariants of inverse limits remain unowned and are recorded as a separate possible target.

So the verdict is not `duplicate`.

## Step 2: why Part II and not a new design

The chosen scope uses exactly the exports the base announces for later applications: §§2.9–2.10 (TC formula; monoid rings and the unstable Frobenius), §4.17 (DGM, henselian rigidity, Goodwillie), §4.18 (K^inv truncation, Land–Tamme excision, KABI, continuity) and §8.7 (syntomic K-sheaves). It begins at the calculations the base declines in §4.19. That is the same direction as the base, starting where the base stops, so the verdict is `part-ii` and the name is `RefinedTraceMethodsPartII`. The base is still an open PR, and the brief cites its section numbers at head 9dd2691.

**Why these targets, and not the other unowned trace topics.** The title alone would allow almost any trace-theoretic subject. I kept the Part II to one coherent family: closed calculations of K-groups of singular and finite rings by the base's methods. The base points to this family itself, and several current papers settle it in full generality (all p, all n, all p-adic fields, all perfectoid rings). The other unowned topics share only a supplier or an area: real THH and TC, TC with coefficients, log THH beyond DVRs, Efimov inverse limits, and Kaledin's degeneration with the characteristic-p HKR results. Each needs different foundations (C₂-genuine and Poincaré categories, polygonic spectra, log rings, large categories, smooth proper dg categories). Each could be filed as its own target. Folding them in would turn the Part II into a list of topics with no common thread.

## Step 3: generality

- **Coordinate axes in the plane.** Stated over regular noetherian F_p-algebras (the source's generality). The general TC formula of Theorem B holds over every F_p-algebra, and with finite coefficients over every ring.
- **Coordinate axes in d-space.** Every prime, including p = 2, over perfect fields; in characteristic zero over ind-smooth Q-algebras. No source gives the regular-F_p-algebra extension, which is named as a risk and not asserted.
- **Cusps.** All coprime a, b ≥ 2 over perfect F_p-algebras.
- **Truncated polynomials.** Every perfectoid ring, generalizing KTheoryFiniteLocalFields' perfect-field statement, which becomes a Check. The F-smooth extension is optional.
- **Finite chain rings.** Every p-adic field K and every n. This covers all quotients by nonzero proper ideals, with ℤ/p^n as the special case. The even vanishing bound is exact, and the weaker bound of AKN Remark 5.4 is recorded as not recovering characteristic p.

## Steps 5–6: suppliers, consumers, sources

The suppliers and their merge-order lines are listed in the brief. All are earlier than RefinedTraceMethods (line 220) or are the base itself. None of them uses these calculations, so the supply direction is single. The relative-to-δ-ring prismatic package has no owner. The brief assigns it here only as far as target 6 needs it, and asks for relocation to a prismatic Part if one claims it first.

No current roadmap consumes these calculations. The likely consumers are named: non-A¹-invariant motivic cohomology of singular rings (bouis-motivic), arithmetic K-theory of p-adic integers through continuity, and height-one Checks in GeneralAlgebraicKTheoryPartII.

**Sources.**

- All sources were fetched through the sources service. Ten are recorded `certified` (open repository). The ones I read for locators: akn24 (introduction, §2, §5 statements, Theorem 6.3), akn-delta (abstract, Theorem 1.2, Corollaries 1.3–1.4), hesselholt-axes (Theorems A–B), speirs-axes (Theorems 1, 2, 30, 31, Lemmas 4, 11, 15, 29, 33, Propositions 12, 16), speirs-trunc (statement list), hn-cusp (Theorem A, Theorem 1, Lemma 2, references), riggenbach-trunc (Theorems 1.1–1.2), sulyma-slopes (Theorem 1.1, Corollary 1.2, Remark 1.3) and bouis-motivic (abstract).
- The PDF-to-text extraction dropped the parity subscripts in Speirs' Theorem 1. I took them from the arXiv HTML rendering of the same version. They pass the d = 2 consistency check against Hesselholt's Theorem A, which I worked by hand for both p odd and p = 2.
- Two classical inputs to the cusp mixed complex resolve only to paywalls and are recorded `uncertified` with their DOIs: bach-hypersurfaces (Adv. Math. 95 (1992)) and larsen-mixed (K-Theory 9 (1995)). Target 4 relies on their restatement in hn-cusp Theorem 1, which I read.
- An attempt to fetch Leip's Copenhagen thesis (an institutional copy) failed. The brief names it as a possible legal substitute.
- `needs-references.toml` is not written: no text the targets need is unread. The service had first created it for a mismatched BACH lookup; once the correct DOI was settled as `uncertified` the entry was redundant, so I deleted the file.
- Two exploratory fetches with mistyped arXiv identifiers returned unrelated papers. They are in the cache only, not in the manifest.
- akn24 cites v1 numbering of akn-delta, and the cached akn-delta is v2 (May 2026), whose main theorem is Theorem 1.2. The manifest's version note records this, and the brief requires those locators to be re-checked.

## Checks performed

- `roadmaps resolve` on the brief: no unresolved cross-roadmap citation and no unresolved Lean name.
- `sources check` on the manifest: 0 problems.
- The brief contains no machine paths. Its only fenced block is a 6-line formula table.
- Arithmetic of the Checks, worked by hand:
  - Hesselholt's formula gives K_2 = k, K_3 = Ω¹_k and K_4(F_2-axes) = ℤ/4.
  - The cusp at (a,b) = (2,3), r = 0, has S = {1,2,3,4,6}, and the Witt quotient has length 1 = δ.
  - The 2-primary orders in AKN's table for ℤ/4 and ℤ/8 satisfy Angeltveit's quotient: 8/2 = 2² and 32/2 = 2⁴.

## Untrusted text

Nothing in the issue, the roadmap READMEs, the board files or the fetched papers contained instructions addressed to this job. Nothing was treated as an instruction, and nothing suspicious needs quoting.
