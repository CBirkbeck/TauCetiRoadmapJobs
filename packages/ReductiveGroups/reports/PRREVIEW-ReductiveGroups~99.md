# Review of ReductiveGroups (pull request #1332 at 415fff6)

**Verdict:** needs changes

Incremental re-review of the 13 changed lines since `7dbc27d` (7 insertions, 6 deletions, all in `TauCetiRoadmap/ReductiveGroups/README.md`; `Suggested.lean` is byte-identical to `7dbc27d`; nothing changed outside the folder). The pins are the branch's: Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`, and the worktree's `.lake` packages are at exactly these revisions. The repair fixes the previous R02 without introducing a new problem. The previous R01 is about the pull-request description, which has not changed, so it is carried again below. It is P3; nothing here blocks.

## R01 (P3): No stated order against the five open pull requests that change this folder

**Location.** The pull-request description (data): "The dependency order is #1332, then #447, then #1334"; "exposes its simply connected point specialization in `ChevalleyModelTargets.lean`"; "Only README.md changed; existing Lean prototypes, helper, metadata and configuration are untouched."

**Claim.** The description gives a merge order against every open pull request that changes this folder, and it describes the folder correctly.

**Witness.** `git merge-tree` of this head against #1676 (`47dfaf25`) conflicts in `README.md` and `Suggested.lean`. Against the local heads of #1797, #1807, #1808 and #1854 it conflicts in `README.md`, plus a modify/delete conflict on `OrbitGeometryTargets.lean`. `git diff --stat origin/main...HEAD` on the folder deletes seven `*Targets.lean` files and changes `Suggested.lean` by 548 lines, and the folder has no `ChevalleyModelTargets.lean`. Carried from r82 R01, r87 R03 and r92 R01. No repair report marks this finding not actionable.

**Repair.** Add one sentence to the description saying which of #1676 and #1332 is rebased on the other, and that #1797, #1807, #1808 and #1854 carry this folder only as a copy to be dropped at rebase. Replace the two stale sentences with the folder as it is: README and `Suggested.lean` rewritten, and the seven helper target files deleted.

## Previous findings

- R01: not repaired. The description is unchanged: "The dependency order is #1332, then #447, then #1334 … Only README.md changed; existing Lean prototypes, helper, metadata and configuration are untouched." Carried as R01.
- R02: repaired. Line 437 now reads "the *One constructor* paragraph (the pinned model)". Line 3507 reads "the pinned model of 𝓡 is constructed from the finite faithful weight family". Line 3708 reads "transfer the map to the pinned model". Lines 2175–2176 read "the induced module has complex dimension the index of `P^F` in `G^F` times the dimension of `M`, by Tau Ceti's `finrank_indFDRep`".

## Verified sound

### The changed passages

- **No dangling names.** `grep -F` finds no `pinnedModel` and no `indFromProjectedLevi` in the README or in `Suggested.lean`. `roadmaps grep --fixed pinnedModel` reports no match on main or in any open roadmap pull request, so no consumer cited the removed backticked name. `roadmaps grep --fixed indFromProjectedLevi` finds it only in ReductiveGroups itself: on main at `README.md:823` and `Suggested.lean:55–62`, and in #1807's copy of this folder. No other roadmap cites it, so the dropped Lean name breaks no citation.
- **Line 2175 (Layer 7c, complex specialization).** Tau Ceti `TauCeti.finrank_indFDRep` (`RepresentationTheory/Induction/FiniteDimensional/Basic.lean:487–490`) states `Module.finrank k (indFDRep A) = S.index * Module.finrank k A` for `[Field k] [Group G] {S : Subgroup G} [S.FiniteIndex]`. `indFDRep` is at `:298` and takes `A : FDRep k S`. With `S = P^F`, `A = FDRep.of (M.ρ.comp π)` and `k = ℂ`, the dimension of `A` is that of `M`. So the prose (index of `P^F` in `G^F` times the dimension of `M`) is exactly the pinned statement. `[S.FiniteIndex]` holds because `G^F` is finite. The Example below it (S₃ over C₂, dimension 3 = 3·1) agrees.
- **Lines 3505–3508 (§9B, *One constructor*).** "§9A" is now spaced, which repairs a run-together cross-reference. §9A is the heading "9A. The full reductive integral enveloping form" (line 2739), and §9A.5 is its numbered item 5 (line 3319). "The pinned model of 𝓡" is defined in this same sentence, and line 2572 uses "split pinned models" consistently. The native Kostant toral closure exists at the pin (`Algebra/Lie/UniversalEnveloping/Kostant/RootSubgroup/Scheme/ToralClosure/Basic.lean:82, 170`: `kostantToralDefiningIdeal`, `kostantToralGroupSchemeι`).
- **Line 437 (the old → new list).** The target paragraph **One constructor.** is at line 3502, so the mapping for *The Chevalley–Demazure construction* still resolves.
- **Line 3708 (§9B.3).** The surrounding `CommHopfAlgCat.IsIsogeny` is `TauCeti.CommHopfAlgCat.IsIsogeny` (`Algebra/AlgebraicGroup/Isogeny/Basic.lean:71`): coordinate map finite and faithfully flat.

