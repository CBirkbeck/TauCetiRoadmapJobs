# Review of ReductiveGroups (pull request #1332 at e08161d)

**Verdict:** needs changes

Incremental re-review of the 35 changed lines since `415fff6` (23 insertions, 12 deletions, all in `TauCetiRoadmap/ReductiveGroups/README.md`; `Suggested.lean` is byte-identical to `415fff6`; nothing changed outside the folder). The pins are the branch's: Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`, and the worktree's `.lake` packages are at exactly these revisions. The four changed passages (Layer 5P, §6.2, §9B.3, References) are correct, and the repairs introduce no new problem. The previous R01 is about the pull-request description, which is unchanged, so it is carried again. It is P3; nothing here blocks.

## R01 (P3): No stated order against the five open pull requests that change this folder

**Location.** The pull-request description (data): "The dependency order is #1332, then #447, then #1334"; "exposes its simply connected point specialization in `ChevalleyModelTargets.lean`"; "Only README.md changed; existing Lean prototypes, helper, metadata and configuration are untouched."

**Claim.** The description gives a merge order against every open pull request that changes this folder, and it describes the folder correctly.

**Witness.** `git merge-tree` of this head against the head of #1676 (`7b018ef3`) conflicts in `README.md` and `Suggested.lean`. The overlap index of 2026-11-09 reports conflicts with #1797, #1807, #1808 and #1854 in `README.md`, `Suggested.lean`, `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`. `git diff --stat origin/main...HEAD` on the folder deletes seven `*Targets.lean` files and changes `Suggested.lean` by 548 lines; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`, `PROGRESS.md`, `STATUS.md` and no `ChevalleyModelTargets.lean`. Carried from r82 R01, r87 R03, r92 R01 and r99 R01. No repair report marks this finding not actionable.

**Repair.** Add one sentence to the description saying which of #1676 and #1332 is rebased on the other, and that #1797, #1807, #1808 and #1854 carry this folder only as a copy to be dropped at rebase. Replace the two stale sentences with the folder as it is: README and `Suggested.lean` rewritten, and the seven helper target files deleted.

## Previous findings

- R01 — not repaired: the description still reads "The dependency order is #1332, then #447, then #1334 … Only README.md changed; existing Lean prototypes, helper, metadata and configuration are untouched." Carried as R01.

## Verified sound

### The changed passages

- **Layer 5P, line 1347.** "§6A.1 consumes its commutative-unipotent/vector-layer restriction" now resolves: §6A (line 1480) has four numbered items, and item 1, "Equivariant vector layers and regular sections" (line 1508), is the one that linearizes each commutative unipotent layer "using polynomial unipotent exponential/logarithm on a faithful matrix realization". The citation form matches the roadmap's own use of §9A.5 for a numbered item of §9A. §7C.1 (line 1868) still consumes the full package, as the sentence says.
- **§6.2, lines 1432–1437 (Milne 2017, author-page copy in the sources cache, printed page = PDF page − 12).** Remark 12.56, p. 249 (iAG2017 lines 10330–10335): in characteristic p, linearly reductive iff G° is a torus and p ∤ (G : G°), "proved by Nagata for group varieties" and called Nagata's theorem, with pointers to DG IV §3 3.6 and Kohls 2011. The README's "in its case of group varieties, which is Nagata's theorem" is exactly that. The README's correction "for nonsmooth groups the remark's 'torus' must read 'of multiplicative type', since μₚ is connected and linearly reductive" is right: μₚ is connected, of multiplicative type and linearly reductive by Proposition 12.54 (p. 248, line 10307), and is not a torus; this is the Source issue already recorded in r99. The footnote to Proposition 12.54, p. 248 (lines 10309–10310), says linear reductivity of G and of G_{k'} are equivalent with no condition on k'/k, which is the base-change insensitivity the README cites. Definition 12.52 (line 10280) and Remark 12.53 (lines 10282–10306) are on p. 248; the Reynolds operator paragraph of §12l is on p. 249 (lines 10336–10339); Theorem 22.42 (connected G in characteristic zero: reductive iff every finite-dimensional representation is semisimple) is on p. 477 (line 19713) and Corollary 22.43 on p. 478 (line 19732). The Lean statement `linearlyReductive_iff_torus` carries `Fact p.Prime`, `CharP k p`, `Algebra.Smooth` and geometric connectedness, so its generality is the smooth case the README now states explicitly.
- **§9B.3, lines 3703–3707.** The rewording "the 7-dimensional short-root module of G₂ and the 26-dimensional short-root module of F₄ over the prime field" changes no mathematics: for G₂ in characteristic 3 the short-root ideal I has dimension 6 + 1 = 7 and 𝔤/I ≅ V(ω₁) has dimension 14 − 7 = 7; for F₄ in characteristic 2 the short-root ideal has dimension 24 + 2 = 26 and 𝔤/I ≅ V(ω₄) has dimension 52 − 26 = 26 (the 26-dimensional module is irreducible in characteristic 2; it drops to 25 only in characteristic 3). The run-together words r99 remarked on at line 3701 are repaired.
- **References, lines 4732–4743.** Crossref resolves doi 10.1017/9781316711736 to "Algebraic Groups", Cambridge University Press, ISBN 9781316711736 (print 9781107167483). Springer's table of contents for Waterhouse GTM 66 (1979) gives Chapter 1 pp. 3–12, Chapter 2 pp. 13–20, Chapter 3 pp. 21–27, so "Chapters 1–3, pp. 3–27" is exact, and those chapters (affine group schemes as representable functors, Hopf algebras, representations) are the Layer 0–1 material. Springer's table of contents for Borel GTM 126 (1991) gives "Borel Subgroups; Reductive Groups" pp. 147–202 and "Rationality Questions" pp. 203–279; the book numbers its background chapter AG and the rest I–V, so this is Chapter IV. Springer's table of contents for T. A. Springer's *Linear Algebraic Groups*, 2nd ed. (© 1998) gives Chapter 6, "Parabolic Subgroups, Borel Subgroups, Solvable Groups", pp. 98–113 and Chapter 7 pp. 114–131; the Modern Birkhäuser Classics softcover is dated November 2008 by Springer and carries 2009 in its imprint. Borel and Springer are cited only here, as general references for Layer 7; every Layer 7 target carries its own Milne locator (Definition 17.6, Theorems 17.9–17.10, Corollary 17.3, Theorem 21.80, Theorem 21.32), so no target depends on the uncertified texts for its statement. The sentence "Every Milne locator here uses the numbering and printed pages of this edition" is true of every Milne locator checked in r92, r99 and this round.

