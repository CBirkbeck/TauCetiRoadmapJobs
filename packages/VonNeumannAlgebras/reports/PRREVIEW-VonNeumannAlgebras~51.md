# Review of VonNeumannAlgebras (pull request #3027 at f3b4ab1)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 44 changed lines since `74a09b7`. The change adds one item, V9.IntegrableDiscreteSeries (Barnes's projector of an integrable discrete series), with its route, a Dependencies line, a supplier contract and a reference. The statement, its conjugation convention and every step of the route were recomputed on C₂, C₃, S₃ and SL₂(ℝ), and they hold; the BanachAlgebras §§7.2–7.3 citations match BanachAlgebras on `main`; no layer or item of `main` was removed. There are no findings. One small correction: the statement assumes a second-countable group, which its source, its supplier and its route do not need, while the description and its consumer call it general. There is also one format note, and neither blocks. One item is left for the human reviewers: Barnes (1980), the only source of the added text, has no legal copy, so its locator and wording were not checked.

## C01 — V9.IntegrableDiscreteSeries assumes G second-countable, which its source, its supplier and its route do not need, while the description and its consumer say it holds for every unimodular group

The library would get Barnes's projector only for second-countable groups. A compact group such as `(ℤ/2)^ℝ` is excluded: it is unimodular but not second-countable, and every character is square-integrable and integrable. Yet the route applies to it word for word. The statement at line 2534 begins "Let G be a unimodular second-countable locally compact group", but its own locator at line 2545 says Barnes proves it "for every unimodular locally compact group". BanachAlgebras §7.2, which supplies `L¹(G)` with its convolution and involution, says it has no second-countability assumption (BanachAlgebras README, lines 1485 and 1500). This roadmap's Summary (line 7) and Conventions (line 133) include all cardinalities unless a stated theorem needs separability. The Bochner integrals of the route are taken against `e_π∈L¹`, which lives on a σ-compact set, so they need no countability either.

Two texts of this pull request already treat the statement as general. The description says each added section is "stated in the generality of its source" and lists no exception for this roadmap. RowTowerAndRallisIdentities 5.2a cites V9.IntegrableDiscreteSeries for every unimodular locally compact group, and calls itself its case of a second-countable group (that README, lines 506–507, 516 and 2635). The smallest repair is to delete "second-countable" at line 2534. Then the README, the description and the consumer agree. If the hypothesis is meant, say at line 2534 what needs it, and add this section to the description's list of statements narrower than their sources.

## N01 — `*` denotes both convolution and the involution in the route

In the route (lines 2548 and 2552), `e_π*=e_π` and `e_π*f**f*e_π` read ambiguously. Writing the involution as a superscript (`e_π^*=e_π`, `e_π * f^* * f * e_π`) would remove the ambiguity.

## Questions for the author

