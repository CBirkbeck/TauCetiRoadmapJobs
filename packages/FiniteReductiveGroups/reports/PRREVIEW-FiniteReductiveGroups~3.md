# Review of FiniteReductiveGroups (pull request #2881 at 49427a0)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** accepted

**Summary.** Accepted, with no finding. This round adds a convention on statements taken from the formal proof and updates the family index. Neither changes a stated result. The convention picks out its targets by a status or route that names [FormalProof], but no target here has one. The two targets it is meant for, 2.7(b) and 2.8, carry no restriction their routes leave unused, so the convention changes nothing at present. There are three small corrections: the convention's wording, the missing locators carried from the last review, and the description's claim that every pull request in the family carries an identical index, which five sibling heads still contradict. There is also one format note, carried. The licence and scope of the formal-proof source, and the unread main source, are still for the human reviewers.

## C01 — The new convention covers targets "whose status or route names [FormalProof]", but no target in this README has a status line or a route that names it

As written, a reader cannot tell which statements the convention covers. So they cannot tell which statements might carry restrictions their routes do not use. [FormalProof] appears only in the convention (line 143) and in the References (lines 2442–2448). The References give it as the source of 2.7(b) and 2.8, and say [Announcement] is "cited at 2.7(b) and 2.8". Neither section cites either key.

In those two sections the convention changes nothing, because every restriction is used:
- `0 ≤ i ≤ n − k − 1` is what makes `c ≤ n`.
- `n ≤ q` is needed, as the Check shows: at `q = 2, n = 7, k = 3` it gives `74 > 60`.
- `sn ≤ g` gives `δ = 2sn/g` through `e^x ≤ 1 + 2x` on `[0, 1]`.

Either of two changes would fix this:
- Name the sections in the convention: "The statements 2.7(b) and 2.8, whose source is [FormalProof], are stated in the form that proof establishes …".
- Cite [FormalProof] in 2.7(b) and 2.8, with a locator in the formal proof.

## C02 — The general case of the headline 2.2, 4.5(b) and the perfectness statement of 3.2(d) still have no theorem or page

This is carried from the last review; the change did not touch these passages. Without a locator, an implementer cannot find the general case of these statements in print:
- 2.2 leaves the general case of multiplicity one to "Steinberg, *Lectures on Chevalley groups*; Digne–Michel" (line 512).
- 4.5(b) cites "Deligne–Lusztig, §8; Digne–Michel" (line 1199).
- The perfectness of `RΓ_c(X, Λ)` over `Λ[Γ]` for a free action (3.2(d), line 893) has a route but no source for the general statement.

A theorem and page number at each of these three places would fix this.

## C03 — The description still says every pull request in the family carries an identical family index, but five sibling heads carry an older version

This head's index is now the same as at #2890, #2921, #2893, #2877 and #2885. It differs from the index at #2889, #2879 and #2908 (this pull request's suppliers in the family), and at #2896 and #2918, in two ways:
- Their opening paragraph still says the last roadmap "states and proves these theorems". It lacks this head's sentence separating the two theorems of the formal proof from the consequences drawn by published theorems.
- They lack the sentence that citations between the roadmaps are by section number.

At #2889 the one-line description of Chow forms and heights also differs. The order of the roadmaps is the same in all eleven versions, so this roadmap's supplier order is unaffected. Either bring those five branches up to this version, or replace the sentence with "is carried by every pull request of the family; the versions agree on the order of the roadmaps".

## N01 — The References entry for Mumford, *Abelian varieties*, §7 still names 3.2(c) only

3.2(d) cites the same section (line 912); the entry (line 2435) could add it.

## Previous findings

- C01 — not repaired: 2.2 still cites "Steinberg's theorem (Steinberg, *Lectures on Chevalley groups*; Digne–Michel)" (line 512), and 4.5(b) and 3.2(d) are unchanged; carried as C02.
- C02 — partly repaired: this branch's index now matches #2890, #2921, #2893, #2877 and #2885 and adds "a section keeps its number"; #2889, #2879, #2908, #2896 and #2918 still carry the older index; carried as C03.
- N01 — not repaired: "D. Mumford, *Abelian varieties* (1970), §7; A. Grothendieck, … (SGA 1), Exp. V: 3.2(c)"; carried as N01.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
|---|---|---|---|
| New convention (line 143) | targets whose status or route names [FormalProof]; References | 0 targets name it; References name 2.7(b), 2.8 as its source | selects nothing as written: C01 |
| 2.7(b), `n = 2, k = 1, i = 0` | `H₀ = 1`; degrees of both sides | `q(q−1)(q²−1) = (q−1)(q²−1) + (q−1)·(q−1)(q²−1)` (`Γ_{(1,1)} = Ind_U 1`, `Γ₂`) | holds |
| 2.7(b), range of `i`, `k` | `i = n − k`; general `k` | `c = n + 1`, no column; multiplicity sum `1 + (q^{k−1} − 1) + (q^k − q^{k−1}) = q^k = [U_n : H_i]` | every restriction used |
| 2.8(b), `n ≤ q` | `q = 2, n = 7, k = 3, L = T`; `q = 3, n = 3, k = 2, L = T` | `m = 35+4+14+21 = 74 > 60`; `m = 15`, bounds `6 ≤ 15 ≤ 24` | hypothesis needed and used |
| 2.8(c), `δ = 2sn/g` | `e^x ≤ 1 + 2x` at `x = 1`; `q = g = 4, n = 2, k = 1, s = 1, L = T` | `2.718 ≤ 3`; `m = 5`, `n̄ = 4`, `δ = 1`: `0 ≤ 5 ≤ 8` | holds |
| 2.8(c) consumer | GluedTargetAndDivisionInequality at its head, line 1131 | `s = 2f`, `n = r`: `δ = 4fr/g` there; `2·2f·r/g` here | matches |
| `bessel_pairing_eq` (Lean form of 2.7(b)) | `#check @` at this head | `1 ≤ k`, `i + k < n`, `ψ₀ ≠ 1`, `[Finite K]`; `j ∈ range k`, exponent `k − j − 1 ≥ 0` | matches README; unchanged |
| Family order after the move | index at this head and ten sibling heads | Tensor induction 40, Orbit measures 59, Local factors 91 < Finite reductive groups 94 < Base change 98; order identical everywhere | ordered |
| Family index opening paragraph | the formal proof's repository README | there: "claims a proof", verification results pending; here: "source with a public verification setup" | consistent; human reviewers |

