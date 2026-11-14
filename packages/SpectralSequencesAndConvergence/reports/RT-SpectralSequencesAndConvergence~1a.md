<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6871513609 -->
Red team round 1 pass a (codex) of ef909e4

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) The indexing negative Check rejects valid constant filtrations

   **Location:** `packages/SpectralSequencesAndConvergence/README.md:1238`: “Feeding `G_t := F^t` (no negation) to `filtrationFunctor` is not allowed: it is not monotone.” The same universal rejection occurs in §4.2 at `README.md:1005`.

   **Claim:** An antitone filtration cannot be fed unchanged to the increasing-filtration constructor.

   **Witness:** For `ℤ[0]`, constant `F^t = ⊤` satisfies both orders: `⊤ ≤ ⊤`. The zero spectral object likewise has constant abutment filtration `0` in both orders. Neither universal exclusion holds.

   **Exact repair text:** “For the stupid filtration of `ℤ →(×2) ℤ`, using `G_t := F^t` fails monotonicity: `0 ≤ 1`, but `G_0 = K` is not contained in `G_1 = K^1`. Constant filtrations are monotone in either indexing.” Replace §4.2’s second Check with: “For `ℤ →(×2) ℤ` in degree 1, the un-reindexed abutment filtration has value `0` at `p = −2` and `ℤ/2` at `p = −1`; hence it is not decreasing. The correct reindexing places its nonzero graded piece at `p = 3`.”

   **Retest:** At degree zero the proposed incorrect inclusion would be `ℤ ⊆ 0`, false. For the constant-filtration counterexample the replacement explicitly permits `⊤ ≤ ⊤`. The second replacement requires the false inclusion `ℤ/2 ≤ 0`; for the zero spectral object both values are instead `0`, so it makes no false universal exclusion.

2. **F02** (P2) The general page Euler theorem is statable but absent

   **Location:** `packages/SpectralSequencesAndConvergence/README.md:616` (§2.3); `packages/SpectralSequencesAndConvergence/Suggested.lean:18` (headline inventory), and `:119` (Layer 2 ends).

   **Claim:** The acceptance file covers the statable headline theorems. The page Euler identity is part of the roadmap's general spectral-sequence theory, but the file contains only the filtered-complex-to-abutment Euler theorem of §5.3.

   **Witness:** §2.3 requires only the existing `SpectralSequence`, the retained `BidegreeAssignment`, `ObjectProperty` classes, `Finset`, and an additive invariant. None requires the missing limit-page carrier. Its arbitrary input need not arise from a filtered complex.

   **Exact repair:** Add the following target after the two boundedness theorems, add its name to README §2.3, and list §2.3 in the module's stated-headline inventory. Use the same weak-Serre and additivity assumptions as the existing §5.3 signature:

   ```lean
   /-- The signed sum of an additive invariant is unchanged on passing
   from a finitely supported page to its homology page (README 2.3;
   Stacks, Lemma 24.12, page-step argument). -/
   theorem sum_negOnePow_page_eq_next
       {C : Type u} [Category.{v} C] [Abelian C] {κ : Type*}
       {c : ℤ → ComplexShape κ} {r₀ : ℤ}
       (E : SpectralSequence C c r₀) (A : BidegreeAssignment c r₀)
       (P : ObjectProperty C) [P.ContainsZero] [P.IsClosedUnderKernels]
       [P.IsClosedUnderCokernels] [P.IsClosedUnderExtensions]
       {G : Type*} [AddCommGroup G] (v : C → G)
       (hv : ∀ S : ShortComplex C, S.ShortExact → P S.X₁ → P S.X₂ → P S.X₃ →
         v S.X₂ = v S.X₁ + v S.X₃)
       (r : ℤ) (hr : r₀ ≤ r) (hr' : r₀ ≤ r + 1) (s : Finset κ)
       (hs : ∀ pq ∉ s, IsZero ((E.page r hr).X pq))
       (hsP : ∀ pq ∈ s, P ((E.page r hr).X pq)) :
       (∀ pq, P ((E.page (r + 1) hr').X pq)) ∧
       (∀ pq ∉ s, IsZero ((E.page (r + 1) hr').X pq)) ∧
       (∑ pq ∈ s, ((A.deg pq).negOnePow : ℤ) • v ((E.page r hr).X pq)) =
         ∑ pq ∈ s, ((A.deg pq).negOnePow : ℤ) •
           v ((E.page (r + 1) hr').X pq) := by
     sorry
   ```

   **Retest:** For `ℤ/4 ↠ ℤ/2` in total degrees 1 and 2 and composition length, the two sums are `−2 + 1 = −1` and `−1 + 0 = −1`. Empty support gives `0 = 0`, with every next-page object zero. The proposed signature was inspected against the pins, not elaborated; this pass prohibits Lean execution.

3. **F03** (P3) The double-tower headline has no acceptance-test status

   **Location:** `packages/SpectralSequencesAndConvergence/README.md:1657` (§7.3); `packages/SpectralSequencesAndConvergence/Suggested.lean:37` (unstated-headline list).

   **Claim:** The module docstring names the headline theorems that cannot yet be stated. It omits Boardman's double-tower short exact sequence, which the README explicitly owns and uses in §7.4.

   **Witness:** The eight theorem declarations contain no double-tower statement. The module docstring names §§7.2, 7.4 and 7.5 but not §7.3; the supplied tower API constructs `1−s`, not this canonical short complex.

   **Exact repair text:** Add to the unstated-headline list: “Boardman's double-tower short exact sequence (README 7.3) is not stated here: its canonical short complex requires the functorial image system `Im^r A^s`, the towers of its limits and lim¹ objects, and their comparison morphisms. The pinned tower API supplies the individual product–difference maps, not that construction.”

   **Retest:** For the multiplication-by-ℓ tower the required sequence has terms `0`, `ℤ_ℓ/ℤ`, `ℤ_ℓ/ℤ`; it is not either of the §7.2 epimorphism assertions. The new inventory identifies that separate target without substituting a zero-tower example for it.

