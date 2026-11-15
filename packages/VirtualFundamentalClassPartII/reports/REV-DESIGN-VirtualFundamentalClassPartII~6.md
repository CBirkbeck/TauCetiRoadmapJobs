<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13892#issuecomment-6895287593 -->
Review (claude) of 82c01d1

Verdict: needs_changes

1. **F01** (P3) Convention 2 attributes a closed immersion to a definition that asks only for a local immersion

   - **Location.** `design/README.md`, Conventions, item 2: "A *local embedding* is a chart pair: an
     étale morphism `U → X` from an affine scheme with a closed immersion of `U` into a smooth affine
     scheme (behrend-fantechi1997 Definition 3.7, lines 906–915 …)".
   - **Claim.** Definition 3.7 at lines 906–915 is the chart pair as described.
   - **Witness.** The definition runs to line 917; its fourth condition, behrend-fantechi1997 line 916,
     asks only that `U → M` be a local immersion (unramified), and the cited range stops one line
     before it.
   - **Repair.** Write "… with a closed immersion of `U` into a smooth affine scheme
     (behrend-fantechi1997 Definition 3.7, lines 906–917, which allows `U → M` to be any local
     immersion; closed immersions suffice, since an affine `U` of finite type embeds in an affine
     space, and they are what VirtualFundamentalClass §§3.4, 5.1 and 9.1 use)". Change "lines 906–915"
     to "lines 906–917" in the `cited_for` of `sources.toml` as well. Tested on the instance: 8.2's
     route already takes "a closed immersion `U → W`", so no statement changes.

2. **F02** (P3) 6.2, fourth Check: the sign of `n·[0₂]` depends on a gluing direction the text does not fix

   - **Location.** `design/README.md` 6.2, Checks: "let `𝓛_n` be the line bundle glued by `t^n` on the
     overlap … `[L, E]^vir = c_1(𝓛_n) ∩ [L] = n·[0₂]`".
   - **Claim.** The value is `n·[0₂]`.
   - **Witness.** With frames `e_1 = t^n·e_2` on the overlap, the section `e_1` has divisor `n·[0₂]`;
     with `e_2 = t^n·e_1` the section `e_2` has divisor `n·[0₁] = −n·[0₂]`, since
     `[0₁] + [0₂] = div(t) = 0` in `A_0(L)` (2.3, second Check).
   - **Repair.** Replace "glued by `t^n` on the overlap" by "glued so that the frame of the first
     chart is `t^n` times the frame of the second on the overlap (the section equal to the first
     frame has divisor `n·[0₂]`)", and mirror it in the test of 6.2 in `plan.json`. Tested: under this
     reading `c_1(𝓛_n) ∩ [L] = n·[0₂]`, nonzero in `A_0(L)_ℚ = ℚ` for `n ≠ 0`, as the Check says.

3. **F03** (P3) 2.1 and 3.1: the étale atlas in the descent statement must be of finite type

   - **Location.** `design/README.md` 2.1: "for an étale surjection `U → ℳ` from a scheme, pullback
     `Z_i(ℳ) → Z_i(U)`, `[𝒱] ↦ [𝒱 ×_ℳ U]`, is injective with image the cycles whose two pullbacks …
     agree"; 3.1, API, fourth bullet ("For an étale surjection `U → ℳ` from a scheme").
   - **Claim.** The statement holds for every scheme `U` étale and surjective over `ℳ`.
   - **Witness.** `ℳ = Spec k`, `U = ⊔_{n ∈ ℕ} Spec k`: `[Spec k ×_ℳ U]` has infinitely many components
     and is not an element of the free abelian group `Z_0(U)`; `U` is not a stack of Convention 1, for
     which alone `Z_i` is defined.
   - **Repair.** In both places write "from a scheme `U` of finite type over `k`" (one exists, `ℳ`
     being quasi-compact), and add the witness as a negative-control Check of 2.1; mirror the
     hypothesis in the 2.1 statement of `plan.json`. Tested: for `U` of finite type the pullback of
     `[𝒱]` is a finite sum.

