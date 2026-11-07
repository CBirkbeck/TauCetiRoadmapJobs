# Review of GrothendieckTeichmuller (pull request #1058 at 266768e)

**Verdict:** needs changes

🤖 Independent AI review. Incremental re-review of 16 changed lines since 439778a: one paragraph added to `## Research context` of `TauCetiRoadmap/GrothendieckTeichmuller/README.md` (lines 677–687) and two references (lines 728–731). `Suggested.lean`, `metadata.toml` and the pins are unchanged (`git diff 439778a..HEAD --numstat` lists only the README, 16 insertions), and nothing outside the folder changed. One finding, in the added paragraph.

## R01 (P2) — the infinite-rank case of the Mel'nikov paragraph is stated for the wrong free profinite group

**Location.** `TauCetiRoadmap/GrothendieckTeichmuller/README.md:681–684`: "For `G` infinite, take a generating set `X₀` of `G` converging to `1` and `X = X₀ ⊔ {y}` with `y ↦ 1`: the kernel has infinite index and contains the basis element `y`, so it is free of rank `max(ℵ₀, |X|)` by Mel'nikov's theorem".

**Claim.** The kernel of `F̂(X) → G` is free profinite of rank `max(ℵ₀, |X|)` for every infinite profinite `G`.

**Witness.** The README defines `F̂(X)` as `freeProfiniteGroup X`, "the completion of `FreeGroup X`" (README:151, :197; `TauCeti/Topology/Algebra/Group/Profinite/Free/Basic.lean:60–61` at the pin). Jarden–Lubotzky's Proposition 5.6 (jardenlubotzky92 lines 937–939) is about `F̂_m`, the free pro-`D` group on a basis `X` converging to `1` (jardenlubotzky92 lines 186–193: the completion with respect to the normal subgroups containing almost all of `X`). The two agree for finite `X` and differ for infinite `X`, and the claim fails for the README's group: take `G = (ℤ/2)^ℕ`, `X₀ = {e_i}` the coordinate vectors, `X = X₀ ⊔ {y}`, `|X| = ℵ₀`, `N` the kernel. Continuous characters `F̂(X) → ℤ/2` are all maps `X → ℤ/2`: `2^{ℵ₀}` of them. Those vanishing on `N` factor through `G`, whose continuous characters are finitely supported: `ℵ₀` of them. So `N` has at least `2^{ℵ₀}` continuous characters to `ℤ/2`, while `F̂_{max(ℵ₀,|X|)} = F̂_{ℵ₀}` has `ℵ₀` (finitely supported maps on a convergent basis). `N ≇ F̂_{ℵ₀}`, whatever `N` is. The finitely generated case is unaffected: for `G = ℤ_p`, `X = {x, y}`, `m = 2`, and the kernel is `F̂_{ℵ₀}` as stated.

**Repair.** Restrict the sentence to the free profinite group for which the theorem is quoted, in one of two ways (the second keeps the general statement):

- "For `G` infinite and topologically finitely generated, take a finite generating set `X₀` of `G` and `X = X₀ ⊔ {y}` with `y ↦ 1`: the kernel has infinite index and contains the basis element `y`, so it is free of rank `ℵ₀` by Mel'nikov's theorem (Mel'nikov 1978, Lemma 2.7 and Theorem 3.1, as stated in Jarden–Lubotzky 1992, Proposition 5.6, with `m = |X| ≥ 2` finite)."
- and, if the general case is wanted: "For an arbitrary infinite `G` the same holds with `F̂(X)` replaced by the free profinite group on a set `X = X₀ ⊔ {y}` converging to `1`, `X₀` a generating set of `G` converging to `1` (Jarden–Lubotzky 1992, §1), which is `freeProfiniteGroup X` only for `X` finite; the kernel is then free of rank `max(ℵ₀, |X|)`."

Tested on the refuting instance: `G = (ℤ/2)^ℕ` is not topologically finitely generated, so the first sentence does not apply to it; the second sentence applies Proposition 5.6 to `F̂_{ℵ₀}` with its basis `X` converging to `1`, `N` of infinite index containing `y ≠ 1`, and yields `N ≅ F̂_{ℵ₀}`, which is the proposition's own conclusion. The opening sentence of the paragraph ("Every profinite group `G` is a quotient `F/N` … `N` itself free profinite, but `N` must be chosen") is true under that reading and needs no change. No target depends on the paragraph (README:687 "None of this is a target"), so the repair is these sentences alone.

## Previous findings

- none to carry: the previous report ([r11](PRREVIEW-GrothendieckTeichmuller~11.md)) accepted with no finding of its own. Its one carried item, R01 of r9 (`TauCetiRoadmap/GrothendieckTeichmuller/README.md:60–62`, "so over `ℚ` the element `(−1, 1)` is not in it"), stays repaired: the passage is unchanged at this head.

