# Review of FiniteReductiveGroups (pull request #2881 at 7472476)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding remains. All three earlier findings are repaired. 3.2(d) now states and proves the perfectness the Deligne–Lusztig layer needs over every quasi-projective base, and the argument holds on the instances below. The family index lists this roadmap after Local factors of twists and types. The hypothesis of 6.5 now says that `{α}` does not occur in `f`; the statement then checks on `GL₂` and agrees with its only consumer. There are two small corrections, neither blocking: locators are still missing (carried from the previous report, and now also for 3.2(d)), and the description wrongly says the family index is identical across the family's pull requests. There is also one format note. The licence and scope questions about the formal-proof source, and the unread main source, are still for the human reviewers.

## C01 — The general case of the headline 2.2, 4.5(b) and the new perfectness statement of 3.2(d) carry no theorem or page

This was raised before and is not repaired. 2.2 still leaves the general case of multiplicity one to "Steinberg, *Lectures on Chevalley groups*; Digne–Michel" (line 508). 4.5(b) still cites "Deligne–Lusztig, §8; Digne–Michel" (line 1195). The perfectness of `RΓ_c(X, Λ)` over `Λ[Γ]` for a free action, which this round makes a statement of 3.2(d) (line 886), has a complete route but no source for the general statement. A theorem and page at each of these three places would let an implementer find the proof in print. The other sampled targets without locators have complete routes, so they matter less.

## C02 — The description says every family pull request carries the same family index, but this head's index differs from theirs

The description says the index "is carried, with identical content, by every pull request of the family". The index at #2889, #2879, #2908, #2890 and #2921 is the same in all five, and it differs from this head's in three ways. Its opening paragraph names the formal proof and its author, where this head has "a complete formal proof". Seven entries have different one-line descriptions. Hecke ideals and Bernoulli bounds come after Base change and Galois representations there, and after Hodge–Tate lattices here. Both versions put Finite reductive groups directly after Local factors of twists and types, so this roadmap's supplier order is unaffected. Either bring this branch's index up to the family's current version or drop the sentence.

## N01 — The References entry for Mumford, *Abelian varieties*, §7 names 3.2(c) only

3.2(d) now cites the same section (line 908) for the claim that a free action gives a finite étale torsor. The reference list (line 2431) could add it.

## Previous findings