Three findings (R01–R03, all P3), each with a repair to apply; none is blocking. The two declared
supplier gaps `gap:closed-substacks-of-stacks` and `gap:normal-cones-of-local-immersions`
(contracts on VirtualFundamentalClass §2.1 and §1.5) are not
findings. No P1 or P2 finding was found in the passages the round-6 repair changed, in the 15
sampled targets, in the supplier audit or in the overlap audit.

Reviewed: `packages/VirtualFundamentalClassPartII/design/README.md`,
`packages/VirtualFundamentalClassPartII/design/plan.json`,
`packages/VirtualFundamentalClassPartII/sources.toml`. This is a design: there is no
`Suggested.lean`, this lane does not elaborate, and the one-tactic padding probe and the
headline-statability check do not apply at this stage. No source was fetched; the manifest is
unchanged and no `needs-references.toml` was written.

## Round-5 findings, one by one

| Id | State | Repaired passage (quoted) |
|---|---|---|
| F01 (P3) | repaired | 3.5 API: "For a flat morphism `𝒢_1 → 𝒢` … `f_1^! = f^!` on `Z_i(Y)` and on `A_i(Y)` for every `Y → 𝒢_1`"; 4.2 API: "`f^! p_* = p′_* f_1^!` … although `𝒢′` need not map to `𝒢_1` (8.4)"; 8.4: "`η_b^! = i_b^!` on Chow groups of stacks over `𝔐 × B`, by 4.2 for the flat projection `𝔐 × B → B`". |
| F02 (P3) | repaired | 3.5 route: "étale descent of cycles (2.1) and of the rational equivalence itself, not of classes … it is a section of the étale sheaf `W_*`"; 3.1, new last Check (the isogeny). |
| F03 (P3) | repaired | Convention 1: "Every *algebraic stack* of this roadmap, in every layer, is an algebraic stack of SchemeAndStackFoundations §1.19 … that is quasi-separated over `k`"; 9.1: "locally of finite type and quasi-separated over `k`"; Layer 7 header, 8.1 and 8.4 likewise. |
| F04 (P3) | repaired | Layer 2 Dependencies: "VirtualFundamentalClass §§0.2, 2.1"; 3.2 *Needs:* "gap:closed-substacks-of-stacks". |
| F05 (P3) | repaired | Gap paragraph: "a closed embedding … (vistoli1989 lines 529–535), an isomorphism when `Y′ → Y` is flat (on the charts `U → V`, the flat base change … descended; vistoli1989 Lemma 3.14, lines 1126–1131, for local embeddings of schemes)". Read: lines 1126–1131 are Lemma 3.14 with that statement. |

The repaired patterns were searched for in the rest of the design: every Gysin-then-pushforward
step (5.1, 4.3, 8.2, 8.3, 8.4) is over the Gysin target or goes through the flat-base-change
bullet; every "algebraic stack" hypothesis now falls under Convention 1; a script over the 33
targets finds every `gap:` and every supplier roadmap of `plan.json` in the target's *Needs:* line,
and the number of README Checks equal to the number of `plan.json` tests for every target.

## Dependency check

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2230 edges, 0 problem(s)

No UPWARD or CYCLE line. VirtualFundamentalClass and AlgebraicGromovWittenTheory are open pull
requests that add new roadmap folders (neither is on main nor in the merge-order file, which lists
the stopped package VirtualFundamentalClasses instead); VirtualFundamentalClass is cited as a
supplier and AlgebraicGromovWittenTheory only as a consumer. No never-cite roadmap is cited.

## Maintainer notes

None of the six stands as a finding.

1. Words: satisfied. Convention 2 uses "local immersion" for the class and "local embedding" for the
   chart pair, and gives Vistoli's words once; VirtualFundamentalClass §§2.4, 3.4, 9.6 use the same
   words (R01 corrects only the description of the chart pair).
2. Cotangent complex: satisfied. Convention 6 ("No truncated cotangent complex is defined"); 9.3
   builds `φ` into the full `L_{M/𝔅}` through the projection formula and the trace.
3. Integral and rational groups: satisfied by 2.3 (third statement), 4.4 and Convention 4.
4. Invariance: 8.1 states the restricted (relative) invariance and the plane counterexample. The
   sub-claim "the owner's text names no acting group" is refuted: VirtualFundamentalClass §2.5 at its
   open head reads "invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch, Theorem
   3.1".