## Verified sound

**Scope of the change.** `git diff 439778a..HEAD --numstat`: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` 16 insertions, 0 deletions, no other file. `git diff --stat origin/main...HEAD` restricted to everything outside the folder: empty. The worktree is clean at 266768e48a1c2fcd2dcdd7d82de8d41e8fa27223; no pull-request file was edited. The insertion sits after every numbered section, so no section id, line of a target or Lean name moved; the 15 sampled headings (0.1, 0.4, 1.1, 1.2, 1.4, 1.5, 2.1, 2.4, 3.1, 3.2, 3.4, 3.5, 4.2, 4.4, 4.5) are at README:195, :268, :298, :315, :343, :360, :388, :428, :453, :468, :513, :527, :570, :606, :618, byte-identical to the text r9–r11 audited. None of the sample falls in the changed passage; their source audits and computed values carry forward below.

**Gate, dependency order, build.** My rerun of the gate at this head, with the board's merge order:

~~~text
gate GrothendieckTeichmuller: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 240 roadmaps, 2362 edges, 0 problem(s)
~~~

No UPWARD, CYCLE or moved line for this roadmap; the candidate order places InverseGaloisAndArithmeticFundamentalGroups at 44, PeriodsAndSpecialValues at 305 and this roadmap at 384, and `## Exact supplier contracts` still ends with "Nothing is consumed from another roadmap." The new paragraph adds no `*Needs:*` line and cites no roadmap. `lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested`: exit 0, "Build completed successfully (18406 jobs)", 15 warnings, all `declaration uses sorry`. A scratch copy of the worker's signature file (Suggested.lean plus `#check @name` for all 43 declarations) elaborated under `lake env lean`: exit 0, 15 `sorry` warnings, no other warning or error. The Lean file and `lake-manifest.json` are byte-identical to r11's, so the 43 signatures, the headline inventory (eight headlines stated, 3.5 named in the docstring as kept in the README), the one-tactic padding probe and the 49 supplier declarations resolved at Tau Ceti 2fd255d9 / Mathlib 1b1ccf4b carry forward from r11 unchanged.

**Seeded sample and locators of the changed passage.** The paragraph cites Mel'nikov 1978 only "as stated in Jarden–Lubotzky 1992". I fetched Jarden–Lubotzky from the author's page (jardenlubotzky92, J. London Math. Soc. (2) 46 (1992) 205–227 at line 10) and read:

| README citation | jardenlubotzky92 | Content |
|---|---|---|
| Proposition 1.1(a), "[M1, Prop. 2.1(a)]" | lines 208–211 | for a nontrivial closed normal `N` of `F = F̂_e(D)`, `e` a positive integer, `(F : N) = n`: `N` free pro-`D` of rank `1 + n(e − 1)` |
| Proposition 5.6, "[M1, Lemma 2.7 and Thm. 3.1]" | lines 935–940 | `2 ≤ m`, `X` a basis of `F`, `N` closed normal of infinite index containing `w ≠ 1` of the discrete group on `X`: `N ≅ F̂_{max{ω,m}}` |
| the setting of both | lines 182–193 | `D` = all finite groups with composition factors in `D₀` (profinite for `D₀` all finite simple groups); `F̂_m(D)` is the completion of the free group on `X` with respect to the normal subgroups containing almost all of `X`; `X` converges to `1` |
| reference [M1] | lines 985–986 | Math. USSR Izvestija 12 (1978), 1–20, as README:728–729 |

Both locators are as the README states them; the finding is the hypothesis `F = F̂_m` with its basis converging to `1`, which the README's `F̂(X)` satisfies only for finite `X`.