The rows of the previous reviews for statements this change does not touch stand as in the review of `7472476`. None of the seeded sample's targets falls in the changed passages.

- Changed passages: the convention paragraph (README lines 143–145) and the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, the pull request's own); `Suggested.lean` is unchanged since `7472476`.
- Source text read: the formal proof's repository README (claim, verification status, licence).
- Cross-roadmap citations resolved: FiniteReductiveGroups §§2.7(b), 2.8 as cited at the heads of BesselPoincareSeriesAndGramBounds (README line 1771), RowTowerAndRallisIdentities (line 1631), GluedTargetAndDivisionInequality (lines 1130–1132), ThetaChainsOnDefiniteUnitaryGroups (line 1125); the family index at ten sibling heads.
- Automatic checks: the worker's checks passed. My rerun of the gate flagged only the items set aside below. Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`.
- Elaboration: `lake env lean` gives three `sorry` warnings and nothing else. The seven `#check @` probes give the same types as the recorded signatures; no binder dropped.
- Overlap check: read the supplier contracts of BesselPoincareSeriesAndGramBounds and RowTowerAndRallisIdentities (open), and searched every roadmap for the Bessel-type pairs and multiplicities of 2.7–2.8, which the convention concerns. Those two, GluedTargetAndDivisionInequality and ThetaChainsOnDefiniteUnitaryGroups cite them from FiniteReductiveGroups, which owns them. The other closest roadmaps (LocalFactorsOfTwistsAndTypes, BaseChangeAndGaloisRepresentationsForUnitaryGroups, SeesawForThetaChains, SmoothRepresentationsOfLocalGroups, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer) stand as the previous review read them. The change adds no object.
- Source independence: changed passages only. Two passages (the convention and the family index's opening paragraph) were compared with one source (the formal proof's repository README), and no wording is shared. No layer was added, removed or reordered, so the arrangement was not compared again. The largest share of locators is still DeligneLusztig1976's, 7 of 14 in-text locators; its text and table of contents were not read (no legal copy).
- Research link: Layers 3–4 are Deligne–Lusztig's 1976 theory, Layer 5 is Green's 1955 character theory of `GL_n(𝔽_q)` with Shintani's 1976 descent, and Layer 6 is the depth-zero construction of Moy–Prasad (1994, 1996). BaseChangeAndGaloisRepresentationsForUnitaryGroups §§10.34–10.35 uses Layer 6 for explicit depth-zero Langlands parameters. This rests on the README's References and Downstream consumers.

## Not verifiable

- [FormalProof]: no locator in the formal proof is given for 2.7(b) and 2.8, so their statements were not compared with its files.
- Mumford, *Abelian varieties*, §7, and Bernstein–Zelevinsky (6.5): as in the previous review, not readable legally.
- DeligneLusztig1976, Green1955, Shintani1976 and the monographs: as in the previous review, not readable legally or not read.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folder flagged the three files of the family index (the family folder's `README.md`, `Suggested.lean` and `metadata.toml`). They belong to this pull request, because every roadmap of the family carries the index. The supplier-order check reported that this roadmap is not yet in the merge order, which is expected for a new roadmap: it is placed right after its last supplier.

## Source issues

- none

## For the human reviewers

- Scope: the family follows a Lean formalisation ([FormalProof], README line 2442). The family index now names its author and calls it "the formal Lean proof … of the Riemann hypothesis". Its repository's README describes it as a formalisation that "claims a proof", with verification results still to come.
- Licence: [FormalProof] is cited as the source of 2.7(b) and 2.8. Its repository says the submission "was published without a license". `bessel_pairing_eq` was not compared with its source files.
- Licence: [Announcement] (README line 2447) is a PDF on a host that could not be classified; it is cited at 2.7(b) and 2.8.
- Not tested: DeligneLusztig1976, the source with the largest share of locators (7 of 14), could not be read legally, so wording and arrangement were not checked against it.