5. Functoriality: 8.3's second case goes through the graph and a projection, and states "No
   compatibility datum over the graph is used"; the conic row of round 5 was recomputed (below).
6. Suppliers: satisfied. AlgebraicVectorBundles and EllipticCohomology are cited nowhere (grep count
   `0`); the seven suppliers of `plan.json` are each cited by section.

## Adversarial table

Rows computed this round: the passages the round-6 repair changed, the 15 sampled targets, and the
targets the notes touch. For the other targets I rely on the computed rows of rounds 3–5.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 no separated cover of `L` | DVR through `0₁` and through `0₂` with one generic point | two lifts to `Z` with the same generic point and closed points over `0₁ ≠ 0₂`: contradicts separatedness of `Z` | holds | none |
| 1.1 `B_{𝔸¹}G` | `Q = 𝔸¹ ⊔ 𝔸¹ → L` | `Q ×_L Q = 𝔸¹ ⊔ 𝔾_m ⊔ 𝔾_m ⊔ 𝔸¹ = Q ×_{𝔸¹} G`; base change of `L → BG` along the atlas is `Q → 𝔸¹`, degree `2`; torsor over a separated `X` would have degree `2` and `1` on one component | holds | none |
| 1.2 inertia sum | `BS₃`; `Bμ₃` over `ℚ`; `[Spec ℂ/(ℤ/4)]` over `ℝ` | `1 + 3 + 2 = 6`; `1 + (3/3)·2 = 3`; inertia two copies of the gerbe, `1 + 1 = 2`, no element of order 2 in `ℤ/4` maps onto `Gal(ℂ/ℝ)`, so no real point | holds | none |
| 1.3 degree formula | `Spec k → BG`; `BG → Spec k`; `𝔸¹ → Spec k`; `ℤ/p`-quotient | `|G|`; `1/|G|`; `0`; `(1/p)·p = 1 = p/p` | holds | none |
| 1.3 dominant base change | open `𝔸¹ ∖ 0 → 𝔸¹` along `{0}`; `Spec K/k` along `Spec K` | not dominant, excluded; `K ⊗ K` not integral, excluded; along `Spec k(t)`: `[K(t) : k(t)] = [K : k]` | holds | none |
| 2.1 étale descent | `U = ⊔_ℕ Spec k → Spec k` | pullback of `[Spec k]` is an infinite sum | needs `U` of finite type | R03 |
| 2.1 multiplicity | `[V(x²)/μ₂]` | length of `k[x]/(x²)` is `2` | holds | none |
| 2.2 `A_0([𝔸¹/μ₂])` | `div(y)`, `div(P(y))` with `P(x²)` split or not | `2·[Bμ₂]`; `[W]` with coefficient `1` in both cases (one component of `𝒲 ×_𝒱 U` is used); quotient `ℤ/2` | holds | none |
| 2.3 scheme grading | Tau Ceti `pointsOfDimension`; Mathlib `ord` | `height x = k`, the dimension of the closure; `coheight z = 1`, codimension one | agree | none |
| 3.1 isogeny Check | `π : E′ → E` of degree 2, `P ∈ ker π̂` | sum of `π^{−1}P` minus sum of `ker π` is `(2Q + R) − R = 2Q = π̂(P) = O`; `[P] − [O] ≠ 0` | holds | none |
| 3.2 divisor formula | `𝔸¹ → 𝔸¹ × BG`, `φ = t`; `𝔸¹ → [𝔸¹/μ₂]`, `φ = x`; general gerbe factor | `|G|·[0 × BG]` both sides; `2·[Bμ₂] = div(−y)`; on the atlas the norm product is `N(φ)^m`, `m = e(f𝒱)/e(𝒱)`, as `𝒱 ×_{f𝒱} V` is generically finite étale of degree `m` over the coarse fibre | holds | none |
| 3.2 no integral `BG → pt` | `|G|·c = 1` in `ℤ` | no solution for `|G| > 1` | holds | none |
| 3.3 localisation | `[𝔸¹/μ₂]`, `𝒵 = Bμ₂`; closures of `(𝒱, φ)` | `ℤ → ℤ/2 → 0 → 0`; `α − ∂(closures)` supported on `𝒵` | holds integrally | none |
| 3.4 exterior product | `K/k` separable of degree 2; purely inseparable of degree `p`; `BG × BH` | `4 = 2 + 2`; `K ⊗ K = K[x]/(x − α)^p`, `p·[Spec K]`, degree `p²`; `[B(G × H)]` | holds | none |
| 3.5 definition | `Spec k → BG`, `Y = Spec k`; `{0} → 𝔸¹`, `z ↦ z²`; `Y = pt ↦ 0` | `[G]`; `2·[pt]`; `s^*[pt] ∈ A_{−1}(pt) = 0` | holds | none |
| 3.5 flat base change (repair) | `𝔸² → 𝔸¹` flat, `Y = 𝔸¹`, `t ↦ (t², t)`; closed point, not flat | `U = Spec k[t]/(t²)` for both maps, `2·[pt]`; `id^![pt] = [pt]` against `f^![pt] = 0` | holds when flat; flatness needed | none |
| 4.1 exterior pushforward | `(dd′)^{−1}((fp) × (gp′))_*([Y] × [Y′])` | `(dd′)^{−1}·(fp)_*[Y] × (gp′)_*[Y′] = f_*[𝒱] × g_*[𝒲]`; `f ∘ p` representable since `Y` is a scheme | holds | none |
| 4.2 `ℱ′` a stack of Convention 1 | diagonal of `ℱ′` | open immersion (unramified representable) followed by a base change of the diagonal of `𝒢′`; quasi-compact as `ℱ′` is Noetherian | holds | none |
| 4.2 `f^! p_* = p′_* f_1^!` (repair) | `𝔐 = B𝔾_m`, `B = 𝔸¹`, `X = 𝔸¹` | `η_0^![X] = [pt] = i_0^![𝔸¹]`; `p′_*[pt] = [pt]` | holds | none |
| 4.2 non-scheme fibre product | `𝔸¹_ℂ` modulo conjugation off `0` | functions near the point lie in `ℝ(z)`, value at `0` real, residue field `ℂ` | not a scheme | none |
| 5.1 projection formula | `g : BG → Spec k`, `x = [Spec k]`, `y = [BG]` | `g^*x·y = [BG]`, `g_* = 1/|G|`; right side `1/|G|` | holds | none |
| 5.1 Poincaré duality, separated `T` | test `Y → ℳ` separated | `T ×_ℳ Y → Y` separated and `Y` separated, so the pullback is separated; `T × Y` separated | the owner's groups act | none |
| 5.2 | `BG`; `[𝔸¹/μ₂]`; `ℤ/p`-quotient | `1/|G|`; `(1/2)·[0]` not integral, rationally `0 → 0`; `(1/p)·p = 1 ≠ 1/e` | holds | none |
| 5.3 | `ℙ(1, 2)`; grading | `c_2 = t·2t`, `ℤ[t]/(2t²)`, `{x = 0}` has stabiliser `μ₂`, `∫t = 1/2`, `∫2t = 1`; `A^G_{n−c} ↔ A_{n−g−c}` | holds | none |
| 5.4 | `[ℙ¹/μ₂]`, `t²/(t² − 1)`; gerbe over `ℝ`; `Spec K` | orders `2, −1, 0`; `2·(1/2) = 1 = ∫[𝒪]`; `2/4 = 1/2`; `[K : k]` | holds | none |
| 6.1 | `[0 → 0]` and `[O → O]`; `E = [O(−4) → Ω]` on `ℙ¹` | rank `1 = 0 + 1 = 1 + 0`; `Hom(E, E) = k² ⊕ H¹(O(−2))`, `φ ∘ ξ = 0`, homotopies `H⁰(O(−2)) = 0`; `0 → O(2) → O(3)² → O(4) → 0` | holds | none |
| 6.2 | theory of 6.1; `𝓛_n` on `L` | `c_1(O(4))`, degree `4`, and `c_1(O(3)²/O(2)) = c_1(O(4))`; `n·[0₂]` or `n·[0₁] = −n·[0₂]` by gluing direction | holds up to the unpinned sign | R02 |
| 6.3 | `k[x]/(x^p)`; `pt ⊔ 𝔸¹`; node | `d(x^p) = 0`, `s = 1`, `dim X − d − r = 0`, class `p·[pt] ≠ 0`; `[pt]`; `−([ℓ_a] + [ℓ_b])` | holds | none |
| 7.1–7.2 | `k[x]/(x²)`, `x ↦ ε`; characteristic 2, `φ = (0, id)` | `(ε + aε²)² = ε² ≠ 0` mod `ε³`; `φ^*ω = 0` (the `Hom(H^{−1}, J)` component is killed) while `(x + ax²)² = x² ≠ 0` | holds | none |
| 8.1 | plane, `p = y` and `p = x`; `𝔸¹ × Spec k[ε]/(ε²)` | `ν/η` fixed by `ξ ↦ ξ + a`, moved by `η ↦ η + b`; `[C] = 2·[T-line]`, `∂β = 2·[ν = 0] − 2·[T = 0]`; sign agrees with behrend-fantechi1997 line 1415 | holds | none |
| 8.2 | node with `V(a + b)`; non-reduced base | `k[a]/(a²)`, `−2·[pt × pt]` both sides; `2·[pt]` both sides | holds | none |
| 8.3 second case | `Z = ℙ²`, `Z′` a conic, `X` a line, `E = Ω_X` | graph of codimension 2 meets `Z′ × X` in `Z′ ∩ X` of length 2; `rk F − rk E = 0 − 1 = 1 − 2` | holds | none |
| 8.4 (repair) | `x² − b y²`; `{xb = 1}`; `𝔐 = B𝔾_m` | `i_b^!(2·[B]) = 2·[{b}]`: counts `2, 2, 2`; `1` and `0` without properness; `p′_*[X_b]^vir = i_b^! p_*[X]^vir` by the 4.2 bullet | holds | none |
| 9.3 | `X = Spec k`; `ℙ¹ → ℙ^r`; elliptic `C = X` | `E = 0`, étale; `(r + 1)(d + 1) − 1`; `Ob` trivial of rank 1, class `0` | holds | none |
| 9.4 | `G = π^*W ⊗ L^{−N}`; `L = O`; embedded point | `π_*G = W ⊗ π_*L^{−N} = 0`, four-term sequence; `[0 → R¹π_*O]` misses `O_M`; `H⁰(O(−N) ⊕ k_p) = k` | holds | none |
| 9.5 | lines in `ℙ²`; prestable base; `Spec k ⊔ ℙ¹` | `3 + 2 − 3 = 2`; `3g − 3 + n + δ + dim X·(1 − g) = (1 − g)(dim X − 3) + n + δ`, as li-tian1998 line 1586; `ℓ = 0` | holds | none |
| Convention 2 | behrend-fantechi1997 Definition 3.7 | line 916: `U → M` a local immersion | locator and description off by one condition | R01 |