4. **F04** (P3) Two Checks do not discriminate the proposed definitions

   **Location:** `packages/SpectralSequencesAndConvergence/README.md:477` (§1.3 first Check), and `:1119` (§4.4 third Check): “With `I = ∅` there is nothing to prove.”

   **Claim:** These are Checks of degeneration and convergence in a range.

   **Witness:** The first substitutes `s = r₀` in the definition “every differential … vanishes”. The second quantifies over no degrees; any incorrect convergence predicate also passes it. Neither distinguishes a wrong model.

   **Exact repair text:** Replace the first Check of §1.3 with: “Start at classical page 1 with `ℤ/2` at `(0,1)` and `(2,0)`, zero elsewhere, `d₁ = 0` and `d₂ = id`. Then `E₂ = E₁`, `E₃ = 0`: degeneration fails at 1 although its differential is zero, and holds at 3.” Replace the empty-range Check in §4.4 with: “For `K = ℤ[0]` and `G_j = 0` at every finite index, the spectral object satisfies convergence bounds in degree 1 with `a = b = 0`, and converges there to `H¹ = 0`. It does not satisfy them in degree 0: its upper comparison is `0 → ℤ`. Convergence on `{1}` does not imply convergence on `{0,1}`.”

   **Retest:** In the first replacement `d₂ = 1 ≠ 0` over `ℤ/2`; both homology groups of that differential are zero. In the second, the lower groups in degrees 1 and 2 are `0`, the upper degree-1 map is `id₀`, and the degree-0 map is not an isomorphism.

## Verified sound

Read all 1,874 README lines and all 275 Lean lines. Coverage: **31 numbered target sections**, their definition/theorem/API assertions and **115 Check bullets**; **11 actual Lean declarations** (one structure, two definitions, eight theorems); **54 distinct named locators** in the four readable sources. The computed record below has **114 rows**, including a row for each Lean declaration with its context. The four defective Check bullets are covered by R01 and R04. The README uses numbered headings for targets, not bold target labels.

The supplied elaborated-signature transcript was compared with all eleven actual declarations and their README statements. No lost binder was found. Its additional entry `that` comes from prose in the module docstring, not from a declaration. No Lean process was started: the specific read-only/no-build instruction controls this pass, and the supplied transcript provides the elaboration evidence. R02's proposed addition has not been elaborated.

The checks in the table support the stated signs, the native/classical page shift, the shift of the limit abutment by one total degree, the need for completeness and exhaustiveness, and the distinction between a chosen weak-convergence isomorphism and the canonical comparison. They also distinguish repleteness from exactness of countable products. No theorem among the eight present Lean theorem declarations was refuted. None was identified as a one-lemma restatement of a pinned theorem; the boundedness results use both the shape and support inequalities, and the comparison/Euler results require new arguments at the stated generality.

### Headline inventory

| README headline | Acceptance-test status at this head |
|---|---|
| 2.2 bounded stabilisation | Two differential-vanishing theorems, with explicit bounds |
| 2.3 invariance of page Euler characteristic | Missing despite native carriers: R02 |
| 3.2 convergence; 3.4 finite-filtration and convergent Euler results | General versions named as unstatable; recursive towers and limit page absent |
| 3.5 general comparison | Named as unstatable; spectral-object and filtered-complex versions present |
| 3.6 vanishing, dimension count, two-row/two-column, edges and five terms | Named as unstatable; need general converging structures |
| 4.3–4.4 canonical spectral-object convergence | Present, through both canonical comparison maps and vanishing of entering/leaving differentials |
| 4.5 quadrant convergence | Missing convergence structure identified in docstring; native page identifications already supplied |
| 4.6 spectral-object comparison | Present with the weaker upper isomorphism condition |
| 5.3 finite filtered-complex Euler identity | Present for arbitrary additive invariant on the stated weak Serre class |
| 5.4 classical exhaustive convergence and comparison | General convergence named as unstatable; comparison present in an abelian category with exact sequential colimits |
| 6.1–6.3 exact-couple assembly, tower formulas and agreement | Missing exact-couple carrier and recursive towers identified in docstring |
| 7.2 repleteness characterisation and Mittag–Leffler vanishing | Both present; native repleteness used |
| 7.3 double-tower short exact sequence | Not inventoried: R03 |
| 7.4 conditional convergence and whole-plane obstruction | Missing exact-couple carrier, cycle towers and limit page identified |
| 7.5 complete convergence | Missing general limit page and whole-plane obstruction identified |

### Ownership, pins and direction of supply

Checked **nine named roadmap ownership families**, with **16 individually resolved section/item references**, plus two unnumbered ownership scopes: StableHomotopyKTheory §§7.21–7.26; DGFloer Layer 1 items 2–3; AlgebraicTopology Stage 6 item 0; DerivedModuleAlgebra §S.1; SchemeAndStackFoundations §§2.2, 2.17; ComplexKahlerGeometry K8; EnhancedDerivedSheaves E2:towers.1, E2.1, E2.2; and the finite filtered-complex scopes of HeegaardFloer and MorseTheory. Repeated citations were resolved to those same owners. Downstream consumer lists are not supplier edges.

| Owner checked | Evidence and disposition |
|---|---|
| StableHomotopyKTheory | `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618`, §7.22, owns bigraded exact couples and derivation. This package assembles their pages into the native carrier. The degrees `a,b−a,c` and `c+b−(r−1)a` agree. §§7.21, 7.23–7.26 concern filtered spectra. |
| DGFloer | Main `TauCetiRoadmap/DGFloer/README.md:621`, Layer 1 item 3, owns the module versions. The supplied revision's former-numbering map at `README.md:155` preserves this citation when the material moves to AlgebraicTopology Stage 5.0. No dependency on new revision numbering is introduced. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:879` maps Stage 6 item 0's generic module-tower algebra to pinned Tau Ceti. The topological adapters remain there; this package's extension is to arbitrary abelian categories. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`, §S.1, owns the double-complex instance. The names `DoubleComplex.edgeBottom` and `DoubleComplex.edgeLeft` are roadmap names mapped at `README.md:65`, not claims that native Lean declarations exist. The two supplied citation warnings are therefore not findings. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4184`, §2.2, and `:4977`, §2.17, cover the stated sheaf instances. Replete-topos derived limits and the cyclotomic counterexample remain there. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1294`, E2:towers.1; `:2035`, E2.1; `:2083`, E2.2. These own coherent derived towers and topos/sheaf consequences, not the new general abelian-category convergence structures. |
| ComplexKahlerGeometry, HeegaardFloer, MorseTheory | Frölicher and finite filtered-complex instances are retained by their owners. See `TauCetiRoadmap/ComplexKahlerGeometry/README.md:366` (K8 mapping), `TauCetiRoadmap/HeegaardFloer/README.md:1024`, and `TauCetiRoadmap/MorseTheory/README.md:1421`. |