- R01 — repaired: 3.2(d) states "Then it is a perfect complex of `Λ[Γ]`-modules … and the limit `RΓ_c(X, ℤ_ℓ)` is a perfect complex of `ℤ_ℓ[Γ]`-modules", with its own route over the quasi-projective base `X/Γ`; the Scope lists it as owned.
- R02 — repaired: the family index lists Finite reductive groups directly below Local factors of twists and types and above Base change and Galois representations for unitary groups.
- R03 — repaired: "a squarefree label of degree `a` over `k` with `f({α}) = 0`: the orbit `{α}` does not occur in `f`", with a Check that the reversed condition fails.
- C01 — not repaired: 2.2 still cites "Steinberg, *Lectures on Chevalley groups*; Digne–Michel" without theorem or page; carried as C01.
- C02 — repaired: "For `F` finite over `ℚ_p` the irreducibility and exhaustion of 6.1 are the depth-zero case of SmoothRepresentationsOfLocalGroups SR.5.2 … 6.1 extends them to every nonarchimedean local field".
- C03 — repaired: the docstring names `TauCeti.UniversalEnvelopingAlgebra.kostantRootSubgroupPoints` and says that what is missing is a rational Borel subgroup with root subgroups for arbitrary, non-split `G`.
- C04 — repaired: "This item is not a target of this roadmap: it records, in the form 6.1–6.5 use, the case `G = GL_n` of LocalFactorsOfTwistsAndTypes §2.1 (a) and (d)".
- N01 — repaired: `conj(·)` and `pr_M` replace `\overline`; the backslashes that remain are coset notation.
- N02 — repaired: the citations now read TypeAHeckeAlgebras §§1.1, 1.2.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / check side) | Result |
|---|---|---|---|
| 3.2(d) perfectness | `C₂` swapping two points; `μ₂` on `𝔾_m` by `x ↦ −x`; trivial `C₂` on a point (control) | `RΓ_c = Λ[C₂]` in degree 0, free; `χ_c(𝔾_m) = 0 = 2·χ_c(𝔾_m/μ₂)`; non-free control: `Tor_i^{𝔽₂[C₂]}(𝔽₂,𝔽₂) ≠ 0` for all `i` | holds; freeness needed |
| 3.2(d) vanishing of `L` | étale double cover, genus 3 over genus 2; `ℤ/p` on `𝔸¹`; swap of two points | `χ: −4 = 2·(−2)`, `tr(σ|H¹) = 4 − 2`, `L = 1−2+1 = 0`; `L = 1`, order `p` excluded; `L(swap) = 0` | holds |
| 3.2(d) route | Stacks 03TV (Prop. 64.13.1) vs here | there: projective curve, finite `Λ`, `D_ctf`; here: quasi-projective `X/Γ`, `π_*Λ` flat over `Λ[Γ]`, amplitude `[0, 2 dim X]` (§F.3.0) | sound at this generality |
| 3.2(d) reductions | `N = (ℤ/ℓ^μ)[Γ]` | `N ⊗_{Λ[Γ]} π_*Λ = π_*(ℤ/ℓ^μ)`, so the reduction is `RΓ_c(X, ℤ/ℓ^μ)` | holds |
| 3.3 via 3.2(d) | `g = s` of order 2 on `𝔾_m`, `p ≠ 2` | `X^s = ∅`; `L(g, 𝔾_m) = −1 + 1 = 0 = L(u, ∅)`; pieces quasi-projective, `⟨g⟩/H` free | holds |
| 6.5, new hypothesis | `a = b = 1`, `f = {β}`, `β ≠ α` | `π^{I₁}` weights `(ξ₁,ξ₂),(ξ₂,ξ₁)` contain `(β,α)`, so `{ξ₁,ξ₂} = {β,α}`; ratio ramified, `i_B` irreducible `= β̃ν^s × α̃ν^t` | holds |
| 6.5 Check (reversed) | `f = {α}`, `π = α̃∘det ⊗ St` | `J` acts by `α(g₂₂)`, `GL₁(k)` by `α`, so the idempotent is nonzero; `π` lies in reducible `i_B(α̃ν^{1/2} ⊗ α̃ν^{−1/2})` | Check true |
| 6.5, `a = 2, b = 1` | `f` a regular orbit of degree 2; `f = {β}+{γ}`, `β, γ ≠ α` | supercuspidal × character: unlinked; three pairwise ramified ratios: irreducible | holds |
| 6.5 consumer | CongruenceModulesOfThetaLifts at its head, README line 333 | uses "`f_v` has no root `χ_{v,j}^{−1}`" | matches |
| 6.0 import | LocalFactorsOfTwistsAndTypes §2.1(d) at its head; `GL₂` unramified principal series | same `GL_n` sentence; `dim (Ind 1)^{U(k)} = 2 = dim (π_N)^{T(𝒪)}` | matches |
| 1.4 citation | TypeAHeckeAlgebras §1.2 on main, `Q = a = q = 2`, `n = 3` | criterion `∏[r]_Q ≠ 0`: `1·3·7 = 21`; `[r]_a ≥ 1` for `a > 0` | holds |
| 4.5(d), `conj` | `f = 1` | `|T^F|⁻¹ Σ_t conj θ(t) = δ_{θ,1}`, which is 4.5(c) | holds |
| 5.11(b), (c), `pr_M` | `f = f′ = 1`; `M = G` | both sides of (b) equal `1`; `R_G^F(φ)(δ) = φ(δ)` for an `F`-class function | holds |
| Scope sentence on 6.1 | SR.5.2 on main | there: `F` finite over `ℚ_p`, depth zero `β = 0`, `E = F`, `𝔄` maximal | matches |
| `Suggested.lean` docstring | pin | `kostantRootSubgroupPoints`, `RootSubgroup/Basic.lean:76`, namespace `TauCeti.UniversalEnvelopingAlgebra` (line 49) | matches |
| Family order (R02) | index at this head and at five sibling heads | Local factors (86) < Finite reductive groups (89) < Base change (93); suppliers Tensor induction, Orbit measures above | ordered |
| Headlines `bessel_pairing_eq`, `exists_cuspidal_of_regular`, `exists_regular_of_isCuspidal` | `#check @` of all seven declarations | elaborated types identical to the previous head's; `[Finite K]`, `[Finite L]`, `Algebra K L` explicit | unchanged |

The rows of the previous review for the statements this change does not touch stand as in the review of bddcb9a.