### Gate, build and dependency check

- **Gate (my run).** `gate … --base origin/main`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. This matches the worker's gate.
- **Dependency check.** `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0. It prints exactly 13 messages, all `declaration uses 'sorry'`, at lines 122, 131, 140, 150, 185, 197, 212, 236, 264, 280, 301, 395 and 409.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- **`#check` pass.** I appended `#check @TauCetiRoadmap.ReductiveGroups.<name>` for all 29 declarations to a scratch copy and elaborated it with exit 0 and no errors. The worker's `signatures.md` transcript shows "Unknown identifier" for 19 names because of unqualified names; with qualified names all resolve. The types are unchanged from r92: `linearlyReductive_iff_torus` carries `Fact p.Prime`, `CharP k p`, smoothness and geometric connectedness; `lang_surjective` carries `Finite k`, smoothness, geometric connectedness, `IsAlgClosed K` and the Frobenius hypothesis on `F`; `exists_conjugate_eq_of_isMaximalTorus` carries `IsAlgClosed k`; `exists_levi_complement` carries `CharZero k`, smoothness and geometric connectedness. No section binder is lost.
- **One-tactic probe.** On a scratch copy, each of the 13 `sorry`s was replaced by `first | rfl | trivial | infer_instance | decide | (simp; done) | sorry`. All 13 still report `sorry`, so none closes.

### Seeded sample (outside the changed passages, re-read as a spot check)

None of the sampled targets falls in the changed lines. I re-read the five whose locators r92 did not list, against the author-page Milne 2017 copy in the sources cache (printed page = PDF page − 12). All of them match:

- **0.3:** Definition 5.65 (flat sheaf, line 4989) and Proposition 5.68 (sheafification, line 5007), p. 116.
- **4.1:** Theorem 9.11 (Jordan decomposition over a perfect field, polynomial in α, line 7065), p. 168; Theorem 9.18 (line 7194), p. 170.
- **4.2:** Proposition 12.3 (line 9630), p. 231; Theorem 12.9 (line 9680), p. 233.
- **7.1:** Definition 17.6 (line 14503), p. 353; Theorem 17.9(a)–(b) (G/B complete, Borels conjugate by G(k), line 14525) and Theorem 17.10 (maximal tori conjugate, line 14547), p. 354.
- **8.1:** Theorem 23.25 (full isogeny theorem, line 20291), p. 492.

r92 verified 0.2, 1.0a, 1.0b, 3.1, 3.2, 4.3, 5.2, 6.1, 7.2 and 8.2, and none of their passages has changed. The README flags no locator as unverified.

### Overlaps

`scratch/overlaps.md` reports none of the following: a cited id that an open pull request drops, an id that only an open revision defines, or an id that this pull request drops and others cite. The conflicting heads are R01. The closest open roadmaps (ClassicalGroupsPartII, SchubertGeometry, GroupSchemesOverABase, RootSystemsPartII, LieHighestWeight) were assessed in r92, and the change adds no ownership claim.

### Adversarial pass

