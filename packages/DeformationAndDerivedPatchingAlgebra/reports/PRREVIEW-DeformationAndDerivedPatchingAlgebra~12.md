# Review of DeformationAndDerivedPatchingAlgebra (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 14 lines changed since `7c341e7`. Accepted: the change is the merge of `main`, which rewrites seven `*Needs:*` lines of Layer 2 (§§2.1–2.7) to name sections instead of whole layers; every section they name exists and states what the line says it supplies, and the folder's difference from `main` is still §3.12a alone, as accepted before. There is no finding, one small correction carried from the previous review (in text the pull request does not touch) and one format note; nothing is left for a human to decide.

## C01 — Untouched text: §3.2 (README line 522) cites a regular-local bound by a name no library declares

The sentence reads "PurityOfBranchLocus §0.3's `IsRegularLocalRing.globalDimension_le`". A reader who searches either pinned library for that name finds nothing. PurityOfBranchLocus (its README, line 442) records the item as realised by `TauCeti.IsRegularLocalRing.globalDimension_eq_ringKrullDim`, at `TauCeti/RingTheory/RegularLocalRing/ProjectiveDimension.lean`, line 222. Naming that declaration in place of the unknown name would fix the sentence. The line is the same on `main`, so it is a remark for a separate pull request and does not block.

## N01 — §2.5's `*Needs:*` line points at supplier contracts "above" that the contracts section does not list

Line 420 reads "the exact SchemeAndStackFoundations §§4.3–4.4 contracts above (hulls, smooth morphisms of deformation functors)". The section "Exact supplier contracts" stands after the layers and lists SchemeAndStackFoundations §0.17, §§2.18–2.21, SF.2 and SF.5, but no entry for §§4.3–4.4; the only statement of what is consumed is the paragraph before the line (line 418). The sentence would read true as "the SchemeAndStackFoundations §§4.3–4.4 comparisons of the preceding paragraph", or a contract entry for `IsHull`, `IsSmoothMorphism` and `smooth_iff_powerSeries` could be added. The line is the same on `main`.

## Previous findings

- The previous review (of `7c341e7`) had no finding.
- C01 (previous) — not repaired: line 522 still cites "PurityOfBranchLocus §0.3's `IsRegularLocalRing.globalDimension_le`". Untouched text, identical on `main`; carried as C01 above.

## Verified sound

The diff changes no statement. The rows are for the statements the changed `*Needs:*` lines cite.

| Statement | Instances tried | Computed left side | Computed right side | Result |
|---|---|---|---|---|
| §2.1 needs §1.9 (relative cotangent, series presentation) | `Λ` a complete DVR, `R=k` | `m_R/(m_R²+m_ΛR)=0`, so `d=0`, `S=Λ` | `J=(π)⊆m_S²+m_ΛS=(π)`; `J⊄m_S²=(π²)` | minimal in the relative sense only, as the Check says; §1.9 defines exactly this quotient |
| §2.1 needs §1.6 (labelled objects) | `R=Λ`; `k[[X,Y]]→k[[X]]` | `d=0`, identity; `J=(Y)` | `(Y)⊄m_S²=(X,Y)²` over `Λ=k` | agrees: not minimal |
| §2.1, §2.5 need SchemeAndStackFoundations §§4.3–4.4 | `R=Λ[[t_1..t_n]]`, `F=h_R` | §4.3: `T_{h_R}=Der_Λ(R,k)=kⁿ` | §2.1: `d=dim m_R/(m_R²+m_ΛR)=n` | agrees; `tangent_eq_derivations` is in §4.3, `IsHull` in §4.4 |
| §2.5 needs §1.11 and §4.4 (smooth morphisms) | `V=0` | `E(q)*→V` injective gives `r=0`, `R≅Λ[[X_1..X_d]]` | §4.4 `smooth_iff_powerSeries`: `h_R→h_Λ` smooth iff `R` a power-series ring; §1.11: `r=dim m_B/(m_AB+m_B²)` | consistent |
| §2.5 negative control | `R=k[ε]/ε²` over `Λ=k` | `d=1`, `J=(X²)`, `E(q)=J/m_SJ` of dimension `1` | `k→k[ε]/ε²` fails lifting in §1.11's Check (`k[t]/t³→k[t]/t²`) | agrees: not smooth, `r=1` |
| §2.6 needs §§1.6, 1.9 | `d=n=1`, relation `g²=1`, residual value `1` | `(1+X)²−1=X(2+X)`: char 2 gives `k[[X]]/(X²)`, tangent dimension `1` | bound `dn²=1`; char ≠ 2: `2+X` a unit, ring `k`, tangent `0≤1` | agrees |
| §2.3 needs §§1.7, 2.2 | `Λ/(π²)→k`, `R=k` | kernel `(π)/(π²)`, one-dimensional, killed by `m_B`: elementary socle extension of §1.7 | relation class of `π` in `E(q)=J/m_SJ=(π)/(π²)` maps to `π≠0` | agrees |
| §2.7, sample target, Kisin Lecture 1 | KisinLectures lines 28–33 (Remark (1.1.2)(1), p. 1), 49–50 and 67–76 (Proposition (1.2.1)(1) and proof, p. 2) | source: framed functor is the set of lifts; ring is a quotient of `W(F)[[X]]` in `s·n²` variables, generators to `X+[ρ̄](γ_i)` | README: `dim≤dn²`, generators of `S` to entries of `ρ^□(γ_i)−L_i`, reduction to the pro-`p` quotient of the residual kernel | supported; the README's finite-generation hypothesis is the one the proof uses |

