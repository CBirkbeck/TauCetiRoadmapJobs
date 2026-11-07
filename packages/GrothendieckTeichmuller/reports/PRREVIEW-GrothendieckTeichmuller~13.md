# Review of GrothendieckTeichmuller (pull request #1058 at 4a4fb37)

**Verdict:** accepted

🤖 Independent AI review. Incremental re-review of 9 changed lines since 266768e: the one hunk of `TauCetiRoadmap/GrothendieckTeichmuller/README.md` at lines 681–685 (5 insertions, 4 deletions), inside the `## Research context` paragraph on Mel'nikov's free-kernel presentations. `Suggested.lean`, `metadata.toml` and `lake-manifest.json` are unchanged (`git diff 266768e..HEAD --numstat` lists only the README), and nothing outside the folder changed. The hunk is the first repair r12 proposed for its R01, applied verbatim up to punctuation; it is correct against the source and introduces no new problem. No finding remains, new or carried, and the gate passes.

## Previous findings

- R01 — repaired: README:681–685 now reads "For `G` infinite and topologically finitely generated, take a finite generating set `X₀` of `G` and `X = X₀ ⊔ {y}` with `y ↦ 1`: … free of rank `ℵ₀` … Proposition 5.6, with `m = |X|` finite and `≥ 2`". The claim is now about `F̂(X)` with `X` finite, where the README's `freeProfiniteGroup X` (README:151, :197; `TauCeti/Topology/Algebra/Group/Profinite/Free/Basic.lean:60–61` at the pin) is Jarden–Lubotzky's `F̂_m` (jardenlubotzky92 lines 186–193: for finite `X` every normal subgroup contains almost all of `X`, so the two completions coincide), and every hypothesis of Proposition 5.6 is met (table below). The refuting instance of r12, `G = (ℤ/2)^ℕ`, is not topologically finitely generated and is excluded by the new hypothesis. The `max(ℵ₀, |X|)` claim for infinite `X` is gone, not restated elsewhere (grep for `max(ℵ₀` in the folder: 0 hits).

## Verified sound

**Scope of the change.** The worktree is clean at 4a4fb37fefbd021a9e2441727c60d83740ad8800; `git diff --stat origin/main...HEAD` restricted to everything outside the folder is empty; no pull-request file was edited. The hunk sits after every numbered section, so no section id, target line or Lean name moved: the 15 sampled headings (0.2, 0.3, 0.4, 1.2, 1.3, 2.1, 2.2, 2.3, 3.1, 3.3, 3.4, 3.5, 4.2, 4.3, 4.4) are at README:231, :255, :268, :315, :330, :388, :403, :411, :453, :490, :513, :527, :570, :587, :606, and every line of the README outside 681–685 is byte-identical to the head r12 read (the diff has exactly 9 changed lines, all in that hunk). None of the sample falls in the changed passage; the sample's source audits and computed values of r9–r12 carry forward below. The new lines are 89–93 characters long, Unicode mathematics in code spans, no LaTeX, no process word, no pull-request number, no path; "None of this is a target" (README:688) is the paragraph's standing scope statement and is unchanged.

**Gate, dependency order, build.** My rerun of the gate at this head with the build and the candidate merge order:

~~~text
gate GrothendieckTeichmuller: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
depcheck: 240 roadmaps, 2366 edges, 0 problem(s)
~~~

No UPWARD, CYCLE or moved line for this roadmap; the candidate order lists InverseGaloisAndArithmeticFundamentalGroups at 47, PeriodsAndSpecialValues at 310 and this roadmap at 389, and `## Exact supplier contracts` still ends "Nothing is consumed from another roadmap" (README:177). The changed sentence adds no `*Needs:*` line and cites no roadmap. `lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested`: exit 0, "Build completed successfully (18406 jobs)", 15 warnings, all ``declaration uses `sorry` ``. The worker's signature probe (the 290 lines of `Suggested.lean`, byte-identical by `cmp`, followed by `#check @name` for all 43 declarations) elaborated with `lake env lean`: exit 0, 15 `sorry` warnings, 0 errors, 43 signatures printed. The Lean file and the pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b) are unchanged since r11, so the 43 signatures against the README, the headline inventory (eight headlines stated, the five-term relation 3.5 named in the module docstring as kept in the README), the one-tactic padding probe and the 49 supplier declarations resolved at the pins carry forward from r11 and r12 unchanged.

