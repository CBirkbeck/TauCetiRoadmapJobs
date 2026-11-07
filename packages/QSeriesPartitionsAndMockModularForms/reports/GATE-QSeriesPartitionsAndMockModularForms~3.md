# GATE-QSeriesPartitionsAndMockModularForms~3: answers to human review

One comment (roed-math, cross-PR overlap check against the ModularForms revision #1706), six distinct points, numbered H01–H06 in the order they appear. Commit `4f0a0e00` on top of `b0f44a8`. Only `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` changed (23 insertions, 15 deletions). `Suggested.lean` is byte-identical to `b0f44a8`: no headline declaration mentions ModularForms.

The comment checked #1706 at `65c1a73`. Every ModularForms id below was re-checked at #1706's head now, `a24d49a` ("ModularForms: answers to the overlap cross-check"). That head differs from `65c1a73` exactly on the eta point.

## H01 (roed-math) — applied differently

At #1706 head `a24d49a` the eta transformation is not gone. It moved to ModularForms §0.2, "The eta transformation and eta quotients". That section's `etaTransformation` gives, for every γ∈SL₂(ℤ), a constant ε(γ) with ε²⁴=1 and η(γτ)=ε(γ)·√(cτ+d)·η(τ) (principal root), with the Dedekind-sum value for c>0. Its Checks give ε(T)=e^(πi/12), ε(S)=e^(−πi/4) with √τ, and ε(−I)=−i. These are the values in our Conventions (README line 22). #1706's relabelling table maps "Worked examples, target η²⁴=Δ" to §0.2, and its Downstream consumers paragraph names this roadmap as the consumer of §0.2.

So the repair cites ModularForms §0.2. Making the transformation a target of §5.2 would plan ModularForms' theorem a second time. Changes:
- README line 13 (scope) and line 100 (supplier contract, with ε's formula and values): "Worked examples, target η²⁴=Δ" → "§0.2".
- §5.2 (lines 821–839): ν_eta is now defined as §0.2's ε(γ). The sentence "Transport … and prove independence of τ" is removed. The cocycle law is now an explicit statement with the three roots: ν(γ₁γ₂)√(c₃τ+d₃)=ν(γ₁)ν(γ₂)√(c₁γ₂τ+d₁)√(c₂τ+d₂), with the ratio ±1 and constant. The proof sketch derives it from §0.2.
- §5.2 gets two Checks: ν(−I)²=−1≠ν(I), and ν([[1,0],[1,1]])=e^(−πi/12).
- `*Needs:*` (line 831) and Layer 5 `### Dependencies` (line 969): → ModularForms §0.2.

## H02 (roed-math) — applied

"ModularForms Layer 0" (on main: diamond operators and character spaces) is replaced by the pinned Tau Ceti carriers that #1706 lists: `modFormCharSpace`, `cuspFormCharSpace`, `mem_modFormCharSpace_iff_nebentypus` and `mem_cuspFormCharSpace_iff_nebentypus`. They are in `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean` at both Tau Ceti pins (`a91d3aaf` lines 279, 315, 344, 376; `2fd255d9` lines 291, 327, 356, 388). This citation therefore adds no dependency on #1706.

Changes:
- New supplier paragraph (line 64). It quotes the membership criterion f∣[k]γ=χ(d_γ)f, where d_γ is `Gamma0Map`, the lower-right entry.
- New Mathlib row `ModularForm`, `CuspForm`, `ModularForm.slash_apply` (line 46).
- §8.1: proof sentence (line 1174), `*Needs:*` (line 1176), and Layer 8 `### Dependencies` (line 1362) now name these carriers.
- New §8.1 law bullet (line 1172): it identifies the holomorphic and cusp subspaces for the multiplier χ(d_γ) on the inverse image of Γ₀(N) with `modFormCharSpace k χ` and `cuspFormCharSpace k χ`. This states the "character comparison" that the supplier contract already promised.
- New Check (line 1184): at N=5, χ(2)=i, γ=[[3,1],[5,2]], the factor χ(d)=i, but χ(a)=χ(3)=−i.

## H03 (roed-math) — applied

§4.8a `*Needs:*` (line 754): "Layer 2 (U operator conventions)" → "Conventions (normalizations of Uₚ …)". #1706's Conventions fix the arithmetic normalization. At every weight, U_p f = Σ_j p^(k−1)(p)^(−k) f((τ+j)/p) = (1/p)Σ_j f((τ+j)/p), and aₙ(U_p f)=a_(pn)(f). This is §4.8a's U₁₁. One sentence now says so (line 740), and a Check pins it (line 764): U₁₁(q¹¹+q)=q.

## H04 (roed-math) — applied differently

The Fricke normalization is not in #1706 §6.1. That section defines the partial operator 𝒲_Q for Q‖N, using the Atkin–Li matrix and the factor (√Q)^(2−k); it agrees with the full Fricke relation at Q=N up to matrix-choice scalars. The full normalized Fricke operator, (√N)^(2−k) times the native slash by (0,−1;N,0), is stated in #1706's Conventions, so line 754 cites Conventions.

At weight zero, Mathlib's slash (`ModularForm.slash_apply`: f(gτ)|det g|^(k−1)(cτ+d)^(−k), same at both Mathlib pins) gives 11⁻¹F(−1/(11τ)). The normalization then gives (√11)²·11⁻¹F(−1/(11τ))=F(−1/(11τ)), which is the substitution used in gₙ and in the Fricke principal-part identity. The line-764 Check records both values.

## H05 (roed-math) — answered

This is confirmed at `a24d49a`.
- §10A ("Arithmetic specialization of the quotient") has X(Γ), its cusp and elliptic counts, and the genus formula. Its Check for Γ₀(11) is (12,0,0,2), giving g=1+1−0−0−1=1.
- §10B has line-bundle cohomology, Riemann–Roch and Serre duality on nonempty connected compact Riemann surfaces.

Both citations in §4.8a and §8.6 stand. Two missing occurrences were added: Layer 10A to the ModularForms supplier contract (line 100), and ModularForms Layers 10A–10B and Conventions to Layer 4's `### Dependencies` (line 794).

## H06 (roed-math) — answered

The pull-request description is written by the worker, not in this folder. The README now cites ModularForms §0.2 and Conventions. Main does not define these in this form: on main the eta content is the worked example and the heading is "Standing hypotheses and conventions". So this roadmap depends on #1706. It is listed under "only an open revision defines" below, and the merge-order paragraph of this PR's description must name #1706 as merging first.

## Adversarial pass on the added and changed statements

| Statement | Instances | Values computed | Result / change |
| --- | --- | --- | --- |
| §0.2 values in supplier contract | T; S; −I | T: c=0, d=1, so ε=e^(πi/12). S: a=d=0, c=1, s(0,1)=0, so ε=exp(πi(0−0−1/4))=e^(−πi/4); on the roots side, arg √(−iτ)=(arg τ−π/2)/2=arg(e^(−πi/4)√τ). −I: √(−1)=i, so η=ε·i·η gives ε=−i | matches §0.2 Checks and our Conventions line 22 |
| ν_eta := ε(γ) | γ=I; γ=−I | ν(I)=1; ν(−I)=−i; the quotient at τ=i is η(i)/(i·η(i))=−i | holds |
| Cocycle with root ratio | (−I,−I); (S,S) at τ=i; (T,S) | (−I,−I): LHS ν(I)√1=1, RHS (−i)²·i·i=1; without the ratio, (−i)²=−1≠1. (S,S): c₁·Sτ+d₁=i, so RHS = ν(S)²·√i·√i = (−i)(i) = 1 = ν(−I)√(−1) = (−i)(i). (T,S): TS=[[1,−1],[1,0]], so ν(TS)√τ=e^(πi/12)e^(−πi/4)√1·√τ, giving ν(TS)=e^(−πi/6); Dedekind formula: exp(πi(1/12−0−1/4))=e^(−πi/6) | holds; ratio is needed (Check added) |
| Ratio ±1 and constant | c₁,c₂,c₃ zero or not | each √(cτ+d) is continuous on ℍ (for c≠0, cτ+d avoids the negative axis; for c=0 it is constant); its square is 1 by j(γ₁,γ₂τ)j(γ₂,τ)=j(γ₁γ₂,τ) | holds on the connected ℍ |
| Check [[1,0],[1,1]] | τ=i via S, T⁻¹, S | γτ=−1/(w−1) with w=−1/τ; η(γτ)=√(−i(w−1))·e^(−πi/12)·√(−iτ)·η(τ); at τ=i, √(1+i)·e^(−πi/12)·1, divided by √(cτ+d)=√(1+i), gives e^(−πi/12). Formula: (1+1)/12−s(1,1)−1/4=−1/12. With the root √(−i(cτ+d)): extra factor √(1+i)/√(1−i)=e^(πi/4), giving e^(πi/6) | Check added; agrees with #1706's (1,0;n,1) Check at n=1 |
| Unchanged Check, Layer 11 lower unipotent | N=10368, N/3=3456 | e^(−πi·10368/12)=e^(−864πi)=1; e^(−πi·3456/12)=e^(−288πi)=1 | consistent with §0.2's e^(−πni/12) |
| U₁₁ normalization | q^n; q¹¹+q | (1/11)Σ_j e(n(τ+j)/11) = q^(n/11) if 11∣n, else 0; U₁₁(q¹¹+q)=q. The wrong model without 1/11 gives 11q | Check added |
| Fricke at weight 0 | W=(0,−1;11,0) | det 11, denom 11τ, k=0: F∣[0]W=11⁻¹F(−1/(11τ)); times (√11)² gives F(−1/(11τ)) | Check added |
| Fricke principal-part identity (kept) | coset reps I, STʲ (j<11) of Γ₀(11)\SL₂(ℤ) | Tr G = G+Σ_j G(−1/(τ+j)) = G+11U₁₁F for G=F(−1/(11τ)). S-invariance compares the value at −1/(11τ) with the value at 11τ: F(τ)+11U₁₁F(−1/(11τ)) = F(−1/(121τ))+11U₁₁F(11τ) | identity as stated is consistent with both normalizations |
| §8.1 character identification | N=5, χ(2)=i, γ=[[3,1],[5,2]] | det=6−5=1; χ(d)=χ(2)=i; χ(a)=χ(3)=χ(2)⁻¹=−i | lower-right entry fixed (Check added) |
| same, degenerate | N=1; k=1, N=4, χ=1 | N=1: (ℤ/1)ˣ trivial, so modFormCharSpace is all of M_k(SL₂(ℤ)), equal to the trivial-multiplier law above. k=1, χ(−1)=1: −I∈Γ₀(4) forces F=(−1)·F, so both sides are 0 | holds |
| same, cover | lifts ±φ at integral k | φ^(2k)=(−φ)^(2k)=(cτ+d)^k, so the multiplier factors through the image in SL₂(ℤ) | identification is through that image, as stated |
| Mathlib slash row | g with det>0 | `slash_apply`: σ g(f(gτ))·\|det g\|^(k−1)·denom^(−k); σ is the identity for det>0 | quoted at both pins |

## Signature check

All 27 declarations of `Suggested.lean` were checked with `#check @…` lines. They were appended to `Suggested.lean`, elaborated in one `lake build` of the module, and then removed; the file was restored byte-identical. Every elaborated type carries all its binders in the declaration's own signature: no section `variable` exists, and no hypothesis was dropped. Each type matches its README statement: the q-binomial and large-base binomial, Euler, ₁ψ₁ with its eight hypotheses, `baileyPair` and `baileyLemma_transform` with the unit domains, the two counting theorems, the analytic Rogers–Ramanujan identities, the quintuple product, rank/crank equidistribution, the prime-power congruences, the four Zwegers definitions with the elliptic and SL₂(ℤ) laws, and `thirdOrderF_rank`. Nothing changed.

## Ownership, citations and overlaps

- Eta multiplier: existence, τ-independence and the Dedekind-sum value are owned by ModularForms §0.2 (#1706 head). This roadmap's §5.2 owns only the metaplectic cocycle and the lifted character; `roadmaps grep` finds no other planner of these. HalfIntegralWeightModularForms §3.3 (#1721 head) and HabiroNumberFields consume §5.2. The repaired §5.2 still supplies what #1721 quotes from it (ν_η, its τ-independence, the S/T values, the law and the cocycle), and the id §5.2 is kept. Separately, #1721 §3.3 also proves "Apostol's closed form" of the multiplier, which #1706 §0.2 now owns. That is a duplication between those two pull requests, not in this roadmap.
- Integral-weight character spaces: the pinned Tau Ceti library, as above. U and Fricke normalizations: ModularForms Conventions. Nothing moves down, and no new construction is owned here.
- Only an open revision defines: ModularForms §0.2 and ModularForms Conventions, defined by #1706 (head `a24d49a`). #1706 must merge first.
- The overlaps lead "IntegralLattices §0G only at #1239" is a false positive. Main's IntegralLattices defines milestone **0G** (`TauCetiRoadmap/IntegralLattices/README.md` line 568, the hyperbolic plane U with Gram matrix [[0,1],[1,0]]); it is a bold milestone label, not a heading.
- The overlaps file listed no dropped id for this README, although #1706 does relabel the ModularForms ids cited here. The table at #1706 lines 304–314 gives the old → new mapping used above.
- `roadmaps resolve` after the edits finds no unresolved Lean names. Its one remaining lead, "BruinierFunke2003, §3", is a source key with a locator, not a roadmap. The tool did not check names outside TauCetiRoadmap ("no pinned Lake packages on this host"). Every Mathlib and Tau Ceti name added here was checked by hand at both pin pairs listed below.
- Pins: this branch's manifest (and the README's pin lines) are Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`. Main's manifest is Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. Every declaration this round adds exists at both: `ModularForm`, `CuspForm`, `ModularForm.slash_apply`, `modFormCharSpace`, `cuspFormCharSpace`, `mem_modFormCharSpace_iff_nebentypus`, `mem_cuspFormCharSpace_iff_nebentypus`. The README pin lines will need updating if the branch is rebased onto main.
- Sources: no new source was cited or fetched, and no `needs-references.toml` was written. The review comment contains no suspicious instructions. Its "awaiting-author" label request is addressed to the author and was not acted on.

## Build and gate

- `lake build TauCetiRoadmap.QSeriesPartitionsAndMockModularForms.Suggested`: `Build completed successfully (8978 jobs).`, exit 0. The 15 warnings are all `declaration uses 'sorry'`, and there are no errors.
- Depcheck: `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Gate: `gate QSeriesPartitionsAndMockModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