The rows for every other statement stand as in the previous review, of `7c341e7`.

- Source locators checked against the text: 2 (Kisin, Lecture 1, Proposition 1.2.1(1), p. 2, and Remark 1.1.2(1), p. 1, cited by §§2.6 and 2.7; the seeded target 2.7 lies on a changed line). The other seeded targets lie outside the changed lines; 1.9 and 1.11, which the new lines cite, were read against §§2.1 and 2.5.
- Section citations resolved: 9 within the roadmap (§§1.6, 1.7, 1.9, 1.11, 2.1–2.4, 2.6 exist with the subjects the lines give) and SchemeAndStackFoundations §§4.3 and 4.4 on `main` (README lines 6385 and 6456: tangent spaces and `tangent_eq_derivations`; `IsSmoothMorphism`, `IsHull`, `smooth_iff_powerSeries`). PadicLocalLanglandsForGL2Qp §0.4 and ProfiniteProPGroups in §2.7 are unchanged apart from the emphasis of the label.
- Against `main`: the folder differs by the same 35 lines as at `7c341e7` (§3.12a and its three accompanying clauses); the seven `*Needs:*` lines are now word for word those of `main`. `Suggested.lean` is unchanged since `7c341e7`.
- Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`; no UPWARD or CYCLE line. The new lines add no supplier: SchemeAndStackFoundations was already cited there by layer.
- Automatic checks: all passed on this head. Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 18 `sorry` warnings and nothing else. No declaration is changed, so the one-tactic probe has nothing new to test.
- README record: the 9 layers of the merge base are kept with their titles; the only added heading is `### 3.12a`. Nothing is removed.
- Pull request text: the description's sentence on this folder ("DeformationAndDerivedPatchingAlgebra §3.12a from a Tau Ceti determinant formula") agrees with the head; the `*Needs:*` rewording is `main`'s, not a change of this pull request, and needs no mention. The pull request changes nothing outside `TauCetiRoadmap/`. No other open pull request changes this roadmap.

Overlap check: read LocalGaloisDeformationRings, DirectSummandsAndBigCohenMacaulay, DeformationAndDerivedPatchingAlgebraPartII (main) and SchemeAndStackFoundations §§4.2–4.4 (main); the change shares one object with them, hulls and smooth morphisms of deformation functors, owned by SchemeAndStackFoundations §§4.3–4.4 and cited, not restated, by §§2.1 and 2.5. Ownership against the other open pull requests was not re-read: the change adds no object.

Source independence: 7 passages compared (changed passages only: the seven `*Needs:*` lines, with §2.7's statement) with 1 source, KisinLectures lines 28–33 and 49–76; none shared beyond standard names. Largest share of the change's locators: none added. Arrangement not compared: no layer is added, removed or reordered.

Research link: The roadmap is the commutative algebra of Taylor–Wiles–Kisin and derived patching (Kisin; Khare–Wintenberger 2009; Calegari–Geraghty 2018), used in modularity lifting (Boxer–Calegari–Gee–Pilloni 2021; Allen et al. 2023); §3.12a is the order function of Stacks §10.121, consumed by ReducibilityIdealsAndUltrafilterPatching 3.17. Rests on the README's summary and References.

## Not verifiable

- none

## Source issues

- **Misprint** in KisinLectures at the proof of Proposition (1.2.1)(1), p. 2 (KisinLectures line 73): the source says the two matrix indices of the variables each run from 1 to n²; it should be that each runs from 1 to n, giving n² variables per generator; affects nothing.

## For the human reviewers

- none