New rows, for the changed statements:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7c complex induction dimension (line 2175) | GL₂(𝔽₂)≅S₃, P=B, M trivial; GL₂(𝔽₃), M a character of T(𝔽₃); GL₃(𝔽₂), P of type (2,1), M the 2-dim irreducible of GL₂(𝔽₂); P=G; M=0 | 6/2=3, dim 3=3·1; 48/12=4=q+1, dim 4; 168/24=7, dim 14=7·2; index 1, dim M; 0=index·0 | holds (`finrank_indFDRep`) | none |
| same, wrong models | index of L^F instead of P^F; extra factor U^F | GL₂(𝔽₃): 48/4=12≠4; 4·3=12≠4 | both excluded by the stated "index of P^F in G^F" | none |
| §9B One constructor and its Checks (3502–3528) | root-free rank-one datum; simply connected A₁; zero root operators | Gₘ, dim 1; [[1,1],[0,1]]·[[1,0],[1,1]]=[[2,1],[1,1]], det 1, SL₂ dim 3; identity root maps, torus dim 1, [E₁₂,E₂₁]=diag(1,−1)≠0 | holds; zero operators excluded by the normalized frame | none |
| §9B.3 special isogenies, transferred to the pinned model (3708) | B₂ at p=2: long exponent 1, short exponent p; composite both ways; G₂ at p=3 | square: 1·2=2·1=2=p on every root group, i.e. Frobenius; 1·3=3·1=3 | holds | none |

Rows carried from r92 (statements this diff leaves untouched; values as computed there):

| Statement | Instances (r92) | Values (r92) | Result |
|---|---|---|---|
| 0.1 convolution | constant S₃; Gₘ at 2/ℚ; zero algebra | (12)(23)=(123)≠(132); t↦2, t⁻¹↦1/2; 0=1 one point | holds |
| 0.2 three views | Gₐ/k[ε]; trivial; SL₂ | t↦ε lost on k-points; one point; [[2,1],[1,1]] vs [[1,1],[1,2]] | holds |
| 0.3 base change | μ₂→𝔽₂, →ℚ; αₚ | (t−1)², dim 2; ℚ×ℚ; dim p | holds |
| 1.0a dictionary | Gₘ weight 3 at 2; Gₐ; tᵖ | 8v, 1/8, 2·4=8; t↦t+a; μₚ degree p | holds |
| 1.1 Hochschild / induction | H=A=M; weight-one line; C₂ | d⁰=0,d¹=1,d²=0; 1⊗(t−1); ℤ² swap | holds |
| 2.1 Lie | Frobenius on Gₘ; μₚ; SL₂ | d(tᵖ)=0; dim 1 vs 0; diag(1,−1) | holds |
| 3.1 quotients | (t−1),(t²−1); (t−2)/ℚ; Gₘ/μ₂; αₚ² | counits 0,0; −1; t²; k[y]/(yᵖ) | holds |
| 3.2 π₀ | S₃; μ₂/𝔽₂,𝔽₃; μ₃/ℝ; αₚ×ℤ/2 | 6; 1,2; 3 with 1 real point; p and 2 | holds |
| 4.1 Jordan | [[2,1],[0,2]]; I+E₁₂ char 2 | 2I·[[1,1/2],[0,1]]; g_u=g | holds |
| 4.2 D(M) | ℤ/p char p; χ=3,λ=−2; ×2 | tangent dim 1; t↦t⁻⁶; μ₂ | holds |
| 4.3 lattices | norm-one torus/ℝ; μₚ; Gₐ | X^Γ=0; X=ℤ/p; X=0, dim 1 | holds |
| 5.1 unipotence, Lie–Kolchin | Gₐ→U₂; μₚ; GL₂ Borel; S₃ | (tE₁₂)²=0; characters 2,3; no invariant line | holds |
| 5.2 / 6.1 radicals | Gₐ; Gₘ; SL₂ char 2; Res Gₘ p=2 | (1,1),(1,0); centre length 2; dims 0,1 | holds |
| 5P exp/log | 2E₁₂; U₃/ℚ; char 2 | I+2E₁₂; 1 vs 1/2; 1/2 absent | holds |
| `reductive_iff_linearlyReductive` | trivial; Gₐ; ℤ/2 char 0 | both true; both false; excluded by connectedness | holds |
| `linearlyReductive_iff_torus` | μₚ; ℤ/ℓ; norm-one torus; SL₂ Sym² char 2 | nonsmooth; ℓ components; nonsplit torus; no splitting | holds |
| `exists_levi_complement` | trivial; Gₐ; Gₘ⋉Gₐ; SL₂(W₂) | J=0; augmentation; {(a(1−t),t)}; no Levi | holds |
| 6A / 6B | Gₘ on Gₐ; SL₂/T; Gₘ/μ₂; SL₂/B | db=0 vs 2−2s; xy=z(z−1); k[t²,t⁻²]; ℙ¹ | holds |
| `exists_conjugate_eq_of_isBorelOverAlgClosed` | trivial; GL₂; ℤ/2; μₚ; SL₂/ℝ | g=1; w swaps; trivial Borel; G_red; ℝ not closed | holds |
| `exists_conjugate_eq_of_isMaximalTorus` | trivial; μₚ×Gₘ; SL₂/ℝ | g=1; Gₘ; e^{±iθ} | holds |
| 7.2 / 7.3 / 7C | GL₂ Borel; Gₘ; GL₂(𝔽_q); A₂, w=s₁ | a(t−s); W=1; 1+q, 3 at q=2; A={α₂,α₁+α₂} | holds |
| `lang_surjective` | Gₐ/𝔽₂; K=k; Gₘ/𝔽₃; C₂ | F(a)−a=1; xᵠ−x=0; √−1↦−1; 1 | holds |
| 7b–7g finite groups | P=Q; B⁺∩B⁻; S₃ corners; unitary GL₁ | L⋉U; T; z_U=1/4; q+1 points | holds |
| 8.1 / 8.2 / 8.3 | rank 0,1; SL₂ vs PGL₂; SL₂/ℤ; Spec 0; Res 𝔽₂(t) | dims 0,1; μ₂ length 2; 3 points; empty; kernel dim 1 | holds |
| 9A.1a–9A.3 | A₂ signs; A₃/D₄ folding; A₁ straightening | ε=±1, Jacobi 0; 14, 52; 2E^{(2)}, FE+H | holds |
| `integral_pbw` | m=r=0; Y=ℤ; A₁ (1,0,1) | {1}; binom(h,2)∉ℤ[h]; ef=fe+h | holds |
| 9B charts, 9B.2–9B.3 | SL₂ chart; 𝔽₂ count; SL₂→PGL₂; D₄ | (1+bc)/a; 6; diag(2,1)∉image; 4 vs 1 | holds |
| 9C–10D | Gₘ jets; Gₐ Frobenius; SL₂ λ=2 form; binary forms p=3 | H+2binom(H,2); γ_k↦γ_{k/p}; diag(1,2,1) rank 2/𝔽₂; socle 4 | holds |
| 11.0–11F, `permutation_extension_nonsplit` | Gₐ, Gₘ; S₃ half-twist; n=1,2,3 | 1,0,−1; (123) vs (132); S₁ splits, n≥2 odd exponent | holds |