- Source passages checked: Stacks 03TV, the argument §F.10.4 adapts. Mumford §7 and Bernstein–Zelevinsky are not readable (below).
- Library declarations opened: Tau Ceti `kostantRootSubgroupPoints` (`Algebra/Lie/UniversalEnveloping/Kostant/RootSubgroup/Basic.lean:76`).
- Cross-roadmap citations resolved: EtaleCohomologyFoundations §§F.0.2, F.2.5, F.3, F.3.0, F.4.5, 0.8, F.10.4, F.10.5 (main); TypeAHeckeAlgebras §§1.1, 1.2 (main); SmoothRepresentationsOfLocalGroups SR.5.2 (main); LocalFactorsOfTwistsAndTypes §2.1 (a)–(d) and CongruenceModulesOfThetaLifts' use of 6.5, at their heads; the family index at #2889, #2879, #2908, #2890 and #2921.
- Automatic checks: the worker's checks all passed. Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`.
- Elaboration: `lake env lean` gives three `sorry` warnings and nothing else. Seven `#check @` probes give the same types as at the previous head. No declaration changed, so the one-tactic probe of the previous review stands.
- Overlap check: this round read LocalFactorsOfTwistsAndTypes (open) and SmoothRepresentationsOfLocalGroups (main), and searched every roadmap for perfectness of `RΓ_c` over a group ring. The free-action perfectness over a general base is owned here; EtaleCohomologyFoundations §F.10.4 owns only the torsor over a smooth affine curve. The depth-zero Jacquet comparison is owned by LocalFactorsOfTwistsAndTypes §2.1, and 6.0 now only records it. The depth-zero supercuspidals over `p`-adic `F` are owned by SmoothRepresentationsOfLocalGroups SR.5.2, which 6.1 extends. The other closest roadmaps (BaseChangeAndGaloisRepresentationsForUnitaryGroups, BesselPoincareSeriesAndGramBounds, RowTowerAndRallisIdentities, SeesawForThetaChains, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer) stand as the previous review read them: nothing shared.
- Source independence: changed passages only. One passage was compared with one source (the 3.2(d) route against Stacks 03TV), and no wording is shared: the steps are the standard ones, in the roadmap's own words. No layer was added, removed or reordered, so the arrangement was not compared again. The largest share of locators is still DeligneLusztig1976's, 7 of 14 in-text locators, as before; its text and table of contents were not read (no legal copy).
- Research link: Layers 3–4 are Deligne–Lusztig's 1976 theory, Layer 5 is Green's 1955 character theory of `GL_n(𝔽_q)` with Shintani's 1976 descent, and Layer 6 is the depth-zero construction of Moy–Prasad (1994, 1996). BaseChangeAndGaloisRepresentationsForUnitaryGroups §§10.34–10.35 uses Layer 6 for explicit depth-zero Langlands parameters. This rests on the README's References and Downstream consumers.

## Not verifiable

- Mumford, *Abelian varieties*, §7 (3.2(c), (d): a free action gives a finite étale torsor): a book, not fetched.
- Bernstein–Zelevinsky (6.5: irreducibility for disjoint inertial supports): cited without a locator; a paywalled journal.
- DeligneLusztig1976, Green1955, Shintani1976, the monographs and [FormalProof]: as in the previous review, not readable legally or not read.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folder (so that one review covers every file it changes) flagged the three files of the family index (the family folder's `README.md`, `Suggested.lean` and `metadata.toml`); they belong to this pull request, because every roadmap of the family carries its index, so nothing outside the pull request's own folders was changed. The check of the supplier order reported that this roadmap is not yet in the merge order, which is expected for a new roadmap: it is placed right after its last supplier.

## Source issues

- none

## For the human reviewers

- Scope: the family follows a Lean formalisation ([FormalProof], README line 2438). Its repository's README says the formalisation "claims a proof" of the Riemann hypothesis and that its verification has not been run. This roadmap's own subject is Deligne–Lusztig 1976, Green 1955 and Moy–Prasad.
- Licence: [FormalProof] is cited as the source of 2.7(b) and 2.8. Its repository says the submission "was published without a license". `bessel_pairing_eq` was not compared with its source files.
- Licence: [Announcement] (README line 2443) is a PDF on a host that could not be classified; it is cited at 2.7(b) and 2.8.
- Not tested: DeligneLusztig1976, the source with the largest share of locators (7 of 14), could not be read legally, so wording and arrangement were not checked against it.