### Gate, build and dependency check

- **Gate (my run).** `gate … --base origin/main`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. This matches the worker's gate.
- **Dependency check.** `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0 and prints exactly 13 messages, all `declaration uses 'sorry'`, at lines 122, 131, 140, 150, 185, 197, 212, 236, 264, 280, 301, 395 and 409, as in r99.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- **`#check` pass.** A scratch copy with `#check @TauCetiRoadmap.ReductiveGroups.<name>` for all 29 declarations elaborates with exit 0, no errors and 29 printed types. They are unchanged from r99: `linearlyReductive_iff_torus` carries `Fact (Nat.Prime p)`, `CharP k p`, `Algebra.Smooth k H.obj` and `geometricallyConnectedCommHopfAlgProperty`; `reductive_iff_linearlyReductive` and `exists_levi_complement` carry `CharZero k`, smoothness and geometric connectedness; `exists_conjugate_eq_of_isMaximalTorus` carries `IsAlgClosed k`; `lang_surjective` carries `Finite k`. No section binder is lost.
- **One-tactic probe.** On a scratch copy, each of the 13 `sorry`s was replaced by `first | rfl | trivial | infer_instance | decide | (simp; done) | sorry`. All 13 still report `sorry`; none closes.

### Seeded sample

None of the fifteen sampled targets (0.1, 0.3, 1.0a, 1.0b, 2.1, 4.1, 4.2, 4.3, 5.1, 5.2, 7.1, 7.2, 7.3, 8.3, 11.0) falls in the changed lines, and their passages are byte-identical to the head r99 read. r92 verified 0.2, 1.0a, 1.0b, 3.1, 3.2, 4.3, 5.2, 6.1, 7.2 and 8.2; r99 verified 0.3, 4.1, 4.2, 7.1 and 8.1 against the 2017 text. This round verified every Milne locator in the changed §6.2 passage and the neighbouring Theorem 22.42 locator (above). The README flags no locator as unverified.

### Overlaps

`scratch/overlaps.md` reports none of the following: a cited id that an open pull request drops, an id that only an open revision defines, or an id that this pull request drops and others cite. The conflicting heads are R01. The closest open roadmaps (ClassicalGroupsPartII, SchubertGeometry, GroupSchemesOverABase, RootSystemsPartII, LieHighestWeight) were assessed in r92, and the change adds no ownership claim: it edits a cross-reference, a locator, a sentence of wording and four reference entries.

### Adversarial pass