### Remarks on untouched text (no change requested)

- Line 3701, which the diff does not touch, runs words together: "short-root G₂'s7-dimensional and F₄'s26-dimensional modules".

## Not verifiable

- **The `milne-iag` manifest entry** still records `iAG200.pdf` (version 2.00, 2015), whose numbering differs from the README's 2017 locators. Every Milne locator above was checked against the author-page `iAG2017.pdf` in the sources cache. The manifest is outside this folder.
- **Uncertified texts.** `waterhouse`, `borel` and `springer` are uncertified and are cited without locators.
- **Not re-read this round.** Everything r92 verified outside the changed passages: Jantzen, Conrad–Feng, Conrad (*Reductive Group Schemes*), McNinch, SGA 1, Dudas–Michel, Arzhantsev, Fang–Lim–Tan, Gros–Kaneda and Hedén. Their passages are unchanged. `brieskorn-1971` is image-only and unreadable here, as recorded in `needs-references.toml`.
- **Open heads.** #1797, #1807, #1808 and #1854 were read from local `prreview/*` refs, which may trail their live heads. The overlap index of 2026-11-09 reports the same conflicts.

## Source issues

- **Error** in milne-iag at Remark 12.56, printed page 249: the source says that in characteristic p an algebraic group is linearly reductive iff its identity component is a torus and p does not divide the index; it should say "of multiplicative type", or restrict to smooth groups, since μₚ is connected and linearly reductive but not a torus; affects nothing.