Ownership searches used `roadmaps grep` and `roadmaps show`, main and Completed, board packages, and an additional object search over **449 existing README/Lean files** from the supplied 236-head index. The latter found 54 matching lines, largely specialised applications. The closest scopes on main and the supplied overlap/mapping leads were inspected; ArithmeticGaloisDuality concerns arithmetic duality, not generic convergence. No second generic owner or duplicate fully qualified declaration was established. The overlap input reports no second copy, conflicting edit, or dropped cited id.

The single gap `gap:exact-couple-morphisms` is present both in `design/plan.json` and `README.md:340`, owned by StableHomotopyKTheory §7.22. Its fixed-degree commuting maps, identities/composition and functorial derivation are precise, are not supplied by the pinned carriers, and are the required missing input to Layer 6. Acceptance after repairs remains conditional on that declared contract; its current absence is not a finding.

Pinned declarations were searched by objects and fields, not merely roadmap names. In particular:

- `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36` supplies pages and homology isomorphisms, not recursive cycle/boundary towers or an infinite page. Its morphism and naturality declarations were also inspected.
- `Mathlib/CategoryTheory/Filtration/Basic.lean:44` and `:73` supply the functor/monomorphism data for filtrations and filtered objects; they do not impose exhaustiveness, separation or completeness.
- `TauCeti/Algebra/Homology/SpectralObject/Comparison.lean:133` and `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Exhaustive.lean:200` have the stronger/different endpoint hypotheses described in the README. The new comparison signatures do not simply repeat them.
- `TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77`, `:122`, `:150`, `:165` supply the difference map, its limit kernel, naturality and the pro-zero isomorphism. `Mathlib/CategoryTheory/Functor/EpiMono.lean:158` supplies the faithful-functor reflection instance (and its generated dual). The two preliminary symbol-search misses were resolved by reading these declarations.
- `TauCeti/CategoryTheory/Limits/Replete.lean:91`, `:107`, `:118`, `:357` supply repleteness, limit-leg epimorphisms, descent and countable AB4*. The general Mittag–Leffler statement is not the Type-valued condition at `Mathlib/CategoryTheory/CofilteredSystem.lean:137` or its module specialisation.
- `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:165` is an Euler–Poincaré engine on integer-indexed complexes. The finite regrouping by total degree and passage through arbitrary native spectral-sequence pages still require a theorem; it is not a replacement acceptance statement for §2.3.

Pins used: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

Dependency check, with this package's README, the supplied order and content checkout, and `--movable --pr 14997`, returned exactly:

```text
depcheck: 242 roadmaps, 2194 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The local layer dependencies run from the generic page/tower constructions through filtered abutments and comparison to exact-couple obstructions. The `git diff --stat origin/main...HEAD` inspection showed only files within `packages/SpectralSequencesAndConvergence/`. The Lean imports are one `import Mathlib` and the five existing, used Tau Ceti modules. No forbidden `set_option`, sorry-defined data, admitted example, `lemma`, process narrative or computational algorithm was found in README/Lean.

### Source verification and independence

The 54 readable named locators comprise 27 Stacks items, 23 Helle–Rognes items, two Bhatt–Scholze items and two Browning–Sawin items. This count collapses repeated citations of the same item. It does not certify the six settled inaccessible sources.

| Source | Verified named locators / evidence |
|---|---|
| stacks-012K | Definition 10.1 and Lemma 10.3; Definition 19.1; Definitions 20.1–20.2; Definition 21.1, Lemma 21.2, Definition 21.3, Lemma 21.4; Definition 23.1 and Lemmas 23.2–23.3; Definitions 24.1, 24.5, 24.7, 24.9 and Lemmas 24.2–24.4, 24.6, 24.8, 24.10–24.13; Definition 31.2 and Lemma 31.3. Evidence at lines 1150–1187, 2330–2390, 2593–2710, 2834–2906, 2953–3240, 3700–3745. |
| helle-rognes2024 | §§2.2–2.7; Definition 3.1, Definition 3.3, Lemma 3.4, Remark 3.5, Definitions 3.6–3.7, Theorems 3.9–3.10, Definition 3.11, Lemmas 3.13–3.15, equation (3.1); Definition 4.5, Remarks 4.6 and 4.10; Example 8.1. Evidence at lines 65–98, 100–250, 283–340, 943–967. |
| bhatt-scholze2015 | Definition 3.1.1 and Proposition 3.1.10, lines 695–710 and 745–775. The source's topos setting is kept distinct from the categorical extension proved here. |
| browning-sawin2020 | Theorems 1.1 and 2.7, lines 57–75 and 568–587. Used for the downstream example, not as the owner of general convergence. |

Wording comparisons covered the available-source passages in 27 target sections, plus six additional passages: the indexing conventions (`README.md:127` versus helle-rognes2024 line 81), the Euler proof route (`:630` versus stacks-012K line 3185), the convergence docstring (`Suggested.lean:133` versus stacks-012K line 3202), the repleteness docstring (`Suggested.lean:245` versus bhatt-scholze2015 line 755), the obstruction example (`README.md:1772` versus helle-rognes2024 line 943), and the circle-method example (`README.md:889` versus browning-sawin2020 line 57). No distinctive reproduced sentence, clause-by-clause paraphrase, copied table/figure/exercise list, or external-formalisation reuse was identified. Standard formulas and forced hypothesis lists were not treated as expression.

There are 86 explicit source-key citation occurrences before the References section: Stacks 42, Helle–Rognes 21, Weibel 11, Boardman 5, Eilenberg–Moore 2, Bhatt–Scholze 2, McCleary 1, Massey 1 and Browning–Sawin 1. This measures keyed citation occurrences, not individual theorem numbers inside compound citations.

The Stacks contents at stacks-012K lines 1–42 were compared with the roadmap. The correspondence is Layer 1 ↔ §§20–21; Layer 2 ↔ parts of §24; Layer 3 ↔ §§19 and 24 plus comparison theory; Layer 4 ↔ generic spectral-object comparison rather than a Stacks chapter; Layer 5 ↔ §24; Layer 6 ↔ §§21–23; Layer 7 ↔ §31 plus obstruction theory from Helle–Rognes. This is neither one-to-one nor the same order. The `Needs` lines force towers before convergence, convergence before comparison, and exact-couple identifications before conditional convergence; they explain the mathematical organisation independently of the source contents.

Source independence: 33 passages compared with 4 sources; no copied expression identified. Largest share stacks-012K, 42 of 86 keyed citation occurrences; its text and contents were compared: independent arrangement. Six settled uncertified works were not available for wording comparison; see Not verifiable.

### Computed adversarial pass

All categories below are abelian; examples are in abelian groups or vector spaces unless specified. ℓ is prime. T denotes the stupidly filtered complex ℤ --2→ ℤ in degrees 0,1. U denotes ℤ --id→ ℤ with F^pK^0=ℤ for p≤0 and 0 otherwise, and F^pK^1=ℓ^(p−1)ℤ for p≥1 and F^pK^1=ℤ for p≤0. These are mathematical calculations, not Lean executions.

| Statement (README section) | Instances | Computed sides / wrong model | Result / change |
|---|---|---|---|
| Conventions: classical/native indexing | T, (p,q)=(0,0),(1,0) | native=(1,−1),(3,−2); d₂ native=+2=d₁ classical; sums=0,1 | consistent |
| Conventions: E₂ abutment indexing | T, n=1 | F³=ℤ/2,F⁴=0; gr³=ℤ/2 at (3,−2); classical gr¹=ℤ/2 | shift n+1=2 |
| Conventions: homological assignment | r=2, (p,q)=(3,1)→(1,2) | deg:−4→−3; fil:−3→−1 | rises 1,2 |
| 1.1 subquotient presentation and preimage | ℤ/4 inside ℤ | 0↦4ℤ,2ℤ/4↦2ℤ,ℤ/4↦ℤ; quotient 2ℤ/4=ℤ/2 | holds |
| 1.1 interval order isomorphism, meets/joins | same, subgroups 0 and 2ℤ/4 | meet=0↦4ℤ; join=2ℤ/4↦2ℤ | holds |
| 1.1 iterated presentation | 0≤2ℤ/4≤ℤ/4 | one-step quotient ℤ/2; two-step quotient ℤ/2 | holds |
| 1.1 zero and marking | X=0; X=A=ℤ², marking coordinate swap | B=Z gives singleton; preimage first axis=second axis, identity marking gives first | marking necessary |
| 1.2 recursive towers | E₂(0,1)=ℤ --2→ E₂(2,0)=ℤ | at source Z₃=B₃=0; target Z₃=ℤ,B₃=2ℤ | quotients 0,ℤ/2 |
| 1.2 tower equality iff vanishing | same | source Z₂=ℤ≠0=Z₃ and dFrom=2≠0; target B₂=0≠2ℤ=B₃ and dTo=2≠0 | both directions agree |
| 1.2 zero iff Z=B | same source/target | source 0/0=0; target ℤ/2ℤ≠0 and ℤ≠2ℤ | holds |
| 1.2 naturality/isomorphisms/rebase | identity on preceding sequence, base s=3 | source interval [0,0]; target [2ℤ,ℤ] corresponds to [0,ℤ/2]; induced map=id | holds |
| 1.3 regular/coregular/stabilisation | same | source entering=0 always, leaving=2 at r=2 then0; target reversed | stabilises from3, not2 |
| 1.3 canonical later-page maps/composition | same r=3,4,5 | target maps id_(ℤ/2); id∘id=id | holds |
| 1.3 degeneration/invariance/monotonicity | zero sequence, preceding sequence | degeneration starts r₀, respectively3; raising start to4 leaves all d=0 | holds |
| 1.4 limit page and B∞≤Z∞ | preceding sequence | source B∞=Z∞=0; target 2ℤ≤ℤ; E∞=ℤ/2 | holds |
| 1.4 nonstabilising meet | U at (0,0) | Z_r=ℓ^(r−1)ℤ, B_r=0; meet0; all finite pages≅ℤ, E∞=0 | genuine limit required |
| 1.4 general product/coproduct constructions | U and zero sequence | ker(ℤ→∏ℤ/ℓ^(r−1))=0; image(⊕0→ℤ)=0; zero case0/0=0 | holds |
| 1.4 functoriality/rebase/vanishing | preceding sequence at s=3 | quotient tower constant ℤ/2; rebase limit ℤ/2; vanished source remains0 | holds |
| 2.1 BidegreeAssignment | standard and classical; κ empty; swap | r=2 standard (0,0)→(2,−1): fil+2,deg+1; classical fil+1; empty injective; swap fil−1 at2,−2 at3 | wrong swap would need e=3 and5 |
| 2.1 finite/natural positions | Fin0; n=0,1,2 | Fin0 has0 positions; natural degree fibres sizes1,2,3 | injectivity/bounds agree |
| 2.2 boundedness/dFrom bound | E₂ source (0,1), β(n)=n+1 | outgoing threshold β(2)−0=3; d₂=2≠0,d₃=0 | sharp |
| 2.2 dTo bound | E₂ target (2,0), α(n)=−1 | entering threshold2−(−1)=3; d₂=2≠0,d₃=0 | sharp |
| 2.2 boundary quadrant and empty support | (1,0), zero sequence | r=2 target q=−1,source p=−1, both0; zero has arbitrary bounds | holds |
| 2.2 adjacent-degree finiteness | U total0 | degree0 has1 nonzero term; degree1 has infinitely many ℤ/ℓ; Z_r strictly decreases | n alone insufficient |
| 2.3 page Euler identity | ℤ/4↠ℤ/2; T⊗ℚ | −2+1=−1=−1+0; 1−1=0=0 | holds |
| 2.3 weak Serre restriction | 0→k→k^(ℕ)→k^(ℕ)→0 | finrank middle0, end sum1+0=1 | additivity required |
| 3.1 filtrations and completeness | ℓ-adic ℤ,ℤℓ; constant X; zero filtration | meet0 both adic, completion ℤℓ≠ℤ vs ℤℓ=ℤℓ; constant meetX,completion0; zero join0,completionX | distinguishes four conditions |
| 3.1 finite graded pieces and five lemma | ℤ/4 vs (ℤ/2)² | both gr=(ℤ/2,ℤ/2), underlying exponents4 vs2; id gr maps lift id for identical filtration | abstract graded isos alone insufficient |
| 3.2 weak/convergent/strong | T; ℓ-adic ℤ; constant filtration ℤ with E=0 | T gr¹=ℤ/2=E∞, complete; adic gr=ℤ/ℓ=E∞, completionℤℓ≠ℤ; constant gr0=E∞ but meetℤ | definitions distinguished |
| 3.2 empty set/restriction/outside degrees | I=∅; I={0}, modify H¹ | number of required β=0 for empty; changing H¹ adds0 conditions in {0} | holds |
| 3.3 compatibility/category | E∞=H⁰=ℤ, β=id | (−id,id): β′E∞f=−1,gr(h)β=1; identity1=1; zero0=0 | wrong unconstrained pair excluded |
| 3.4 finite vanishing/Serre membership | two ℤ/2 grades; zero grades | length(H)=2=1+1; all0 grades force finite filtration constant0 | holds |
| 3.4 Euler global degree hypothesis | E=0, H¹=ℚ,I={0} | page sum0,abutment sum−1; adding E(0,1)=ℚ gives−1=−1 | global convergence needed |
| 3.4 Euler finite filtration hypothesis | E=0,H⁰=ℚ with constant filtration | page sum0,abutment sum1; gr all0 | finite filtration needed |
| 3.5 comparison finite/complete | id on T; inclusion ℤ→ℤℓ | id E∞ and H; adic gr maps id onℤ/ℓ, H map not onto | completeness indispensable |
| 3.5 comparison separation | E=E′=0,H=ℤ constant,H′=0 | page map0→0 iso, H mapℤ→0 not mono | weak alone insufficient |
| 3.6 vanishing/dimension iff | T⊗ℚ at total0,1; zero differential over 𝔽₂ | finite-page dimensions1 vs limit0, d≠0; over 𝔽₂ dimensions1=1,d=0 | both directions consistent |
| 3.6 two columns | grades ℤ/2,ℤ/2 | 0→ℤ/2→ℤ/4→ℤ/2→0 exact; same for split group | no splitting asserted |
| 3.6 two rows | Hopf data four ℤ's | d₂=id kills degrees1,2; H⁰=H³=ℤ; long-sequence fragment ℤ→ℤ→0→0 exact | holds |
| 3.6 edge/five-term | only E₂(0,0)=ℤ; m=0 attempted | H⁰=ℤ; m=0 gives consecutive id maps with composition id≠0 | m≥1 necessary |
| Layer3 example: odd differentials | E₁=E₂=ℤ at(0,1),(2,0); d₂=id | d_odd=0, E₁≠E₃=0 | no degeneration at1 |
| 4.1 spectral-object towers | T, native(1,−1),r=2,3 | Z₂=ℤ,B₂=0; Z₃=ker(2)=0; target(3,−2) B₃=2ℤ | agrees with generic recursion |
| 4.1 natural positions need recipe class | G₀=0,G₁=K¹,G₂=K, K=(ℤ→idℤ) | integer E₂(−1,1)=ℤ→E₂(1,0)=ℤ is id; restricted homology ℤ vs recipe E₃=0 | class rejects |
| 4.1 homological positions | (p,q)=(0,2),r=3 | n=−2,indices(−3,−2,−1,0); d degree(−3,2), total drops1 | convention consistent |
| 4.1 finite positions | l=2,r=3,q=0,1; l=0 | indices(0,0,1,2),(0,1,2,2), latter B₃=0; l=0 no positions | clamping essential |
| 4.2 filtered abutment/grading | T,n=1 | F³=im(ℤ→ℤ/2)=ℤ/2,F⁴=0; gr³=EInfty(−2,1)=ℤ/2 | holds |
| 4.2 zero/full steps, naturality | T; zero spectral object | endpoint −2 gives0,endpoint0 givesℤ/2; id maps both to themselves; zero gives all0 | holds |
| 4.3 canonical subquotient iff | nonexhaustive ℤ[−1]→idℤ[0], F only degree0 | Z∞=Zᵗ=ℤ; B∞=0,Bᵗ=ℤ; inclusion id,projectionℤ→0 not iso | boundary equality necessary |
| 4.3 cycle equality without stabilisation | U at(0,0) | Zᵗ=Z∞=0; finite Z_r=ℓ^(r−1)ℤ≠0 | comparison can hold without finite stage |
| 4.3 stabilisation criterion | T target q=−2,i=−2,j=0 | bound max(2,3)=3; E₂=ℤ,E₃=ℤ/2 | sharp |
| 4.3 continuity requires only epi | displayed K=(ℤ→idℤ) in n−2,n−1 | colim H^(n−1)(G_j/G_(q+1))=ℤ→H^(n−1)(K)=0 | epi,not iso |
| 4.4 convergence bounds | T,n=1,a=−2,b=0 | H¹(G_−2)=0,H¹(G_−1)=ℤ→ℤ/2 not iso,H¹(G₀)=ℤ/2→ℤ/2 iso | bounds cannot improve |
| 4.4 boundary mono insufficient | K=ℤ[0],all finite G=0 | 0→ℤ mono; all pages0; join filtration0≠ℤ | iso condition excludes |
| 4.4 arbitrary order of bounds | X=0,a=5,b=0,q=1 | max(2,−2,0)=2; both endpoint objects0; F=0 | no spurious negative page |
| 4.4 finite filtration and range | T; I=∅ | F^p=ℤ/2 for p≤2,0 for p≥4; unique nonzero gr³; empty I has0 required statements | holds |
| 4.4 naturality/monotonicity of bounds | T,a lowered to−3,b raised1 | new bound at q=−2 max(2,3,4)=4≥3; pages stillℤ/2 | holds |
| 4.5 first/third quadrant | n=0; first quadrant n=−1; third m=−2 | single(0,0),H⁰=E₂; n=−1 endpoints force H=0; third a=−2,b=1, positions(0,2),(1,1),(2,0) | matches pinned vanishing classes |
| 4.6 naturality/comparison | identity T; filtered inclusion ℤ[0]→(ℤ[−1]→idℤ[0]) | first id onℤ/2; second every page map idℤ but H mapℤ→0 | failed top bound excludes latter |
| 5.1 classical sequence, d₁, functoriality | T, T⊗𝔽₂, one-step filtration | d₁=2, H=(0,ℤ/2); in𝔽₂ d₁=0,H=(𝔽₂,𝔽₂); one-step E₁=H(K),later d=0 | holds |
| 5.1 indexing negative Check | constant F^t=K versus stupid filtration | constant G₀=G₁=K satisfies ≤; stupid G₀^0=ℤ,G₁^0=0 violates≤ | R01 |
| 5.2 induced filtration/canonical vs abstract | ℤ[−1]→ℤ^(ℕ)⊕ℤ, d(x)=(0,x), nonexhaustive | E∞=ℤ^(ℕ)⊕ℤ≅ℤ^(ℕ)=H; canonical projection kernelℤ≠0 | abstract β does not certify canonical map |
| 5.2 trivial/stupid filtration | T; one-step K | T gr¹H¹=ℤ/2; one-step gr⁰Hⁿ=Hⁿ | holds |
| 5.3 cohomological bounds and finite filtration | T; degreewise diagonal ℤ in m≥0 | T p₀=2,p₁=0; diagonal n≥0 p₀=n+2,p₁=n, grⁿHⁿ=ℤ; no uniform upper filtration bound | local degree bounds hold |
| 5.3 adjacent degree hypothesis | U,n=0 | H⁰(F^s)=0 eventually but H¹(F^s)=ℓ^(s−1)ℤ≠0; Z_r never stabilises | n+1 needed |
| 5.3 Euler theorem | T⊗ℚ and T⊗𝔽₂ | correct sums0=0 both; wrong native-p sign gives−2≠0 | degree sign confirmed |
| 5.3 finite support | diagonal ℚ in every m≥0 | nonzero positions infinitely many; partial Euler sums alternate1,0 | finite-sum hypothesis excludes |
| 5.4 exhaustive bounded-below convergence | T and nonexhaustive identity complex | T bounded/exhaustive,H¹=ℤ/2; nonexhaustive K^−1 gives E∞=ℤ,H⁰=0 | degree n−1 needed |
| 5.4 comparison/complete direction | ℓ-adic ℤ→ℤℓ | all first-page maps id_(ℤ/ℓ); H map not onto; no finite p kills steps | bounded-below hypothesis excludes |
| 5.4 identity boundary values | T increasing G, a=−2,n=1 | G_a^1=G_a²=0; joins in degrees0,1 areℤ; H mapid_(ℤ/2) | holds |
| 6.1 general exact-couple pages | D=E=ℤ² with i(x,y)=(x,0),j(x,y)=(y,0),k(x,y)=(0,y) | im i=ker j=axis1; im j=ker k=axis1; im k=ker i=axis2; jk²=0,homology0 | valid including char2 |
| 6.1 degree and shift | cohomological a=(−1,1),b=0,c=(1,0); k=1 | d₁=(1,0),d₂=(2,−1); native shifted e=1−1=0 vs wrong2 | correct |
| 6.1 zero-E and inverse shift | i=id,E=0; shift1 then−1 | all pages0; page r→r+1→r | holds |
| 6.2 tower formulas r=0,1,2 | D=ℤ/ℓ², i=ℓ, E=(ℤ/ℓ)² | Z₁=E,B₁=0; Z₂=E,d₁=0; Z₃=axis1, B₃=axis1 so E₃=0 | wrong i^(r+1) gives wrong Z₂=axis1 |
| 6.2 Bockstein | D=ℤ,i=ℓ,E=ℤ/ℓ,k=0 | ker i^r=0, Z_r=E,B_r=0; E∞=ℤ/ℓ | holds |
| 6.3 spectral-object couple | T | k degree(2,−1), d₁ native from(1,−1)to(3,−2)=2; derived d_r=(r+1,−r) | matches page shift |
| 6.3 D tower and exactness | T,total1 | A^p=0(p≥4),ℤ(p=3),ℤ/2(p≤2); lim0,colimℤ/2; k=0 at source would make ker k=ℤ≠im j=0 | k necessary |
| 7.1 lim/lim¹ definitions and six-term | constant A; zero-transition A; ×ℓ onℤ | (lim,lim¹)=(A,0),(0,0),(0,ℤℓ/ℤ); constant split SES stays split | distinguishes limit from derived term |
| 7.1 cofinal/pro-zero invariance | remove first stage of ×ℓ; zero transition tower | lim¹ bothℤℓ/ℤ, transition comparison×ℓ invertible; zero tower difference=id | holds |
| 7.1 completeness equivalence | ℓ-adicℤ,ℤℓ; constant nonzeroX | lim¹=ℤℓ/ℤ,0,0 respectively; meet=0,0,X; completionsℤℓ,ℤℓ,0 | separation needed in converse |
| 7.2 repleteness iff | Ab and discrete cyclotomic modules | Ab epimorphic quotient tower lim=ℤℓ,lim¹=0; discrete smooth limit0→μ_(ℓ^n) not onto for n>0 | repleteness substantive |
| 7.2 ML definition/epi/pro-zero/Artinian | finite constant identity; zero transitions; ×ℓ | stable images A;0 after1;ℓ^(k−n)ℤ strictly descending | all three discriminate |
| 7.2 stable images/quotients | A with zero transitions; identity finiteA quotientB | stable subtower0,quotientA prozero; stable quotientB | exact-subtower route works |
| 7.2 lim¹ vanishing | ℤ/ℓ^n quotient tower | (1−s)x=y via x_(n+1) lifting x_n−y_n; at n=0 x₀=y₀=0 | epi difference,lim¹0 |
| 7.2 enough projectives and Artinian cycle towers | Ab, projectiveℤ; source first pageℤ/ℓ² | lift1 recursively; finite subobject chains length≤2,cycle tower stabilises | no limit-existence assumption needed for existing cone |
| 7.3 double-tower SES | constantℤ; ×ℓ; eventuallyzero | three terms0,0,0; respectively0,V,V with V=ℤℓ/ℤ and comparisoniso; eventuallyzero all0 | correct exactness; nonzero middle example essential |
| 7.3 replete epi-limit bullet | constant Q=ℤ; quotient towers | projectionsidℤ; ℤℓ→ℤ/ℓ^n onto | holds |
| 7.4 conditional definitions/zero pages | zero couple; D=ℤ everywhere,i=id,E=0 | first all0; second A±=ℤ,RA=RE=W=0 | zero pages not enough |
| 7.4 limit shift | D^{s,1−s}=ℤ for s≥1,E(0,0)=ℤ,k=id | colim0,lim A₁=ℤ,lim A₀=0; F⁰H⁰=ℤ,F¹=0 | shifted gr⁰=ℤ,unshifted0 |
| 7.4 colimit no shift | D^{s,−s}=ℤ for s≤0,E(0,0)=ℤ,j=id | lim=lim¹=0,colim A₀=ℤ; F⁰=ℤ,F¹=0,W⁰=0 | strong convergence to same degree |
| 7.4 half-plane/regularity | two step couples | lower or upper tails of E=0; tower maps eventuallyid or0; RE=W=0 | holds |
| 7.4 nonzero obstruction | A₀^s=∏_(i≥abs(s))k | d_(2m−1) iso from−m to m−1; E∞=RE=0; A+=RA+=0; A−=V=∏k/⊕k; all F^s=V; meet=V=W≠0,lim¹F=0 | weak,not separated |
| 7.5 complete convergence | ℤℓ[0] adic; ℤ[0] adic | E∞=ℤ/ℓ in p≥0 both; first completionℤℓ and W=0; second completionℤℓ≠ℤ | completeness needed |
| 7.5 first-quadrant reduction | K^m=ℤ for m≥0,d=0,F^pK^m nonzero iff p≤m | gr^mH^m=ℤ,E∞^{m,0}=ℤ; for m=−1 condition forces K^−1=F⁰=0 | holds |
| 7.5 wrong mere quadrant criterion | constant filtrationℤ[0] | E₁=0 fits quadrant; completion0≠ℤ; H⁰=ℤ | excluded |

### Lean declaration contexts and values

There are 11 declarations (one structure, two definitions, eight theorems), all inside `TauCetiRoadmap.SpectralSequencesAndConvergence`. No ambient section variables: each category/instance binder is explicit. `u,v` denote object and morphism universes; κ and G have separately inferred universes. The supplied transcript's twelfth item `that` is a regex hit in the module docstring, not a Lean declaration.

| Declaration / layer / line in Suggested.lean | Explicit context and instances | Computed values; result |
|---|---|---|
| BidegreeAssignment /2/81 | κ:Type*, c:ℤ→ComplexShape κ,r₀:ℤ; no C | at r=2 standard fil rise2,deg rise1; classical fil rise1,deg rise1; emptyκ valid; swapped fil would demand e=3 then5; sound |
| dFrom_eq_zero_of_boundedBelow /2/99 | C:Type u,Category.{v},Abelian;κ,c,r₀,E,A;β,hβ,pq,r,hr,hrβ | source(0,1),β(n)=n+1: threshold3; d₂=2 not covered,d₃=0 covered; zeroC all d0; sound |
| dTo_eq_zero_of_boundedAbove /2/111 | same;α,hα,pq,r,hr,hrα | target(2,0),α=−1: threshold3; d₂=2 not covered,d₃=0; sound |
| HasConvergenceBounds /4/124 | C:Type u,Category.{v},Abelian;X:EInt spectral object,n,a,b | T n=1,a=−2,b=0 valid; allfiniteG=0,K=ℤ[0] gives map0→ℤ notiso,invalid; zeroX,a5,b0 valid |
| convergence_of_hasConvergenceBounds /4/150 | same category;X,{n,a,b},hX; conclusion quantifies q,r,hr and endpoint inequalities | T targetq−2 bound3, two comparison maps becomeisoℤ/2,dFrom=dTo=0; zeroX a5,b0,q1 bound2; sound |
| isIso_hom_app_abutment_of_hasConvergenceBounds /4/175 | same category;X,Y,φ,{n,a,b},hX,hY,r≥2,all-position page isos | identityT givesidℤ/2; nonexhaustive inclusion page idℤ but Hℤ→0 fails bound; sound |
| sum_negOnePow_homology_eq_sum_negOnePow_page /5/194 | C Category.{v},Abelian;K,F,Monotone F,hfin;P ContainsZero/closed kernels,cokernels,extensions;G AddCommGroup,v,hv;r≥2,s,hs,hsP | T⊗ℚ page1−1=0,Hsum0; T⊗𝔽₂ same; empty s forceszeroH,0=0; hv implies v0=0 and iso invariance |
| isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow /5/224 | C Category.{v},Abelian,HasColimitsOfShapeℕ,HasExactColimitsOfShapeℕ;K,L,F,G monotone,α,n,a;vanishing n,n+1;LUB n−1,n;page isos | identityT n1,a−2 valid,Hmapid; adicℤ→ℤℓ fails vanishing; nonexhaustive identitycomplex fails LUB at−1; sound |
| isReplete_iff_countableAB4Star_and_epi_towerDifference /7/250 | C Category.{v},Abelian,HasCountableProducts | Ab:true↔true; zeroC true↔true; discrete cyclotomic tower projection0→μ notepi so leftfalse; no assertion from AB4Star alone |
| IsMittagLeffler /7/261 | C Category.{v},Abelian;F:ℕᵒᵖ⥤C; no products assumed | identity imagesA stable m=n; zero bonds images0 stable m=n+1; ×ℓ imagesstrictlydecrease, false |
| epi_towerDifference_of_isMittagLeffler /7/270 | C Category.{v},Abelian,HasCountableProducts,TauCeti.IsReplete;F,hF | zero bonds differenceid; quotientℤ/ℓ^n differencesurjective; ×ℓ excluded as notML; sound |

### Additional boundary and source diagnostics

| Statement | Instances | Computed values | Result / change |
|---|---|---|---|
| 3.6 extended five-term, m=2 | E₂(0,2)=ℤ,E₂(3,0)=ℤ, d₃=2, others0 | E₃=E₂,E₄(0,2)=0,E₄(3,0)=ℤ/2; H²=0,H³=ℤ/2; sequence 0→0→0→ℤ --2→ ℤ→ℤ/2 | exact |
| arbitrary r₀ and integer arithmetic in 2.2 | r₀=−2,cohomological relation from(0,0) | target(−2,3),total1; fil change−2=r−e; β(1)=−1 puts vanishing threshold−1,so nonzero d_−2 is excluded | no truncated natural subtraction |
| zero ring and empty κ | modules over zero ring; empty position type | every module0,all d=0,all finite sums0; emptyκ has no positions and convergence asks all gr=0 | no nonzero-module counterexample admitted |
| nonabelian groups | S₃,Q₈ vs cyclicℤ/2 | S₃,Q₈ not objects of Ab/ModuleCat; cyclic group admits2=0,homology of zero d isℤ/2 | no unstated abelianization |
| source 24.13 boundedness from E₀ | K⁰=K¹=⊕_(j≥0)ℤ,d=id; F^p=tail j≥max(p,0) in both terms | H^n(F^p)=0=H^nK for all p,n; E₀^{p,−p}=E₀^{p,1−p}=ℤ for every p≥0; E₁=0 | source boundedness applies after rebasing to E₁; roadmap starts there |
| source 24.13 proof degree n−1 | K⁰=ℤ→id K¹=ℤ; subcomplex L⁰=0,L¹=ℤ; n=1 | H⁰(L)=0=H⁰(K),but dL⁰=0≠im(dK)∩L¹=ℤ | source must use injectivity on H¹,as roadmap does |
| 1.3 first Check: definition restatement | E₁ has ℤ/2 at (0,1),(2,0), d₁=0,d₂=id | E₂=E₁ but E₃=0; degeneration at1 false,at3 true | R04 replaces tautology with delayed differential |
| 4.4 third Check: empty range | K=ℤ[0],all finite G=0; I={1} vs {0,1} | H¹=H²=0 and upper degree1 map id₀; upper degree0 map0→ℤ notiso | R04 replaces vacuity |
| 4.2 second Check: universal rejection of increasing indexing | zero spectral object vs T | zero gives0≤0 in both directions; T gives abutment steps0,ℤ/2 at−2,−1 | R01 restricts negative Check to T |

## Not verifiable

- **Six settled uncertified sources:** weibel1994 (§§3.5, 5.2, 5.5, 5.9), boardman1999 (3.4(b), Definition 5.10, Theorems 7.1, 8.2, 8.10, 8.13), eilenberg-moore1962 (§7), mccleary2001 (Chapters 2–3), massey1952 (exact couples), and cartan-eilenberg1956 (Chapter XV). Their texts were not supplied legally and their status is explicitly settled. Their locators were retained, not guessed, re-requested or certified. Available overlapping statements in Stacks/Helle–Rognes were checked without treating them as verification of inaccessible text.
- **Published/draft concordance for Helle–Rognes:** the supplied author draft dated 2 February 2018 was read. The manifest's assertion that every cited number agrees with the published 2019 version was not independently checked against the publisher text. All source witnesses here refer to the supplied draft's numbered lines and printed pages.
- **New elaboration:** no fresh `#check` run, build or proof execution was performed. The supplied signature transcript was used for the unchanged Lean file. The R02 addition is a proposed signature for the repair worker to elaborate, not a claimed build result.
- **Unimplemented general constructions:** the computed examples and inspected proof routes are not formal proofs of arbitrary-category convergence, the double-tower construction, or whole-plane convergence. The declared exact-couple-morphism contract remains an external prerequisite. No undeclared supplier was inferred merely from a bibliographic citation.