## Verified sound

- **Shape.** 9 layers, 33 targets, 127 tests in `plan.json`, none with fewer than three and each
  target's count equal to the README's Checks; every target has a locator and a *Needs:* line, every
  defined object its API, every layer ends with Examples and Dependencies. The headings are the
  upstream ones (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read
  the build, Layers, Downstream consumers, References). No LaTeX delimiters, `lemma`, process words,
  pull-request numbers, anchors or machine paths (grep, 17 patterns, 0 hits). Proposed names are in
  italics; every backticked name is a library or supplier declaration. `plan.json` parses as JSON
  and `sources.toml` as TOML; the plan's baseline revisions equal the heads of the pinned checkouts.
- **Source locators read this round** (the 15 sampled targets; the author flagged no locator as
  unverified): vistoli1989 lines 296–456, 484–586, 885–1012, 1076–1132, 1168–1210, 1448–1466,
  1505–1512, 1590–1626, 1662–1780; behrend-fantechi1997 lines 904–916, 1038–1045, 1064–1079,
  1160–1174, 1258–1263, 1280–1322, 1386–1424, 1454–1461, 1580–1616, 1632–1668, 1700–1740;
  kresch1999b lines 216–238, 305–316, 328–344; behrend1997 lines 136–198; li-tian1998 lines
  1470–1476, 1498–1504, 1583–1588; rydh2015 lines 79–88; deligne-mumford1969 lines 1010–1020;
  keel-mori1997 lines 24–30; edidin-graham1998 lines 755–760, 788–799; stacks-chow-spaces lines
  55–62, 167–171, 514–518, 795–820, 1984–1991, 2222–2226. Each carries the item number, hypotheses
  and statement the README gives, except R01.