**Adversarial table: the changed statements.** Values computed at this head.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README:678–680, finite `G`: kernel open, free of rank `1 + |G|(|X| − 1)` | `G = 1`, `X = {x}`; `G = ℤ/n`, `X = {x}`; `G = ℤ/2`, `X = {x, y}` | kernel `F̂₁ = ẑ`, formula `1 + 1·0 = 1`; kernel `nẑ ≅ ẑ`, formula `1 + n·0 = 1`; formula `1 + 2·1 = 3`, Schreier rank of an index-2 subgroup of `F₂` is `3`; hypotheses of 1.1(a): `e = |X| ≥ 1`, `n = |G| < ∞`, `N ≠ 1` since `F̂(X)` is infinite and `G` finite | correct, hypotheses met | none |
| README:681–684, infinite `G`, finitely generated case | `G = ℤ_p`, `X = {x, y}`, `x ↦ 1`, `y ↦ 0` | `m = 2 ≥ 2`; `(F : N) = |ℤ_p| = ∞`; `y ∈ N`, `y ≠ 1` in the discrete free group; conclusion `F̂_{max(ω, 2)} = F̂_{ℵ₀}`; README's `max(ℵ₀, 2) = ℵ₀` | correct | none |
| README:681–684, infinite `G` with the README's `F̂(X)` (completion of `FreeGroup X`) | `G = (ℤ/2)^ℕ`, `X₀ = {e_i}`, `X = X₀ ⊔ {y}` | continuous characters of `F̂(X)` to `ℤ/2`: `2^{ℵ₀}`; of `G`: `ℵ₀` (finitely supported); restriction to `N` has kernel of size `ℵ₀`, image of size `2^{ℵ₀}`; characters of `F̂_{ℵ₀}`: `ℵ₀`; README claims rank `max(ℵ₀, ℵ₀) = ℵ₀` | false for the README's group, true for `F̂_m` with a convergent basis | R01 |
| README:685–687, `ẑ → ℤ_p` has non-free kernel | `p` arbitrary | `ẑ = ∏_ℓ ℤ_ℓ`, kernel `∏_{ℓ ≠ p} ℤ_ℓ`; characters to `ℤ/p`: `0` for the kernel, `ℤ/p` for `ẑ`, so not `≅ ẑ`; abelian and nontrivial, so neither rank `0` nor rank `≥ 2`; Proposition 5.6 does not apply since the discrete `⟨x⟩ ≅ ℤ` meets the kernel trivially (`ℤ → ℤ_p` injective) | correct, consistent with the theorem's hypothesis | none |
| README:677–678, every `G` is `F/N` with `N` free | `G = 1`; `G` finite, `X` infinite; `G` infinite | `F̂₀ = 1`, `N = 1` free of rank `0`; `N` open in `F̂_m`, `m` infinite: 1.1(e) gives `N ≅ F`; `G` infinite: the redundant-generator construction (with `F̂_m`, R01) | correct under the convergent-basis reading | covered by R01 |
| README:728–731, the two references | journal, volume, pages | M1: Math. USSR Izv. 12 (1978) 1–20 (jardenlubotzky92 985–986; mathnet record im1664: Izv. Akad. Nauk SSSR Ser. Mat. 42:1 (1978) 3–25); JL: J. London Math. Soc. (2) 46 (1992) 205–227 (jardenlubotzky92 line 10) | correct | none |
| House style of the new lines | lengths of README:677–687, :728–731 | longest 97 characters; no LaTeX, no process word, no pull-request number, no absolute path; `None of this is a target` is a scope statement, as `## Research context` already uses | clean | none |

**Adversarial table: unchanged statements, carried from r11.** The rest of the folder is byte-identical to the one r11 accepted, so the following rows are those of [r11](PRREVIEW-GrothendieckTeichmuller~11.md) (which carries r10, r9 and earlier), with their computed values; they are not new computations.

