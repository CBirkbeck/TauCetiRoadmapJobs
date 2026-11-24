# Review of MorseNovikov (pull request #1854 at 9288dee)

**Verdict:** accepted

**Summary.** An incremental re-review of the 2 lines changed since `2f1f33b`, together with a check of the pull request's title and description against this head. The one changed line, the *Needs:* line of §4.4, now separates what needs Layer 1 only (the coset-monomial basis, its rank and the trace formula) from what needs §§4.1–4.3, which removes the apparent mutual dependence of §4.2 and §4.4; the split is correct at the pin and in the source. The title and the description's statements about MorseNovikov agree with the head. No finding and no small correction; one format note is carried over, not blocking, and one licence question is left for a human as before.

## N01 — The *In Tau Ceti:* line of Worked examples is detached from the example it realises

In Worked examples (line 1733) the line naming the irrational-period declarations still follows the sentences about `Suggested.lean` and "all other constructions and API targets", so it reads as if it realised those. It would sit better directly after the sentence on the irrational noninjective example that ends "as in Layer 1's Examples".

## Previous findings

- C01 — repaired: §4.4, line 891, reads "for the coset-monomial basis, its rank and Tr=k·restriction, Layer 1 coset modules only; for the norms, log Norm=Tr log and the torsion comparison, §§4.1–4.3 and Layer 1 positive logarithms."
- N01 — not repaired: line 1733 is unchanged; written again above as N01.

The previous report had no finding (R-numbered); its one small correction and one format note are accounted for above.

## Verified sound

| Statement | Instances | Values computed (left; right) | Result |
|---|---|---|---|
| §4.4 *Needs:* line, first clause (basis, rank, trace from Layer 1 only) | ℤ→ℤ/2, K=2ℤ, s=t², basis {1,t} | Tr(1+t²)=tr[[1+s,0],[0,1+s]]=2+2s; 2·restriction=2(1+s). Pin: `cosetBasis`, `finrank_eq_index`, `trace_eq_index_smul_comap` import Functoriality (Layer 1) and Mathlib only | holds; rt3 line 1069 (free of rank k) and Lemma 3.5(a) line 1090, p. 227 |
| §4.4 *Needs:* line, second clause (norms, log Norm=Tr log, torsion comparison) | Norm(1−t); Norm(1+ct) over ℚ | det[[1,−s],[−1,1]]=1−s; log(1−c²s)=−c²s−c⁴s²/2−⋯; twice even part of log(1+ct)=2(−c²t²/2−c⁴t⁴/4−⋯), equal | holds; needs positive logarithms (Layer 1) and, on total quotients, §4.2; rt3 Lemma 3.5(b)–(c) lines 1092–1097 |
| §4.2 ↔ §4.4 order | §4.2 line 811 asks for "the coset-monomial basis of §4.4"; §4.4 line 891 lists that basis under Layer 1 only | the basis item precedes §4.2; the norm on total quotients follows it | no cycle |
| Self-slide Check cited by the description (§6.2) | h=(−2,1), N(n,e)=−n | N(h)=2>0; μ(h)=−2≡1 mod 3; ν(h)=2 mod 4 | agrees with the description's "(−2,1)" and "positive Novikov period" |

The rows for the untouched statements stand as in the previous review, of `2f1f33b`.

- Source locators checked against the text: 3 (rt3 §3.4 line 1069, Lemma 3.5(a)–(c) lines 1090–1097, condition (3.8) line 1076; PDF page 19 = printed p. 227). No seeded target falls in the changed line.
- Library declarations opened at the pin: `TauCeti.NovikovSeries.cosetBasis` (RingTheory/NovikovSeries/FiniteIndex.lean:146), `finrank_eq_index` (:207), `trace_eq_index_smul_comap` (:216), with the file's imports (lines 8–12: four Mathlib modules and NovikovSeries/Functoriality); also located `TauCeti.flowOf`, `TauCeti.globalFlow`, `AddCircle.timeForm`, `continuousDomCongr`, `hahnSeriesEquiv` and `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`, which the description names.
- Cross-roadmap citations: the changed line cites none; the citation resolver reports none missing and the overlap report lists no dropped or revision-only id and no other open pull request changing this roadmap.
- Dependency check: `depcheck: 123 roadmaps, 1333 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks: every check passed. Elaboration: `lake env lean` on `Suggested.lean` exits 0 with only `declaration uses sorry` at 109:8 and 156:8; `Suggested.lean` is unchanged since `2f1f33b`, so the `#check @` comparison and the one-tactic probes of the previous review stand.
- The pull request's text against this head: 18 *In Tau Ceti:* lines naming 129 distinct declarations (counted: 18 and 129); Layers 1–7 kept; the only heading changed is "From TauCetiRoadmap.AlgebraicTopology"; 0 Lean declarations removed, added or restated; DGFloer appears only under Downstream consumers and UniversalCovers nowhere as a supplier; MorseTheory contract reads "M1–M2 and M6"; GeometricTopology contract reads Layers 4–5 with §4.4 and Layer 11; §6.5 cites Granas Theorem 10.1, p. 224; §6.1 cites rt3 Lemma 2.11(a); Downstream consumers precedes Worked examples; the summary block's four MorseNovikov changes (Laurent topological comparison over a field, square minors, self-slide class (−2,1), the pinned integral-one angular form) are each in the diff against `main`. Nothing contradicted, no change of the folder left unstated. The description is cut in the quotation after the BanachSpaceTheory list of changed statements; what follows the cut was not read.
- No file outside the pull request's own folders changes (the diff outside them is empty).

Overlap check: read MorseTheory, DGFloer and HeegaardFloer on main, and the open heads of HeegaardFloer, GeometricTopology and AlgebraicTopology, as in the previous review; the changed line touches no shared object; nothing shared.

Source independence: 1 passage compared with 1 source (changed passages only), none shared; largest share rt3, as in the previous review (62 of 99 source mentions); the diff adds, removes or reorders no layer, so the arrangement was not compared.

Research link: The headline equality of Novikov torsion times the zeta function with Reidemeister torsion is Hutchings 2002 (Theorems A and B), extending Hutchings–Lee 1999; TaubesGromov on main consumes Layers 1 and 4–6 for its orbit expansions. Rests on rt3, rt2 and the README's Downstream consumers.

## Not verifiable

- Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35 (§§7.1 and 7.3 and the `zeroSign` docstring): not in the manifest and no legal copy; the passages are unchanged.
- Hopf 1929 (`Hop29`): settled as uncertified; cited by its locator.
- Milnor, Whitehead torsion, §3, pp. 365–368 (§4.1): not in the cache; unchanged.
- The part of the pull request's description after the cut of the quotation: not read.

## Source issues

- none

## For the human reviewers

- Licence: Scope and ownership names an outside formalisation, Dongryul Kim's lean4-novikov (revision d5e705bd), and asks for coordination before code integration; `Suggested.lean` takes nothing from it. The passage is on `main` with one sentence reworded.