**Source audit of the changed passage.** Jarden–Lubotzky 1992 is in the cache from the author's page (jardenlubotzky92; J. London Math. Soc. (2) 46 (1992) 205–227 at line 10). Read at this head:

| README citation | jardenlubotzky92 | Content, and the hypothesis the README now states |
|---|---|---|
| Proposition 5.6, "[M1, Lemma 2.7 and Thm. 3.1]" | lines 935–939 | `2 ≤ m`; `X` a basis of `F = F̂_m`; `N` closed normal of infinite index; `N ∋ w ≠ 1` of the discrete group on `X`; then `N ≅ F̂_{max{ω, m}}`. README:684–685 states `m = |X|` finite and `≥ 2`, so `max{ω, m} = ω` and the rank is `ℵ₀` as README:683 says |
| the setting of `F̂_m` | lines 182–193 | `D` generated by all finite simple groups is all finite groups; `F̂_m` is the completion of the free group on `X` with respect to normal subgroups containing almost all of `X`, which for finite `X` is the full profinite completion, the README's `freeProfiniteGroup X` |
| Proposition 1.1(a), "[M1, Prop. 2.1(a)]" | lines 208–211 | unchanged sentence README:678–681; `m = e` a positive integer, `(F : N) = n`, `N ≠ 1`: rank `1 + n(e − 1)` |
| reference [M1] | lines 985–986 | Math. USSR Izv. 12 (1978) 1–20, as README:730–731 |