| Statement | Instances tried | Values computed on each side | Result and provenance | Change |
|---|---|---|---|---|
| Suggested.lean elaborates at the pins | `lake build` of the module; `lake env lean` of the probe copy | 18406 jobs, exit 0; warnings 15 = sorried theorems 15; non-sorry warnings 0 | builds; recomputed here, same values as r11 | none |
| 43 declared types equal the README's generality | `#check @name` × 43 against signatures.md | equal 43/43; dropped binders 0; file byte-identical to r11's | carried from r11 | none |
| Supplier declarations exist at Tau Ceti 2fd255d9 / Mathlib 1b1ccf4b | 49 names of README:140–175 | printed by `#check` 46; located by file and line 3; missing 0 | carried from r11 | none |
| Hopf input of 3.3 has the hypothesis README:169–172 states | `bijective_of_surjective` at Hopfian.lean:87 | hypotheses `IsTopologicallyFinitelyGenerated G`, `Continuous f`, `Surjective f` | carried from r11 | none |
| `t2Space`/`compactSpace` need finite generation (README:164–166, :646) | Congruence.lean:286, Profinite.lean:220 | both take `hG : IsTopologicallyFinitelyGenerated G` | carried from r11 | none |
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
| §0.4 | x, y | θ²=id; ω: x→y→z→x; δ²(x)=yxy⁻¹, δ²(y)=y | carried from r10/r9 | none |
| §1.2 | p=(λ,f), q=(μ,g) | both compositions send x→x^(λμ), y→(fβ_p(g))⁻¹y^(λμ)(fβ_p(g)) | carried from r10/r9 | none |
| §§1.3–1.4 | λ=0; omit commutator membership | β_{0,1}=β_{0,[x,y]}=1 while [x,y]→(132)≠1; y^cf abelianises to (0,c) | carried from r10/r9 | none |
| §§2.2–2.3 | six Artin words; linking-coordinate quotient | permutation 1; coordinate 13 maps x₁₃→1 in ℤ/2 | carried from r10/r9 | none |
| §2.4 | f=1; exponent sums (a,b) | 1=1; (a,b)=(2a,2b) forces a=b=0 | carried from r10/r9 | none |
| §§3.2, 3.4 | c=(−1,1) | β_cθ=θβ_c; β_cδ(x)=xy, δβ_c(x)=yx; (I),(II) hold with m=−1 | carried from r10/r9 | none |
| §3.3 | bijective β_{λ,f} | inverse parameter (λ⁻¹,β⁻¹(f)⁻¹); second coordinates ff⁻¹=1 | carried from r10/r9 | none |
| §4.1 | 1, c, pq | character 1, −1, λμ; c²=1; mod 3, χ(c)=2≠1 | carried from r10/r9 | none |
| §4.2 | inner equality; excluded (1,x) | equality forces λ=μ, a=b=0; β_{1,x}=conj(x⁻¹), x∉F̂₂' | carried from r10/r9 | none |
| §4.3 | (±1,1); dihedral quotients | m=0 gives 1; m=−1 gives (xyz)⁻¹=1 | carried from r10/r9 | none |
| §4.4 | p, q, φ | p·(q·φ)=φ∘β_{pq}⁻¹; x maps to a^(λ⁻¹) | carried from r10/r9 | none |
| §4.5 | unit-exponent slice f=1; inverse pairs | intersection with GT̂^{mon} is {(1,1),(−1,1)}; units image closed in the compact product | carried from r10/r9 | none |
| §4.5 sources | ihara91 §3.3; harbaterschneps00 §0; schneps97 §1.3(3) | parameters recovered from generator images; group as inverse limit of finite images | carried from r10/r9 | none |
| Scope: motivic ownership | four PeriodsAndSpecialValues targets | ids PS.9.8–9.10, 9.22 at the open head; merge positions 305<384 | carried from r11 (positions shifted by one with the order) | none |
| Scope: Brown and HLS | weights 5–7; λ=±1; four surfaces | basis counts 2,2,3; c∉GT̂¹; modular dimensions 1,1,2,2; Γ₀³≅ℤ³ | carried from r10/r9 | none |

**Ownership, overlaps, citations.** The new paragraph introduces no object, carrier or target (README:687), so the ownership facts of r11 stand: no Grothendieck–Teichmüller group, parameter monoid or `P̂₄` carrier at either pin, and this roadmap the sole owner of `GT̂`, `GT̂₀`, `GT̂^{mon}`, `Param`/`β`, the six `x_{ij}` and relations (I)–(III). The worker's overlaps run against the index of 2026-11-07 (466 open pull requests): no other pull request changes this roadmap, no cited id dropped, no id defined only by an open revision; closest in vocabulary ProfiniteArithmetic (#775), ProfiniteProPGroups (#1187, #618), InverseGaloisAndArithmeticFundamentalGroups (#850), the suppliers r11 resolved. The resolver lists no cross-roadmap citation missing; its three Lean-name leads (`GTHat.isGT0`, `GTHat.injective_mk_betaEquiv`, `GTHat.isClosedEmbedding_betaEquiv`, README:559, :573, :632) are this roadmap's own declarations at `TauCetiRoadmap/GrothendieckTeichmuller/Suggested.lean:254, :276, :287`, printed by the probe. Ownership against open work without readable files was not checked.

## Not verifiable

- Mel'nikov 1978 itself (Proposition 2.1(a), Lemma 2.7, Theorem 3.1): the sources service found no legal copy from the citation; the mathnet.ru record im1664 and its full-text link, and the Mathdoc mirror of the English translation, timed out on three attempts; the English translation (Math. USSR-Izv. 12 (1978) 1–20) is behind the IOP paywall. The README cites it only "as stated in Jarden–Lubotzky 1992", and that statement, with Mel'nikov's numbering as Jarden–Lubotzky quote it, is verified above (jardenlubotzky92 lines 210, 935). The request is recorded in the job's `needs-references.toml` with where I looked.
- The source-version limitations recorded by r9–r11 (Hatcher–Lochak–Schneps, Brown 2012, Grothendieck's French text, Bar-Natan's journal pagination; Ribes–Zalesskii §9.1 cited by its settled paywalled locator with the Herfort–Ribes substitute; Ihara 1994, Belyi 1979 and Montpellier folder 145) are inherited unchanged: no passage outside the new paragraph changed.
- The openness of the relation-constrained invertibility question and of the nonabelian finite-quotient classification (README:668–675) is cited to Lochak–Schneps 2006 and was not re-established here.

## Source issues

- none