New rows, for the changed statements:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.2 `linearlyReductive_iff_torus` against Remark 12.56 as now cited (line 1432) | μₚ over 𝔽ₚ; constant ℤ/ℓ, ℓ ≠ p; constant ℤ/p; norm-one torus of a quadratic extension; SL₂ in characteristic 2 | μₚ: connected, linearly reductive (Prop. 12.54), not a torus, not smooth: excluded by `Algebra.Smooth`; ℤ/ℓ: linearly reductive, π₀ of order ℓ, excluded by geometric connectedness; ℤ/p: not linearly reductive (regular representation 𝔽ₚ[ℤ/p] is local, socle 1 < p), not connected; norm-one torus: becomes split over k̄, so "torus" holds and so does linear reductivity; SL₂: Example 12.55's 3-dimensional representation is not semisimple, and SL₂ is not a torus | holds; the two Nagata-side hypotheses are exactly those the Lean carries | none |
| the footnote's base-change insensitivity as used at line 1435 | Gₘ over 𝔽₂ ⊂ 𝔽₄; norm-one torus of 𝔽₄/𝔽₂ over 𝔽₂ versus 𝔽₄; μ₂ over 𝔽₂(t) ⊂ 𝔽₂(t^{1/2}) | all semisimple on both sides (multiplicative type both ways; the linear system for a normalized left integral λ on O(G) with λ(1) = 1 is solvable over k iff over k') | holds, including the inseparable case the remark does not cover | none |
| §9B.3 short-root module dimensions (line 3703) | G₂, p = 3; F₄, p = 2; G₂, p = 2 (negative control) | 14 − (6 + 1) = 7; 52 − (24 + 2) = 26; at p = 2 the 7-dimensional G₂ module has a 6-dimensional quotient and the special isogeny does not exist | holds; the characteristics stated are the only ones where the ideal is proper and the quotient is the stated module | none |
| §9B.3 special isogeny composite (line 3708) | B₂ at p = 2; G₂ at p = 3 | exponents 1 on long, p on short root groups; composite both ways 1·2 = 2·1 = 2 = p, Frobenius; 1·3 = 3 | holds (as in r99) | none |
| References: page ranges (lines 4736–4743) | Waterhouse ch. 1–3; Borel ch. IV; Springer ch. 6 | 3–12, 13–20, 21–27 ⇒ 3–27; 147–202, next chapter starts 203; 98–113, next chapter starts 114 | holds | none |

Rows carried from r99 and r92 (statements this diff leaves untouched; values as computed there):

| Statement | Instances (r99/r92) | Values (r99/r92) | Result |
|---|---|---|---|
| 7c complex induction dimension (line 2175) | GL₂(𝔽₂)≅S₃, P=B, M trivial; GL₂(𝔽₃); GL₃(𝔽₂), P of type (2,1); P=G; M=0 | 6/2=3, dim 3=3·1; 48/12=4; 168/24=7, dim 14=7·2; index 1; 0 | holds (`finrank_indFDRep`) |
| §9B One constructor and its Checks (3502–3528) | root-free rank-one datum; simply connected A₁; zero root operators | Gₘ, dim 1; [[2,1],[1,1]], det 1, SL₂ dim 3; [E₁₂,E₂₁]=diag(1,−1)≠0 | holds |
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
| 9B charts, 9B.2 | SL₂ chart; 𝔽₂ count; SL₂→PGL₂; D₄ | (1+bc)/a; 6; diag(2,1)∉image; 4 vs 1 | holds |
| 9C–10D | Gₘ jets; Gₐ Frobenius; SL₂ λ=2 form; binary forms p=3 | H+2binom(H,2); γ_k↦γ_{k/p}; diag(1,2,1) rank 2/𝔽₂; socle 4 | holds |
| 11.0–11F, `permutation_extension_nonsplit` | Gₐ, Gₘ; S₃ half-twist; n=1,2,3 | 1,0,−1; (123) vs (132); S₁ splits, n≥2 odd exponent | holds |

## Not verifiable

- **The `milne-iag` manifest entry** still records `iAG200.pdf` (version 2.00, 2015), whose numbering differs from the README's 2017 locators; the new References sentence says so explicitly. Every Milne locator above was checked against the author-page `iAG2017.pdf` in the sources cache. The manifest is outside this folder.
- **Uncertified texts.** `waterhouse`, `borel` and `springer` are uncertified; their chapter titles and page ranges were checked against the publisher's tables of contents, not against the texts, and the README cites them without statement-level locators.
- **Not re-read this round.** Everything r92 and r99 verified outside the changed passages: Jantzen, Conrad–Feng, Conrad (*Reductive Group Schemes*), McNinch, SGA 1, Dudas–Michel, Arzhantsev, Fang–Lim–Tan, Gros–Kaneda and Hedén. Their passages are unchanged. `brieskorn-1971` is image-only and unreadable here, as recorded in `needs-references.toml`.
- **Open heads.** #1676 was read at its local checkout head `7b018ef3`; #1797, #1807, #1808 and #1854 have no local refs in this worktree, so their conflicts are taken from the overlap index of 2026-11-09.

## Source issues

- **Error** in milne-iag at Remark 12.56, printed page 249: the source says that in characteristic p an algebraic group is linearly reductive iff its identity component is a torus and p does not divide the index; it should say "of multiplicative type", or restrict to smooth groups, since μₚ is connected and linearly reductive but not a torus; affects nothing.