- **Pinned declarations opened** (Mathlib and Tau Ceti at the pins of the manifest). Mathlib
  `AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` line 44),
  `AlgebraicCycle.map` (line 69, `[QuasiCompact f]`), `Scheme.ord`
  (`Mathlib/AlgebraicGeometry/OrderOfVanishing.lean` line 52), `IsClosedImmersion`, `Flat`, `Etale`,
  `Smooth`, `IsProper` under `Mathlib/AlgebraicGeometry/Morphisms/`. Tau Ceti
  `Chow.cyclesOfDimension` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean` line 86, on
  `pointsOfDimension`, height), `ChowGroup` (295), `cycleClass` (304), `ChowGroup.equivIntOfUnique`
  (369), `RatEquiv` (same file), `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean` line 211,
  locally Noetherian), `SchPseudofunctor` (`Stack/Basic.lean` line 37), `Spaces.IsAlgebraicSpace`
  (`AlgebraicSpace/Basic.lean` line 195: fppf sheaf, representable diagonal, étale atlas; no
  quasi-separatedness), `PrestableFamily` (`Curves/Prestable.lean` line 45: extends `IsProper` and
  `GeometricallyConnected`, syntomic of relative dimension one, stable under base change, no genus),
  `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean` line 82:
  `χ(E) − r·χ(O)`). The pin has no algebraic stack, Deligne–Mumford predicate or cotangent complex
  of a stack (grep).
- **Cross-roadmap citations resolved.** VirtualFundamentalClass at its open head: all cited sections
  §§0.2–9.6 exist; read its Conventions and §§0.2–0.3, 1.5–1.6, 2.1–2.5, 3.2–3.5, 4.3–4.5, 5.5,
  6.4–6.6, 7.1–7.7, 8.1, 9.1–9.6; each matches the contract (§1.5 is closed immersions only, §2.1
  does not state the theory of closed substacks, as the two gaps say; §3.2 defines a global
  resolution as a derived isomorphism; §9.4 is over smooth bases; §7.3 uses the resolution
  property). Its `Suggested.lean` declares no name, so none of the plan's names collides.
  SchemeAndStackFoundations on main: the 22 cited section headings and 28 cited names resolve
  (`Stacks.points` is defined in §1.20, `excess_intersection` and `gysin_self_intersection` in
  §5.5, §5.6 without separatedness, `𝔸¹/ℤ` in the Checks of §1.9). StableReductionPartII §5.15 at
  its open head states the Edidin–Graham comparison with the contract's hypotheses and
  compatibilities. EquivariantIntersectionTheory Conventions 1, 4, 5 and §§2.1–2.2; StableReduction
  Layers 2–3 (cohomology and base change, relative dualising sheaf with base change and the
  componentwise degree formula, fibrewise ampleness, prestable families); EnhancedDerivedSheaves
  §0.3, E1.4, E1.8; DerivedModuleAlgebra §§0.7, 0.12, 0.25 (the `Ext¹` obstruction to lifting a
  map is stated in §0.25): all on main. AlgebraicGromovWittenTheory §§4.1–4.3 (consumer only) exist
  at its open head and are the special case the README says.
- **Declared gaps.** Both have the same slug in `plan.json` and in the README contract, name
  VirtualFundamentalClass (§2.1, §1.5), ask for one theory each with its hypotheses, and ask for
  nothing that SchemeAndStackFoundations or the supplier's text states (grep for closed substacks
  and local immersions in both). Precise, minimal, declared.
- **Duplication and ownership.** By object, over main and the open heads (searches: Vistoli,
  intrinsic normal cone, Chow groups of stacks, Edidin–Graham, proper cover, obstruction theory):
  no other roadmap owns integral or non-separated Chow theory of Deligne–Mumford stacks, relative
  obstruction classes, or spaces of maps over a general base. 6.2 against VirtualFundamentalClass
  §§7.3–7.4 and 9.2, 6.3 against §§7.5 and 9.4, 7.1–7.2 against §§3.5, 6.1, 6.3, 8.2 against §9.4,
  8.3 against §9.5, 9.3–9.5 against AlgebraicGromovWittenTheory §§4.1–4.3: each states the
  hypothesis it removes and none restates the owner at equal generality. `scratch/overlaps.md`: no
  dropped id, no revision-only id, no conflicting head, no second copy; the roadmap is not on main.
- **Organisation.** Layer titles are mathematical and the README nowhere says it follows a source.
  The order 1 → 2 → 3 → 4 → 5 is forced by the *Needs:* lines; Layer 7 needs no Chow layer and is
  placed after Layer 6, against the order of behrend-fantechi1997.
- **Manifest.** 14 sources, one key each, every key cited in the README present and conversely, no
  local path; gillet1984 and fulton1998 settled as uncertified.
- **Copyright.** Wording compared at 22 passages (the 15 sampled locators and 7 more: 6.2 with
  behrend-fantechi1997 Definition 5.2, 7.1 with lines 1067–1078, 7.2 with Theorem 4.5, Convention 2
  with kresch1999b lines 232–237, 8.1 with kresch1999b Theorem 3.1, 8.4 with li-tian1998 Theorem
  4.2, 2.3 with stacks-chow-spaces Definition 15.1). The longest shared runs are standard phrases of
  a statement (at most 7 words, in 7.2 beside behrend-fantechi1997 line 1164). Arrangement:
  vistoli1989 has the largest share; its sections (preliminaries, moduli spaces, intersection
  theory, the proof of its Lemma 3.16, bivariant theory, duality on moduli spaces, appendix) do not
  map onto the layers: its §2 and §6 are one section of Layer 5, its §3 is split over Layers 2, 3
  and 4 by integrality, its §4 is no layer, and Layers 6–9 come from other sources. No table,
  figure, list of examples or numerical data is taken over.

Overlap check: read VirtualFundamentalClass, AlgebraicGromovWittenTheory, SchemeAndStackFoundations, StableReductionPartII, EquivariantIntersectionTheory, StableReduction (CrystallineCohomologyPartII shares only the phrase "proper cover"); normal cones of local immersions and closed substacks of stacks: VirtualFundamentalClass (declared gaps); the Edidin–Graham comparison of groups: StableReductionPartII §5.15; the stable-map stack, its obstruction theory and class: AlgebraicGromovWittenTheory; scheme Chow theory: SchemeAndStackFoundations; nothing else shared.

Source independence: 22 passages compared with 10 sources, none shared beyond standard phrases of at most 7 words; largest share vistoli1989, 72 of 144 locators; contents compared with vistoli1989: independent.

## Not verifiable

- gillet1984 §4 and fulton1998 (§1.10, Chapter 3, Propositions 1.8, 8.1.1, 10.2, Corollary 6.3):
  uncertified, cited by locator only.
- The gluing over charts in 8.1–8.3 and the agreement of 8.3's comparison on overlaps: checked on
  charts, by rank and on the examples of the table, not globally.
- vistoli1989 is read from an OCR text: several displayed formulas and item labels are garbled and
  were matched by content, and two apparent cross-reference slips in it (lines 1613 and 1768) cannot
  be told from recognition errors, so they are not reported as source issues.
- kresch1999b lines 317–327 and 344–405 (the set-up and proof of Theorem 3.1) and
  behrend-fantechi1997 Propositions 3.3–3.5 were not reread this round; rounds 4 and 5 record them.
- Elaboration: not available in this lane, and a design has no Lean file.
- The two board packages on other branches (AnalyticNumberTheory, LawrenceVenkateshMethod) are in
  unrelated subjects and were not opened.

## Source issues

- **Error** in behrend-fantechi1997 at Proposition 3.5 as used in the proof of Lemma 5.9, lines 1416–1417: the source says the rational equivalence is invariant under the whole pulled-back tangent bundle of the ambient; it should be invariance under the restricted tangent action only; affects the proof; corrected in print at kresch1999b Theorem 3.1 and lines 340–343.
- **Misprint** in behrend-fantechi1997 at the proof of Proposition 6.2, line 1609: the source says the second Ext group is taken over the structure sheaf of the curve; it should be over the structure sheaf of the test scheme; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "82c01d12084449c9d253df0151cd913d0a985798", "job": "REV-DESIGN-VirtualFundamentalClassPartII~6", "model": "fable", "worker": "chris-x55"} -->
