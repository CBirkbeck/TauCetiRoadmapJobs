# Review of PrismaticCohomology (pull request #1057 at c0c3cf0)

**Verdict:** accepted

No findings. Incremental re-review of the 32 lines changed since `ed42a0a` (four `**Checks.**` lists added in `TauCetiRoadmap/PrismaticCohomology/README.md` at §§0.58, 1.3, 2.4, 2.16; the four corresponding `### Examples` paragraphs removed), and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/PrismaticCohomology/README.md` lines 1141, 1810, 2439 and 2628 each open a `**Checks.**` list of three computed bullets under §§0.58, 1.3, 2.4 and 2.16; the duplicated Examples paragraphs are gone.
- R02 — repaired: both the summary block and the following paragraph now read “a de Rham comparison under the additional hypothesis that W(A/I) is p-torsion-free”, matching §1.22 (README line 2171) and `Suggested.lean:14`.

## Verified sound

| Statement | Instances tried | Computed construction / left side | Computed comparison / right side | Result; change |
| --- | --- | --- | --- | --- |
| §0.58 Check 1 (ghost image) | `p=2`, `R=Z`, Witt coordinates `(2,−2)` | Ghost pair `(x, x²+2y)=(2, 4−4)=(2,0)` | Fibre condition `b≡a²` mod 2: `0≡4` holds | True; none |
| §0.58 Check 2 (non-image) | `p=2`, `R=Z`, pair `(1,0)` | Preimage needs `x=1`, `1+2y=0`, so `y=−1/2∉Z` | `0≢1²` mod 2, so `(1,0)` lies outside the fibre product | Consistent with §0.58 (1); none |
| §0.58 Check 3 (derived corner) | `R=F₂` (2-torsion) | `W₂(F₂)=Z/4`: 4 elements | `{(a,b)∈F₂²: b=a²}`: 2 elements | Underived square fails, as part (2) requires; none |
| §1.3 Check 1 | `(A,I)=(Z₂,(2))`, `X=Spf(A/I)` | `(X/A)_Δ` has final object `(A,I)`; `H⁰(O_Δ)=Z₂` | Reduction sheaf would give `F₂` | Agrees with `(ν_*F)(U)=H⁰((U/A)_Δ,F)`; none |
| §1.3 Check 2 | `U=∅` | Slice has only `B` with `B/IB=0`, so `B=0`; sections `0` | Constant presheaf `A` gives `A≠0` | Discriminating; none |
| §1.3 Check 3 | `U=X⨿X`, `A=Z₂` | Slice is a disjoint union of two copies; sections `Z₂×Z₂`; restriction `a↦(a,a)` | `(1,0)` is not of the form `(a,a)` | True; none |
| §2.4 Check 1 | `(Z₂,(2))`, `X=Spec F₂` | Affine recovery: `Δ_(F₂/Z₂)=Z₂`, `φ=id` | `Δ̄=F₂≠Z₂` | True; none |
| §2.4 Check 2 | `X=Spec F₂⨿Spec F₂` | Sheaf value on disjoint union: `Z₂×Z₂` | One component: `Z₂`, loses `(0,1)` | True; none |
| §2.4 Check 3 | `X=Spec F₂[t]` | Hodge–Tate: `Hⁱ(Δ̄)=Ωⁱ{−i}`: `F₂[t]`, `F₂[t]dt`, `0` for `i=0,1,2` | Rank of `Ω¹` is 1, `Ω²=0`; twist trivial since `I=(2)` is principal | Agrees with §§1.16, 2.3; none |
| §2.16 Check 1 | `R=A/I`, empty presentation; `(Z₂,(2))` | `S=(A/I)⊗̂R=A/I`; `B=Δ_((A/I)/A)=A`; `B/IB=A/I` | `R→B/IB` is the identity: `F₂→Z₂/2` | True; none |
| §2.16 Check 2 | `R=F₂[x]` over `(Z₂,(2))` | `S=F₂[x^(1/2^∞)]` perfect, `L_(S/F₂)=0`, so `Δ̄=S`, `Δ=W(S)`; `φ[x^(1/2)]=[x]` | `B/2=S⊋R`; `x^(1/2)∉F₂[x]` | True; none |
| §2.16 Check 3 | same `R` | `H¹(Δ̄_(R/Z₂))=Ω¹_(R/F₂){−1}=F₂[x]dx≠0` | A prism `(B,IB)` has `B/IB` a ring in degree 0 | `Δ_(R/Z₂)` is not a prism; consistent with BS22 Lemma 7.7's discreteness hypothesis; none |
| PR description, de Rham clause | `A=Z₂[ε]/ε²`, `I=(2)`, `φ(ε)=0` | `2[ε]=V([ε²])=0` with `[ε]≠0` in `W(F₂[ε]/ε²)` | Description now excludes this base for the de Rham comparison only | Matches §1.22; none |

Rows for untouched statements stand as in the previous review, of `ed42a0a`.

- 32 changed lines reviewed (24 insertions, 8 deletions, README only); 2 previous findings accounted for; 0 Lean declarations changed; the three-dot diff against the base shows 0 files outside the folder; worktree clean.
- 4 source locators re-opened behind the changed passages, including the seeded target §0.58: BS22 line 531 (Remark 2.5, p. 14), line 2232 (Lemma 7.7, p. 57), line 1488 (Construction 4.4, p. 37), line 2344 (Proposition 7.11, p. 60); each supports the statement its Checks are attached to.
- No section, layer or supplier changed; the four removed Examples paragraphs (§§0.58, 1.3, 2.4, 2.16) are cited nowhere else in the README; the citation scan reports 0 unresolved cross-roadmap citations.
- Gate: every scanner 0, `OK`. Dependency check: `depcheck: 247 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/PrismaticCohomology/Suggested.lean`: 4 `sorry` warnings (lines 58, 70, 80, 129), nothing else; the file is byte-identical to the one read at `ed42a0a`, so the 13 `#check` signatures and the padding probe stand.
- Title and description read against the head: the pull request adds the roadmap (3 files, 3090 insertions, 0 removed headings or declarations); “four headline theorems” = `freeDelta_universal`, `witt_cofree`, `perfect_wittEquiv`, `generalEnvelope_exists`; “three layers” = Layers 0–2; the sentence on three computed Checks at the four definitions holds at lines 1141, 1810, 2439, 2628; the almost-purity, `AdicCompletion` and bounded-prism clauses match §§2.31, 0.39 and 1.2. No sentence contradicted, no change left unstated.
- Remark (untouched text, no change asked): README line 1806 gives the locator “BS22, Construction 4.4; p. 37” twice in one parenthesis.

Overlap check: read PrismaticCohomologyPartII, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, PerfectoidQuotients, AInfCohomology, EnhancedDerivedSheaves, PerfectoidSpaces, DerivedModuleAlgebra and DerivedDeRhamCohomology; the change adds no object and moves none, so the owners stand as recorded for `ed42a0a`. Searched at the open heads and on main for the objects of the changed passages: the `W_2` pullback square and the pushforward `ν_*` are stated only here; the oriented lifting input behind §2.16 remains PerfectoidSpaces §P4.15.4, which §2.16 cites.

Source independence: changed passages only; 12 added Check bullets compared with 1 source (BS22 at lines 531–546, 1488–1500, 2232–2246, 2344–2362), none shared: the Checks are numerical instances at `p=2` that the text does not contain; ALB23 Proposition 3.1.11, the second locator of §2.4, was not re-opened this round (its text is unchanged since the review of `ed42a0a`). Largest share BS22, 259 of 367 locators, unchanged; no layer added, removed or reordered, so the contents comparison is not reopened.

## Not verifiable

- none within the changed passages.

## Source issues

- none

## For the human reviewers

- none