- Does Barnes state the range of `ρ(e_π)` for an arbitrary unitary representation ρ (the README points to Lemma 1, p. 233)? Or does he only show that `e_π` is a minimal self-adjoint idempotent acting as the projection onto ℂw in π, which would leave the statement for every ρ to the route given here? No legal copy of the paper could be read, so I could not tell which part is his.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| V9.IDS: `e_π*e_π=e_π` | C₂ with counting measure, sign character, `d=1/2` | `e=(1/2,−1/2)`; `(e*e)(0)=1/4+1/4=1/2`, `(e*e)(1)=−1/4−1/4=−1/2` | holds | none |
| V9.IDS: `e_π(g⁻¹)=conj e_π(g)`, so `e_π^*=e_π` | unimodular G, so `c≡1` in BanachAlgebras' `f*(x)=c(x)conj f(x⁻¹)` | `d⟨π(g⁻¹)w,w⟩=d⟨w,π(g)w⟩=conj e(g)` | holds | none |
| V9.IDS: the conjugate in `e_π` (convention witness) | C₃, `χ(g)=ω^g`, counting measure, `d=1/3` | as written: `χ(e)=(1/3)Σω^{−g}ω^g=1`; without the conjugate: `(1/3)Σω^{2g}=0` | the conjugate is needed and is there | none |
| V9.IDS: `ρ(e_π)` is the projection onto the closure of `{Tw}` | S₃ standard σ (`d=1/3`); ρ regular, ρ trivial | regular: `tr λ(e)=6·e(1)=2`, the multiplicity; trivial: `Σ_g e(g)=d·conj⟨w,(Σσ(g))w⟩=0` | holds | none |
| Route: `e_π*f*e_π=⟨w,π(f)w⟩e_π` | C₃, `f=δ₁` | `e*δ₁*e=ω·e`; `⟨w,χ(δ₁)w⟩=ω` | holds | none |
| Route: `‖ρ(f)x‖²=‖π(f)w‖²‖x‖²` | C₂, ρ regular, `x=(δ₀−δ₁)/√2`, `f=δ₁` | left side `‖(δ₁−δ₀)/√2‖²=1`; right side `1·1=1` | holds | none |
| Remark: weight-2 discrete series of SL₂(ℝ) is L² but not L¹ | KAK coordinates, coefficient size `(cosh r)^{−k}`, Haar measure `~sinh 2r dr` | L²: `∫e^{(2−2k)r}dr` converges at `k=2`; L¹: `∫e^{(2−k)r}dr` diverges at `k=2` | holds | none |
| Remark: compact G, range has dimension equal to the multiplicity | S₃ σ in the regular representation; `T↦Tw` injective | range dimension 2 = multiplicity 2; `{Tw}` already closed | holds | none |
| Generality of V9.IDS | `(ℤ/2)^ℝ`, compact and not second-countable; Barnes (line 2545); BanachAlgebras §7.2 (line 1485) | README excludes it; source, supplier and route cover it | narrower than needed | C01 |
| Supplier: BanachAlgebras §§7.2–7.3 | BanachAlgebras README on `main`, lines 1480–1581 | `(f*h)(x)=∫f(y)h(y⁻¹x)dμ(y)`, `f*=c·conj f(x⁻¹)`; integrated operator for uniformly bounded strongly continuous representations; "intertwiner compatibility" (line 1581) | matches the *Needs:* line | none |
| 13.1 (seeded): Check on Tomiyama's theorem | `a=diag(2,3)`, `b=diag(5,7)`, `x=[[1,2],[3,4]]` | `axb=[[10,28],[45,84]]`, `E(axb)=diag(10,84)=aE(x)b`; Hiai Thm 6.5, p. 55, gives (ii) and (v) of Thm 6.4 | holds | none |
| 13.1 (seeded): Check that extensions are not unique | `ρ=[[1/2,c],[c̄,1/2]]` | `ρ≥0` iff `1/4−|c|²≥0` iff `|c|≤1/2`; `Tr(ρ·diag(a,b))=(a+b)/2` | holds | none |
| 13.2 (seeded): projection form for injective II₁ factors | anantharaman-popa line 7413 (PDF p. 172 = printed p. 166), line 7532 (printed p. 168) | finite-rank P with `max‖uPu*−P‖₂<ε‖P‖₂`, as stated in the README | holds | none |
| 13.2 (seeded): uniqueness of the injective III₁ factor | haagerup-2016 lines 49–52, p. 2 | Theorems 1.1–1.2 on p. 2, as cited | holds | none |