## Source issues

- **Misprint** in stacks-012K at Lemma 24.11, printed page 65 (line 3162): the source says vanishing of `F^(p+r)K^n` removes the differential's target condition; it should be vanishing of `F^(p+r)K^(n+1)`; affects the proof.
- **Error** in stacks-012K at Lemma 24.13(1), printed page 66 (lines 3208–3215; Definition 24.7 at line 3114): the source says cohomological endpoint bounds make the associated sequence bounded at its starting page; it should be bounded after starting at `E₁`, since `E₀` can have infinite diagonal support; affects a stated result.
- **Misprint** in stacks-012K at Lemma 24.13 proof, printed page 67 (lines 3224–3226): the source says the degree-n cycle preimage equals `d(F^(p+r)K^n)` plus degree-n cycles; it should be `F^(p+r)K^n` plus those cycles, for `r ≥ 1`; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.13 proof, printed page 67 (lines 3229–3232): the source says the isomorphism in cohomological degree `n−1` gives the required degree-n boundary equality; it should be injectivity in degree `n`, with threshold `p₁(n)`; affects the proof.
- **Misprint** in helle-rognes2024 at Lemma 2.2 proof, printed page 2 (line 69): the source says the image of the exiting differential is a subobject of the source's cycles; it should be the image of the entering differential, indexed `s+r`; affects the proof.
- **Misprint** in helle-rognes2024 at Lemma 3.13 proof, printed page 4 (line 186): the source says `π_s` from the inverse limit is a colimit structure map; it should be an inverse-limit projection; affects nothing.
- **Misprint** in helle-rognes2024 at Proposition 4.9 proof, printed page 6 (line 332): the source says the image calculation uses the differential indexed `s−r`; it should be indexed `s+r`, as correctly stated in the proposition; affects the proof.

## For the human reviewers

- Wording against six settled uncertified works was not tested: weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952 and cartan-eilenberg1956 (`sources.toml:56–130`). The largest-share source, stacks-012K, was available and its wording and contents were tested.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ef909e4b87a42d6ade2bd8c841aba03d0dfdbb3a", "job": "RT-SpectralSequencesAndConvergence~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