**Adversarial table: the changed statement.** Values computed at this head.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README:681–685, `G` infinite and topologically finitely generated: kernel of `F̂(X) → G` free of rank `ℵ₀` | `G = ℤ_p`, `X₀ = {x}`, `X = {x, y}` (the README's own instance, :686) | `m = 2 ≥ 2`; `X` finite so `F̂(X) = F̂_2`; `(F : N) = |ℤ_p| = ∞`; `y ∈ N` and `y ≠ 1` in `FreeGroup X`; conclusion `F̂_{max{ω, 2}} = F̂_ω`; README `ℵ₀` | correct, all four hypotheses of 5.6 met | none |
| same | `G = F̂₂` itself, `X₀ = {a, b}`, `X = {a, b, y}` | `m = 3`; index `|F̂₂| = ∞`; `y ∈ N`; rank `max{ω, 3} = ω`, so the kernel of `F̂₃ → F̂₂` is `F̂_ω`, not of finite rank: consistent with 5.6 and with 1.1(a) not applying (`n = ∞`) | correct | none |
| same, negative control | `G = (ℤ/2)^ℕ` (r12's refuting instance) | `G` has `ℵ₀` continuous characters to `ℤ/2`, so its minimal generating set is infinite: `G` is not topologically finitely generated and the sentence no longer applies to it; `G = ℤ/2`, finite, falls under README:678–681 instead | excluded by the new hypothesis | none |
| README:684–685, "`m = |X|` finite and `≥ 2`" | `G` infinite forces `X₀ ≠ ∅` | `|X| = |X₀| + 1 ≥ 2` and finite; for the excluded `G = 1`, `X₀ = ∅`, `m = 1 < 2`, and the kernel is `F̂₁ = ẑ` of index `1`, covered by the finite formula `1 + 1·0 = 1` | boundary consistent | none |
| README:677–678, every `G` is `F/N` with `N` free, `N` to be chosen | `G` finite; `G` infinite tfg; `G` infinite not tfg | finite: 1.1(a) with `X` finite nonempty; tfg: the new sentence; not tfg: 5.6 applied to the free profinite group on a generating set converging to `1` plus `y`, `m` infinite, rank `max{ω, m} = m`; the sentence names "a free profinite group", not `F̂(X)`, so it covers that case without the claim r12 refuted | correct | none |
| README:686–688, `ẑ → ℤ_p` has non-free kernel | `p` arbitrary | kernel `∏_{ℓ ≠ p} ℤ_ℓ`, procyclic, nontrivial, abelian: neither rank `0` nor rank `≥ 2`, and not `ẑ` (no `ℤ/p` character); 5.6 does not apply since `⟨x⟩ ≅ ℤ` meets the kernel trivially | correct, unchanged | none |
| README:728–731, the two references | journal, volume, pages | jardenlubotzky92 lines 10 and 985–986 | correct, unchanged | none |

**Adversarial table: unchanged statements, carried from r12 (which carries r11, r10, r9 and earlier).** The rest of the folder is byte-identical to the head r12 reviewed, so these rows are r12's with their computed values; they are not new computations except where marked recomputed.

| Statement | Instances tried | Values computed on each side | Result and provenance | Change |
|---|---|---|---|---|
| Suggested.lean elaborates at the pins | `lake build` of the module; `lake env lean` of the probe copy | 18406 jobs, exit 0; warnings 15 = sorried theorems 15; non-sorry warnings 0; probe errors 0, signatures 43 | builds; recomputed here, same values as r12 | none |
| 43 declared types equal the README's generality | `#check @name` × 43 against signatures.md | equal 43/43; dropped binders 0; file byte-identical to r11's | carried from r11 | none |
| Supplier declarations exist at Tau Ceti 2fd255d9 / Mathlib 1b1ccf4b | 49 names of README:140–175 | printed by `#check` 46; located by file and line 3; missing 0 | carried from r11 | none |
| Hopf input of 3.3 has the hypothesis README:169–172 states | `bijective_of_surjective` at Hopfian.lean:87 | hypotheses `IsTopologicallyFinitelyGenerated G`, `Continuous f`, `Surjective f` | carried from r11 | none |
| `t2Space`/`compactSpace` need finite generation (README:164–166, :646) | Congruence.lean:286, Profinite.lean:220 | both take `hG : IsTopologicallyFinitelyGenerated G` | carried from r11 | none |
| README:678–681, finite `G`: kernel open, free of rank `1 + |G|(|X| − 1)` | `G = 1`, `X = {x}`; `G = ℤ/n`, `X = {x}`; `G = ℤ/2`, `X = {x, y}` | `1 + 1·0 = 1`; `nẑ ≅ ẑ`, `1 + n·0 = 1`; `1 + 2·1 = 3` = Schreier rank of an index-2 subgroup of `F₂` | carried from r12 | none |
| README:60–61, exclusion over ℚ | c=(−1,1), identity (1,1) | exponents −1 and 1; difference −2≠0 | carried from r10 | none |
| README:57–61, arbitrary coefficient algebra retained | zero ℚ-algebra PUnit | −1=1=0; c=(1,1) | carried from r10 | none |
| README:59–60, fixed-crossing condition | identity and inversion over ℚ | log(σ²) maps to t versus −t | carried from r10 | none |
| README:61–62, normalised relations | Σ=1 over ℚ and the zero algebra | pentagon 1·1·1=1·1=1; hexagon σ₂σ₁=1·σ₂·1·σ₁·1 | carried from r10 | none |
| README:670–671, unit exponent does not imply bijectivity | λ=1, f=[y,x], x=(12), y=(13) | f=(132); image orders 2 for qβ and 6 for q | carried from r10/r9 | none |
| README:671–675, restriction to (I)–(III) | same parameter, m=0, z=(123) | (I) gives 1; (II) gives (132)≠1 | carried from r10/r9 | none |
| §§1.3, 3.2–3.3 | bad parameter, identity, c | bad quotient image order 2; β_c²(x)=x, β_c²(y)=y, c²=(1,1) | carried from r10/r9 | none |
| negative control on abelian quotients | cyclic and trivial quotients | f=[y,x]↦1; β maps x↦x, y↦y | carried from r10/r9 | none |
| §4.4 finite quotients | surjections F̂₂→𝔖₃, c action | 18 generating pairs; inversion fixes 6, permutes 12 in 6 two-cycles | carried from r10/r9 | none |
| §4.5 closed embedding and outer embedding | units and characteristic finite quotients | uv=vu=1; action determined by λ mod exp(F̂₂/N), f mod N; compact domain, Hausdorff target | carried from r10/r9/r7/r5 | none |
| Conventions; §§0.1, 1.3, 3.2–3.3, 4.3, 4.5; §2.4 Check 3 | noncommuting parameters; rank one; dihedral tests | (−1,x⁻¹) versus (−1,x); rank-one centraliser is the whole group; (II) at f=1 forces λ=±1 | carried from r10/r9/r7/r3 | none |
| subst; §§0.2–0.4, 1.1–1.2, 1.4–1.5, 2.1–2.4, 3.1–3.5, 4.1–4.2, 4.4 | generators, commutators, parameter inverse, outer equality | 1(a,b)=1, x(a,b)=a, y(a,b)=b; [(12),(23)]=(132); δ²(x)=yxy⁻¹; inverse-parameter products (1,1); outer equality forces a=b=0 | carried from r10/r9/r7/r2 | none |
| §0.1 | rank 1 and 2 | rank 1: C(g)=ẑ; rank 2: xy fails to centralise y in 𝔖₃ | carried from r10/r9 | none |
| §0.2 | f=1,x,y,z | substitution yields 1, a, b, (ab)⁻¹ | carried from r10/r9 | none |
| §0.3 | closed commutator subgroup, x=(12), y=(13) in 𝔖₃ | abelianisation of F̂₂ is ẑ², [x,y] ↦ (0,0) there, while [x,y] ↦ a 3-cycle ≠ 1 in 𝔖₃: the closed commutator subgroup is not the kernel of every finite quotient | computed here (not in r12's table) | none |
| §0.4 | x, y | θ²=id; ω: x→y→z→x; δ²(x)=yxy⁻¹, δ²(y)=y | carried from r10/r9 | none |
| §1.2 | p=(λ,f), q=(μ,g) | both compositions send x→x^(λμ), y→(fβ_p(g))⁻¹y^(λμ)(fβ_p(g)) | carried from r10/r9 | none |
| §§1.3–1.4 | λ=0; omit commutator membership | β_{0,1}=β_{0,[x,y]}=1 while [x,y]→(132)≠1; y^cf abelianises to (0,c) | carried from r10/r9 | none |
| §§2.2–2.3 | six Artin words; linking-coordinate quotient | permutation 1; coordinate 13 maps x₁₃→1 in ℤ/2 | carried from r10/r9 | none |
| §2.4 | f=1; exponent sums (a,b) | 1=1; (a,b)=(2a,2b) forces a=b=0 | carried from r10/r9 | none |
| §§3.2, 3.4 | c=(−1,1) | β_cθ=θβ_c; β_cδ(x)=xy, δβ_c(x)=yx; (I),(II) hold with m=−1 | carried from r10/r9 | none |
| §3.3 | bijective β_{λ,f} | inverse parameter (λ⁻¹,β⁻¹(f)⁻¹); second coordinates ff⁻¹=1 | carried from r10/r9 | none |
| §3.5 | pentagon in P̂₄ at the identity parameter (1,1) | f = 1, each of the five substituted factors is 1, product 1 = 1 | computed here (not in r12's table) | none |
| §4.1 | 1, c, pq | character 1, −1, λμ; c²=1; mod 3, χ(c)=2≠1 | carried from r10/r9 | none |
| §4.2 | inner equality; excluded (1,x) | equality forces λ=μ, a=b=0; β_{1,x}=conj(x⁻¹), x∉F̂₂' | carried from r10/r9 | none |
| §4.3 | (±1,1); dihedral quotients | m=0 gives 1; m=−1 gives (xyz)⁻¹=1 | carried from r10/r9 | none |
| §4.4 | p, q, φ | p·(q·φ)=φ∘β_{pq}⁻¹; x maps to a^(λ⁻¹) | carried from r10/r9 | none |
| §4.5 | unit-exponent slice f=1; inverse pairs | intersection with GT̂^{mon} is {(1,1),(−1,1)}; units image closed in the compact product | carried from r10/r9 | none |
| §4.5 sources | ihara91 §3.3; harbaterschneps00 §0; schneps97 §1.3(3) | parameters recovered from generator images; group as inverse limit of finite images | carried from r10/r9 | none |
| Scope: motivic ownership | four PeriodsAndSpecialValues targets | ids PS.9.8–9.10, 9.22 at the open head; merge positions 310 < 389 | carried from r11 (positions shifted with the candidate order) | none |
| Scope: Brown and HLS | weights 5–7; λ=±1; four surfaces | basis counts 2,2,3; c∉GT̂¹; modular dimensions 1,1,2,2; Γ₀³≅ℤ³ | carried from r10/r9 | none |

**Ownership, overlaps, citations.** The changed sentence introduces no object, carrier or target (README:688), so the ownership facts of r11 and r12 stand: no Grothendieck–Teichmüller group, parameter monoid or `P̂₄` carrier at either pin, and this roadmap the sole owner of `GT̂`, `GT̂₀`, `GT̂^{mon}`, `Param`/`β`, the six `x_{ij}` and relations (I)–(III). The worker's overlaps run against the index of 2026-11-07 (466 open pull requests): no other pull request changes this roadmap, no cited id dropped, no id defined only by an open revision; closest in vocabulary ProfiniteArithmetic (#775), ProfiniteProPGroups (#1187, #618), InverseGaloisAndArithmeticFundamentalGroups (#850), the suppliers r11 resolved. The resolver lists no cross-roadmap citation missing; its three Lean-name leads (`GTHat.isGT0`, `GTHat.injective_mk_betaEquiv`, `GTHat.isClosedEmbedding_betaEquiv`, README:559, :573, :632) are this roadmap's own declarations at `TauCetiRoadmap/GrothendieckTeichmuller/Suggested.lean:254, :276, :287`, printed by the probe. Ownership against open work without readable files was not checked.

## Not verifiable

- Mel'nikov 1978 itself (Proposition 2.1(a), Lemma 2.7, Theorem 3.1): the sources service again found no legal copy from the citation ("no legal source found"; the English translation is behind the IOP paywall, and r12 recorded the mathnet.ru and Mathdoc attempts). The README cites it only "as stated in Jarden–Lubotzky 1992", and that statement, with Mel'nikov's numbering as Jarden–Lubotzky quote it, is verified above (jardenlubotzky92 lines 210, 935–939). The request is recorded in the job's `needs-references.toml`; it is the same text r12 asked for, not a new one, and nothing in the roadmap depends on it (README:688).
- The source-version limitations recorded by r9–r12 (Hatcher–Lochak–Schneps, Brown 2012, Grothendieck's French text, Bar-Natan's journal pagination; Ribes–Zalesskii §9.1 cited by its settled paywalled locator with the Herfort–Ribes substitute; Ihara 1994, Belyi 1979 and Montpellier folder 145) are inherited unchanged: no passage outside README:681–685 changed.
- The openness of the relation-constrained invertibility question and of the nonabelian finite-quotient classification (README:670–675) is cited to Lochak–Schneps 2006 and was not re-established here.

## Source issues

- none