- Source locators checked against the text: 9, all in the seeded sample, which lies outside the change (Hiai Thms 6.4–6.5, pp. 53–56; Peterson Thm 6.2.1, p. 98; Anantharaman–Popa Def 10.2.1 with Prop 10.2.2 on p. 161, A.4 on p. 314, Thm 10.3.1 on p. 166, Thm 10.3.4 on p. 168, Defs 11.1.1–11.1.2 on p. 173, Rem 11.2.3 on p. 188; Haagerup 2016 Thms 1.1–1.2, p. 2). Barnes 1980: 0 (unreadable).
- Record: the README at the merge base and at this head have the same 14 layers and headings. The one deleted line (supplier contract, line 5513) comes back extended. No item is removed or renamed.
- Cross-roadmap citations resolved: BanachAlgebras §7.2 (line 1480) and §7.3 A7.IntegratedRepresentations (line 1540), both on `main` and unchanged by the pull request. BanachAlgebras names VonNeumannAlgebras only as a downstream consumer (its line 1968), so there is no cycle. RowTowerAndRallisIdentities 5.2a (lines 506, 516, 2635) is the one consumer of the new item.
- Duplication: searched the roadmaps on `main` and the open heads for integrable discrete series, minimal idempotents and formal degrees. There is no second owner. BesselPoincareSeriesAndGramBounds 5.15a uses the same `e_σ` for a different statement (relative orthogonality).
- Library: Tau Ceti `integratedOperatorCLM` (`TauCeti/Analysis/CStarAlgebra/Action/Covariant/Normed.lean`, line 48) is the native integrated operator behind BanachAlgebras §7.3. The diff adds no Lean name.
- Automatic checks: all passed. Dependency check output: `depcheck: 132 roadmaps, 1467 edges, 0 problem(s)`. No changes outside the folders the pull request owns.
- Elaboration: `lake env lean` of `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` gave 33 `declaration uses sorry` warnings and nothing else. The diff does not touch the file, and no declaration lost a section binder.
- BanachSpaceTheory anchors B1, B2, B4 (lines 5446, 5455, 5456) resolve on `main` and at this head. The open revision of BanachSpaceTheory (#1854) renames those headings and keeps the ids. Keeping the old anchors is that revision's job, and the text cited here is untouched.

Overlap check: read TracesOnCStarAlgebras, SchattenClassesAndSchurMultipliers, SelfAdjointSpectralTheory, BanachSpaceTheory, BochnerSpaces (open), AmenableTracesOnCStarAlgebras, CStarAlgebras, FactorRigidity (on `main`); the results list was empty. Nothing is shared with the change: the projector of V9.IntegrableDiscreteSeries is owned here, and `L¹(G)` with its integrated representations is owned by BanachAlgebras §§7.2–7.3, which is cited.

Source independence: changed passages only. There are 4 added passages: the statement, the route, the compact and SL₂ remark, and the supplier and reference lines. 0 passages were compared with their one source, Barnes 1980, which has no legal copy; their formulas are forced by the mathematics. No layer was added, removed or reordered, so the arrangement was not compared. Largest share in the README: anantharaman-popa, 40 of 169 locators by a pattern count.

Research link: Layer 13 states Connes's classification of injective factors and the uniqueness of the injective III₁ factor (Haagerup 1987, 2016). Layer 9's formal degrees and the added projector (Barnes 1980) are used for the discrete-series multiplicities of RowTowerAndRallisIdentities 5.2a. Rests on the README Summary and References and on haagerup-2016 lines 49–52.

## Not verifiable

- Barnes 1980, Lemma 1 (p. 233) and Proposition 1 (pp. 230–231), cited in V9.IntegrableDiscreteSeries: the sources service found no legal copy (the DOI resolves to a publisher page on a host in no licence class). The statement was checked by computation only.
- tomiyama-1957, Theorem 1 (pp. 608–609), cited in 13.1 (seeded sample): the cached text is an access-denied page, not the paper.
- arveson-1969, Theorem 1.2.3 (13.1): settled as uncertified, not read.
- Takesaki I and III locators in 13.2 (Theorem IV.4.9; XV.3; XVIII.1–2): no cached text.

## Source issues

- none

## For the human reviewers

- Not tested: Barnes 1980 (Proc. Edinburgh Math. Soc. 23, 229–238, DOI 10.1017/S0013091500003114), the only source of V9.IntegrableDiscreteSeries (README lines 2534–2545), had no legal copy, so its locator and the wording of the added passages were not compared with it.
