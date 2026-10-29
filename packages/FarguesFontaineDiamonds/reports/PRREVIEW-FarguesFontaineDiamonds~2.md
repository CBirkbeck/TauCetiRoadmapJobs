# Review of FarguesFontaineDiamonds (pull request #964 at d18392d)
**Verdict:** needs changes

This is a full re-review of the repaired head (398 changed lines since c7b5024). The previous review's seven findings were checked first, then the whole roadmap again. Status of the previous findings: R01 **not repaired** (re-raised below as R01); R02 repaired (`TauCetiRoadmap/FarguesFontaineDiamonds/README.md:129`–140 now takes an arbitrary commutative discrete `Λ`, with the `p=2`, `Λ=𝔽₂` Check at line 993); R03 repaired (all ten API blocks and every Check are prose; the only backticked names of this roadmap's own that remain are the three of R01 and the three Check sequence names of R03 below); R04 repaired (`Suggested.lean:35` opens `TauCetiRoadmap.FarguesFontaineDiamonds`, the process sentence is gone); R05 **not repaired** (no `sources.toml` in the folder; re-raised as R02, P3); R06 repaired (`README.md:716`–719, the `(T)` versus `(T²)` Check); R07 repaired (`README.md:1156` points at `Completed/AdicSpaces/README.md#layer-6-the-adic-farguesfontaine-curve`, which exists on main at line 691; `## Downstream consumers` at line 1104 names VectorBundlesAndIsocrystals VB−1/VB1–VB3, RelativeFarguesFontaine Layers 2–4 and BunGAndNewtonStrata Layer 2, all of which exist at the open heads).

## R01 (P1) — Three DiamondEtaleCohomology declaration names do not exist at the supplier

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:271`–274 (“the discrete tensor `etTensor` of §C3.8, and the global-sections and limit contracts `push_globalSections` and `push_limits` of §C3.2”); also lines 964, 1011, 1013, 1021 and 1023, where the `*Needs:*` lines of the global-sections and tensor targets cite “§C3.2 (`push_globalSections`, `push_limits`)” and “§C3.8 (`etTensor`)”.

**Claim:** DiamondEtaleCohomology C3.2 and C3.8 supply named interfaces `push_globalSections`, `push_limits` and `etTensor`.

**Witness:** `roadmaps grep 'etTensor|push_globalSections|push_limits'` over main and all 432 open heads returns only the eight lines of this README. At the DiamondEtaleCohomology head (#922), C3.2 (`TauCetiRoadmap/DiamondEtaleCohomology/README.md:1011`) states `Rf∗` with the API bullets “`Rf∗` is exact and preserves all limits” and “`RΓ(Y,−) := RHom_{𝒟_ét(Y,Λ)}(Λ_Y,−)`”, and C3.8 (line 1104) states the symmetric monoidal structure on `𝒟_ét(Y,Λ)` with unit `Λ_Y`; neither block, nor its `Suggested.lean`, contains the three identifiers. The mathematics is owned there; the names are not.

**Repair:** Cite the mathematics by section and description, not by invented names: at line 271 “the derived tensor product of §C3.8, with unit `Λ_Y`, and the right adjoint `Rf∗` of §C3.2, exact and limit-preserving, with `RΓ(Y,−)` the mapping object out of `Λ_Y`”; at lines 964, 1011, 1013, 1021 and 1023 replace each parenthesised name by that description. No new target or gap is needed. Test on the instance that refutes the original: with `Λ=𝔽₃` at a geometric point, C3.8's unit computation is `Λ ⊗^L_Λ Λ = Λ` and C3.2's `RΓ` of the constant sheaf is `Λ[0]`, exactly what lines 1015 and 1027 compute; the repaired citations reach those statements, the current ones reach nothing. This repeats the previous review's R01, which the repair commit did not touch.

## R02 (P3) — The four cited sources have no manifest

**Location:** the folder `TauCetiRoadmap/FarguesFontaineDiamonds/` (README.md, Suggested.lean, metadata.toml); `README.md:1118`–1147 cites FS, SW, ECD and KL.

**Claim:** Every cited work is recorded in the roadmap's `sources.toml`.

**Witness:** There is no `sources.toml` in the folder. All four texts were fetched legally in this review (FS and SW from the author page at MPIM, with FS's SHA-256 equal to the hash printed at `README.md:1130`; ECD as arXiv 1709.07343v4; KL as arXiv 1301.0792v5).

**Repair:** Add a `tauceti-roadmap-sources/v1` manifest with one record each for FS (author-page, the printed hash), SW (author-page, draft of 27 March 2020), ECD (arXiv v4, April 2026) and KL (arXiv v5, May 2015), with the locators the README uses. This repeats the previous review's R05.

## R03 (P3) — Check sequence names look like Lean declarations

**Location:** `TauCetiRoadmap/FarguesFontaineDiamonds/README.md:788`–792: “take sequences `pRoot`, `varpiRoot` and `ratioRoot` … `ratioRoot(m)·varpiRoot(m)=pRoot(m)`”.

**Claim:** A Check names no Lean counterpart.

**Witness:** The three backticked camel-case identifiers are the only backticked names of this roadmap's own, apart from R01's, left after the R03 repair; `Suggested.lean` declares nothing, and line 670 already writes the same sequences as `p_m`, `v_m`, `s_m`.

**Repair:** Write the Check with the notation of line 670: “`s_m·v_m = p_m`, with `p_{m+1}^p = p_m`, `v_{m+1}^p = v_m` and each `v_m` a unit, gives `s_{m+1}^p = s_m`”. The computed instances (ratio `2^(1/2^m)` in `ℝ`; the `ℤ/4` failure with denominators `0` and ratio `2`, where `2² = 0 ≠ 2`) stay as they are.

## Verified sound

**Gate and build.** The worker's gate at d18392d passed every check (`gate FarguesFontaineDiamonds: … build=0 OK`). I elaborated `TauCetiRoadmap/FarguesFontaineDiamonds/Suggested.lean` with `lake env lean` from the worktree: exit 0, no diagnostics; the file has one `import Mathlib`, one module docstring, the namespace `TauCetiRoadmap.FarguesFontaineDiamonds` and no declarations, so there is no sorry'd data, no `set_option`, nothing to probe with one tactic and no binder to lose. The dependency check returned exactly

```text
depcheck: 201 roadmaps, 1311 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. The pull request changes no file outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FarguesFontaineDiamonds'` is empty). The worktree was clean before and after the review; no file in it was changed.

**Library names.** The elaborated-signatures file is empty because the roadmap declares nothing, so I put every library name the README cites into one scratch file and elaborated it once (after building the three pinned Tau Ceti `FarguesFontaine` modules, whose object files were missing): all 37 `#check`s resolved at the pins (Mathlib 6b7abb3, Tau Ceti a91d3aa), including the `to_additive`-generated `AddMonoidHomClass.antilipschitz_of_bound`. Statements read at the pin: `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:72` gives `q v = q w ↔ ∃ n : ℤ, φ^n w = v` (the README's `q(y)=q(y′) ↔ ∃ n, φ^n(y′)=y`); `Window.lean:144` gives `q ≤ κ(φ v) ↔ q/p ≤ κ(v)` (the README's `κ(φ_Y x) = p·κ(x)`); `Window.lean:255` defines `U_n` with lower bound `p^n` and upper bound `(p+1)/2 · p^n` (the README's breakpoint); `Y.lean:116` defines `spaY` as a `Set (Spv (𝕎 R))` and `Quotient.lean:56` `spaX` as a topological quotient, which supports the docstring's statement that neither carries the adic structure sheaf. `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:118` carries `[Fact ¬IsUnit (p : R)] [IsAdicComplete (span {(p : R)}) R]`, as the README states at line 156. The pinned Tau Ceti has `PreAdicSpace` and a structure presheaf but no perfectoid space, untilt, diamond, `Spd` or analytic Cartier carrier (grep over `TauCeti/` for those words hits only Hopf-algebra Cartier duality and unrelated lemma names), so the docstring's “none of the headline results is statable” is right, and no headline is forced through a stand-in.

**Source sample.** The seeded sample names “API” ten times; the README has exactly ten `**API.**` blocks (lines 404, 446, 563, 629, 699, 738, 859, 895, 982, 1049), so all ten were checked at their locators. Page numbers are printed pages; in the FS and ECD extractions the page markers coincide with the printed pages, in SW the printed page is on the page header.

| API block (README line) | Source passage read | Result |
| --- | --- | --- |
| Affinoid untilt-product bijection (404) | FS line 1838–1847 (Prop. II.1.2, p.49): a map `T → Y_S` is a map `W(R⁺) → A⁺` with `[ϖ]` invertible in `A`, equivalently `R⁺ → (A⁺)♭` with `ϖ` invertible in `A♭`; FS line 2098 (Prop. II.1.17, p.55) | Supports the forward and inverse maps and both-coordinate extensionality; the `ℚ_p` factor comes from removing `V(p)` (FS line 2070). |
| Diamond product isomorphism (446) | FS line 2098–2102 (Prop. II.1.17, p.55), proof “immediate from II.1.2” | `Y_S^◇ ≅ S × Spd(E)` with `E=ℚ_p`; naturality and the `ℚ_p` projection are the affinoid formulas glued. |
| Quotient comparison (563) | FS line 2074–2078 (Prop. II.1.16, pp.54–55: `rad∘φ = q·rad`), line 2100–2101 (II.1.17: `X_S^◇ ≅ (S×Spd E)/φ^ℤ×id`) | Action on `S`, identity on `Spd ℚ_p`; radius scaling by `q=p`. |
| Frobenius descent of étale sheaves (629) | ECD line 3741–3756 (Lemma 15.6, pp.91–92: `Y^◇_ét ≅ Y_ét`, `Y^◇_fét ≅ Y_fét`, étale maps locally open immersion ∘ finite étale) | The site comparison is supplied; the cyclic cocycle is derived from the graph relation, as the README says. |
| Analytic Cartier ideal and criterion (699) | SW line 1740–1742 (Def. 5.3.2, p.38), 1783–1789 (Def. 5.3.7, pp.39–40), 1793–1797 (Prop. 5.3.8, p.40: closed iff closed image on all open affinoids; `S⁺` the integral closure of the image), 1809–1819 (Rem. 5.3.9) | Hypotheses (uniform analytic) and both directions agree with lines 688–697 and 721–722. |
| Sections and marked untilts (738) | FS line 1869–1873 (Prop. II.1.4, pp.49–50), line 2104–2107 (Prop. II.1.18, p.55); SW line 3762–3767 (Prop. 11.3.1, p.94) | Sections of `Y^◇→S`, maps `S→Spd ℚ_p`, untilts over `ℚ_p`; no map `X^◇→S` is asserted anywhere. |
| Untilt divisor on `Y` (859) | FS line 1879–1911 (proof of II.1.4, p.50): `ξ = π − a[ϖ]` with `ϖ♯ ∣ π`, `U_n = {|ξ| ≤ |[ϖ]|^n}`, norm normalised by `|[ϖ]| = 1/q`, `|ξa| ≥ q^{−n}|a|`, closed image, `B = A/ξ` | With `q = p` this is lines 679–680, 752 and 819–831 verbatim in content. |
| Untilt divisor on `X` (895) | FS line 2108–2112 (II.1.18, p.55): `S♯ → Y_S → X_S` is still a closed Cartier divisor and depends only on `S → Spd(E)/φ^ℤ` | Supports the descended divisor and the orbit invariance target; the ideal is never claimed globally principal. |
| Left-completed comparison (982) | ECD line 3625–3639 (Def. 14.13, Rem. 14.14, Prop. 14.15, p.88): `D_ét(Y,Λ)` left-complete, the left completion of `D(Y_ét,Λ)` for locally spatial `Y`, `D⁺_ét = D⁺(Y_ét)`; no hypothesis on `Λ` | The repaired general-`Λ` statement matches the source; DiamondEtaleCohomology C2.4/C2.5 (lines 822–834 at #922) state it for every ring `Λ`. |
| Adic comparison (1049) | ECD line 6717–6739 (§26, Def. 26.1, Prop. 26.2, pp.161–162): `Λ` `I`-adically complete, `I` generated by a regular sequence and containing an integer prime to `p`, derived `I`-complete objects, `D_ét(Y,Λ) ≃ lim_n D_ét(Y,Λ/Iⁿ)` as presentable stable ∞-categories, no noetherian hypothesis; Rem. 26.3 (line 6753–6758) | Hypotheses at lines 135–140 and 959–962 agree; AdicCoefficientsAndComparisons §2.1 (line 148 at #965) states the same coefficient pairs. |

Also read: FS line 1796–1835 (proof of II.1.1, p.48: `A⁺₀ = (W(R⁺) ⊗̂ O_{E∞})[(π/[ϖ])^{1/p^∞}]^∧_{[ϖ]}`, tilt `R⟨t₁^{1/p^∞}⟩` with `t₁♯ = π/[ϖ]`, chart `{|t| ≤ |ϖ| ≠ 0}`) for the root annuli at lines 669–677 and 776; FS line 2116–2124 (Def. II.1.19 and the following paragraph, p.56: the `v`-sheaf quotient `Spd(E)/φ^ℤ` agrees with the open-cover quotient) for line 917; SW line 3779–3820 (proof of 11.3.1, pp.94–95: the two-rational-set cover `{|ξ| ≤ |[ϖ]|^n}`, `{|[ϖ]|^n ≤ |ξ|}`, the constant `c > 0`, the Shilov boundary and the reduction to a geometric point and the tilt) for lines 803–827; SW line 4250–4274 (Prop. 13.1.1, pp.108–109) and 4398–4399 (Def. 13.5.1, p.112); ECD line 1957–1960 (Prop. 9.7, p.47), 2175–2199 (Prop. 10.11(iii), pp.52–53), 4018–4026 (Lemma 17.5, p.98, and the sentence “`Rf∗` agrees with the left-completed `Rf_ét∗`” for locally spatial diamonds, used at line 1009), 4078–4088 (Lemma 17.7, p.100); KL line 6361–6394 (Defs. 8.2.16 and 8.2.19, Lemma 8.2.17, Rem. 8.2.18, pp.162–163). The README's edition data agree with the texts: SW “March 27, 2020” (SW line 1746), ECD v4 dated April 2026 (ECD line 41–43), FS's hash.

**Adversarial computations.** Notation: `F_t` is the completed perfection of `𝔽_p((t))`, `u` the Kummer untilt with `t♯ = p`, `C` a complete algebraically closed extension of `ℚ_p`, `K` a complete nonarchimedean field and `A = K⟨T⟩`. Each row records the instances tried and the values on both sides. “Pass” means the displayed computation agrees with the statement and with the sources above; it is not a Lean proof, since nothing here is statable at the pins.

| Statement (README line) | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `Y = D(p) ∩ D([ϖ]) = D(p[ϖ])` (67) | `v(p)=0`, `v([ϖ])≠0`; `v(p)≠0`, `v([ϖ])≠0` | `v(p[ϖ]) = 0·v([ϖ]) = 0`, out of `Y`; `v(p[ϖ]) ≠ 0`, in `Y`; prime support gives both directions | Pass; the union `D(p) ∪ D([ϖ])` is correctly excluded (AdicSpaces §6.1 says the analytic locus is the union). |
| Radius and Frobenius (87–88) | rank-one `x` with `|p|=1/2`, `|[ϖ]|=1/4` | `κ = log(1/4)/log(1/2) = 2`; after `φ`, `[ϖ] ↦ [ϖ^p]`, `|[ϖ^p]| = 4^{−p}`, `κ = 2p` | Pass; equals the pinned `isRadiusLowerBound_comap_frobenius_iff`. |
| Window breakpoint (97–101) | `p=2`; `p=3` | `c = 3/2 ∈ (1,2)`; `c = 2 ∈ (1,3)` | Pass; equals `windowU`/`windowV` at the pin. |
| Tate versus plus units (79–80) | `p` in `B^I` | `p⁻¹ ∈ B^I`; `p ∉ (B^{I,+})^×` since `|p⁻¹| > 1` | Pass. |
| Sharp is multiplicative only (80–81) | `t, t` in `F_t`; `t + t` with `p=2` | `(t²)♯ = p² = (t♯)²`; `(t+t)♯ = 0♯ = 0 ≠ 2p` | Pass; the additive form is correctly excluded. |
| Adic coefficient hypotheses (135–140) | `(ℤ_3,(3))`, `p=2`; `(ℤ_2,(2))`, `p=2`; `(ℤ_p,(p))` | `3 ∈ (3)` prime to `2`; no integer prime to `2` lies in `(2)`; excluded, as ECD §26 and AdicCoefficientsAndComparisons §2.1 require | Pass. |
| Analytic interface (328) | generic chart; a valuation with `p=0`, `[ϖ]≠0` | on `U_n`, `p` and `[ϖ]` are topologically nilpotent units; the second point fails `mem_spaY_iff` | Pass. |
| `ℚ_p` factorisation (340, 346) | `p=2`; the zero ring; a nonzero ring of characteristic 2 | `2·2⁻¹ = 1` in `B^I`; `0 = 1` so `p` is a unit and the map exists; `2 = 0 ≠ 1`, no map to `Spa(ℚ_p,ℤ_p)` | Pass, including the empty untilt. |
| Chart morphisms (352) | restriction of a wandering chart along `id`; two nested restrictions | both product projections restrict to the same original chart map; `(f∘r∘s, s^*r^*u)` on both paths | Pass via AdicEtaleGeometry A1.16. |
| Bounded Witt–θ (382, 388) | `F_t`, `[t^{1/p^m}]`, `m=0,1,2` | `θ(W(f)[t^{1/p^m}]) = (t^{1/p^m})♯ = p^{1/p^m}` on both constructions; `(p^{1/p^{m+1}})^p = p^{1/p^m}` | Pass; FS line 1845–1846. |
| Affinoid product bijection (394, 413–417) | `T=∅`; `T=S`, `i_u` | `{*} ≃ {*}×{*}`; `α_S(i_u) = (id_S,u)`, inverse sends `[t] ↦ p`, a unit of `ℚ_p(p^{1/p^∞})^` but not of its valuation ring | Pass; both coordinates needed (the two points `(id,u)`, `(φ_S,u)` differ: `t ↦ t` versus `t ↦ t^p`). |
| Naturality (424) | `g = id`; `g = r∘s` nested rational restrictions | `(f∘id, id^*u) = (f,u)`; `(f∘r∘s, s^*r^*u)` on both paths | Pass. |
| Product isomorphism extensionality (436, 451) | `h = k`; `h = (id,u)`, `k = (φ_S,u)` | equal first and second projections; first projections differ at `t` (`t` versus `t^p`) while second agree | Pass in both directions. |
| Field-map naturality (461) | `F = F′`, identity | both composites send `[t]` to `p` and keep `u` | Pass. |
| Frobenius equivariance (493, 499) | `p=2,3`; `f = id`, `[t]` | `θ∘W(f)∘F_W([t]) = θ∘W(f)[t^p] = p^p = 4, 27`; `W(f)∘F_W = W(f∘Frob)` since `O_F` has characteristic `p`; the inverse convention would give `2^{1/2}, 3^{1/3}` | Pass; the positive generator is pinned. |
| Adic graph relation (505, 511) | `p=2`, `c=3/2`, `U₀=[1,3/2]`, `V₀=[3/2,2]` | `U₀ ∩ φ^{−k}V₀ = [1,3/2] ∩ [3·2^{−k−1}, 2^{1−k}]`: `k=0`: `{3/2}`; `k=1`: `{1}`; `k=2`: `∅`; `k=−1`: `∅` | Pass; two components, labels unique on each. |
| Diamond graph relation (517, 523) | labels `0`, `n`, `−n`; a two-component test with labels `(0,1)` | `(y,y)`; `n + (−n) = 0`; locally constant `(0,1)` is a section, no global integer equals both | Pass. |
| Local-isomorphism cover (529, 535) | geometric point; orbit through `κ=1` | fibre of `q^◇` is `ℤ` (not quasi-compact); `κ=1 ∈ U₀`, `κ(φx) = 2 ∈ V₀ = [3/2,2]` for `p=2` | Pass; the two chart images overlap. |
| Effective quotient (541, 547) | constant `h` with value `a`; the `(0,1)` label section | `h∘φ = h`, one descended map; descent on every component `n` is `h∘φ^n = h`, equivalent to the generator | Pass. |
| Quotient comparison (553, 565–573) | `y`, `φ_Y y` | `π(α(φ_Y y)) = π((φ_S×id)α(y)) = π(α(y))`, so `β∘q^◇ = π∘α` is well defined; uniqueness from the effective epimorphism | Pass. |
| qcqs and finiteness of translates (577, 583) | windows `[a,b]=[1,3/2]`, `[d,e]=[3/2,2]`, `p=2` | overlap with graph `k` iff `d/b ≤ 2^k ≤ e/a`, i.e. `1 ≤ 2^k ≤ 2`, so `k ∈ {0,1}`; two quasi-compact pieces at `κ = 3/2` and `κ = 1` | Pass; `compactSpace_spaX` at the pin. |
| Chart restriction of the site equivalence (607, 613) | split cover `X ⊔ X` restricted twice | `{1,2}` restricts to `{1,2}` along either path; sheet maps are the original inclusions | Pass. |
| Frobenius descent cocycle (619, 633, 637) | constant `𝔽₃` sheaf, `c₁ = 2`; `m=n=1`; `n=−1` | `c₂ = c₁·φ^*(c₁) = 2·2 = 1`; `c₀ = c₁·c_{−1} = 1` forces `c_{−1} = 2 = c₁^{−1}` | Pass; non-abelian check: on a three-sheeted constant object with `a=(12)`, `b=(23)` in `S₃`, `ab ≠ ba`, so “morphisms intertwine `c`” is a real condition. |
| Finite étale descent (643, 649) | split double cover with sheet swap `τ` | `τ² = id`, `τ^{−1} = τ`; the descended cover restricted to either window is the represented cover | Pass; ECD 10.11(iii). |
| Analytic Cartier ideal and Checks (688–719) | `(1)`, `(T)`, `(T²)`, `(0)` in `A` | quotients `0`, `K`, `K[ε]/ε²`, `A`; supports `∅`, `{0}`, `{0}`, whole disc; ranks `1,1,1,0`; `dim_K` of the first three quotients `0,1,2` | Pass; `(T) ≠ (T²)` with equal support, so the embedded ideal is the datum. |
| Closedness criterion direction (690–691) | `(T)` on the closed disc and on `T ≠ 0` | closed image on both; quotient `K` on the disc, `0` on the complement, glued quotient `K` | Pass in both directions on these instances; the one-chart failure is SW 5.3.9. |
| Section–untilt bijection (728, 740–748) | `u`; `u∘φ_S`; the characteristic-`p` untilt | sections `(id_S,u)`, `(id_S,u∘φ_S)`, both with first projection `id_S` and different second projections; `p=0` gives no point of `Spd ℚ_p` | Pass. |
| Primitive equation (752, 758) | `ϖ = t`, `a = 1`, `ξ = p − [t]`; unit `v` | `θ(ξ) = p − p = 0`; `(vξ) = (ξ)` by `span_singleton_mul_left_unit` | Pass. |
| Split root frame (764, 770) | `1`; `b ⊗ p^{1/p}`; a rational restriction `r` | `σ(1)=1`; retraction `b·σ(p^{1/p}) = 0`; both composites send `b⊗x` to `r(b)σ(x)` | Pass; AdicSpacesPartIII R3.5 has exactly the hypotheses used (complete Hausdorff Tate rings, continuous `R`-linear retraction). |
| Perfectoid root annuli (776, 782) | `π = v₁`; `p=2`, `V₀` | `π^p = [ϖ]` and `p = [ϖ]·s₀`, so `π^p ∣ p` (the P1.24 hypothesis); `[ϖ]^p ∣ p` is not needed; `V₀ = [3/2,2]` lies outside `κ ≤ 1`, `φ^{−1}V₀ = [3/4,1]` inside | Pass; FS line 1828–1835. |
| Root cancellation Check (786–799) | `ℝ`, `p=2`; `ℤ/4` | `(2^{1/2^{m+1}})² = 2^{1/2^m}`; with denominators `0` and ratio `2`: `0·2 = 0` holds but `2² = 0 ≠ 2` | Pass; the unit denominator is essential. |
| Gauge normalisation (807, 813) | `p=2`; `p=3` | `g(π) = 1/2`, `g([ϖ]) = 2^{−p}`; `(2^{−2})^{1/2} = 1/2`, then exponent `log 2/log 2 = 1` keeps `1/2`; for `p=3`, `(2^{−3})^{log 3/(3 log 2)} = 1/3`; applying only the last exponent to `1/4` leaves `1/4` | Pass; this equals FS's `|[ϖ]| = 1/q` with `q = p`. |
| Boundary supremum (803, 811) | closed disc of radius `r`, `b = T^j`, `j=0,1,2` | whole-disc sup `r^j`, boundary sup `r^j` | Pass; the finite-root and fibre passages are stated as proof obligations of the target. |
| Multiplication bound (819, 825) | `b=1`, `n=2`, `p=2,3`; `ξ=0` in a nonzero ring | boundary value `|ξ| = p^{−n}`: `1/4`, `1/9`, so `‖ξ‖ ≥ p^{−n}‖1‖`; `0 ≥ c·‖b‖` fails for `c>0`, `b≠0` | Pass; the sign `p^{−n}` not `p^n`. |
| Rational strict exactness (831, 839–843) | `ξ=1`, `c=1`; `ξ=0`, `c=0` on `ℝ` | range the whole ring, quotient `0`; `0·‖b‖ ≤ ‖0‖` holds but multiplication by `0` is not injective | Pass; `antilipschitz_of_bound` needs `c>0`. |
| Untilt divisor on `Y` (849, 861–869) | `F = C♭`, untilt `C`; a disjoint chart | quotient pair `(C, O_C)` under `θ`; `ξ` a unit so the quotient is `0` | Pass. |
| Exact divisor sequence (873, 879) | disjoint chart; `ξ ↦ vξ` | `0 → B →ξ B → 0 → 0` with inverse `ξ^{−1}`; `(vξ)(v^{−1}b) = ξb`, identification by `v^{−1}` on the first term | Pass. |
| Untilt divisor on `X` (885, 897–905) | Kummer untilt, `p=2`, radius `1` | translate radii `2^n`, `n ∈ ℤ`, pairwise distinct; in a bounded window `[a,b]` only `n` with `a ≤ 2^n ≤ b`; all map to one point of `X` | Pass; locally finite union. |
| Untilt-quotient sections (909–923) | `S = Spa(F_t,O_{F_t})` | `|S|` is one point, so every open cover of `S` contains `S`; sections of the open-cover quotient over `S` equal `Spd(ℚ_p)(S)/ℤ`; `u` and `u∘φ_S^{−1}` have shift `−1` | Pass; FS line 2119–2122. |
| Orbit invariance (929, 935) | `n = 1`, `−1` | `(φ_S×id)∘(id,u)∘φ_S^{−1}(s) = (s, u(φ_S^{−1}s))`; `q∘φ_Y = q` | Pass; positive `φ_Y` is inverse precomposition of the marking. |
| Left-completed comparison (972, 990–993) | geometric point, `Λ=𝔽₃`; `p=2`, `Λ=𝔽₂` | both sides `D(Λ)`; unit `Λ[0]`; `Λ ⊗^L Λ = Λ`; degree-zero section map `a ↦ a` | Pass for every discrete `Λ` (ECD 14.15 has no coefficient hypothesis). Names: R01. |
| Bounded-below comparison (997, 1003) | `Λ[0]`, `Λ[1]` | `H⁰(Λ[0]) = Λ`, `H^{−1}(Λ[1]) = Λ` on both paths | Pass. |
| Global-sections comparison (1009, 1015) | `A = ⊕_{j≥0} Λ[j]`, truncations `τ_{≥−n}A` | each `RΓ(τ_{≥−n}A)` has `H^{−j} = Λ` for `j ≤ n`; the limit has `H^{−j} = Λ` for all `j`; the comparison is the identity in each degree; `RΓ = RHom(Λ,−)` preserves the Postnikov limit (C3.2 API, ECD line 4025–4026) | Pass; citation names: R01. |
| Tensor compatibility (1021, 1027) | `Λ[1] ⊗ Λ[−1]`; unit | `Λ[0]` on both sides; `Λ ⊗ Λ = Λ`; restriction of the unit isomorphism to a chart is the local unit isomorphism | Pass; citation names: R01. |
| Adic comparison (1033, 1051–1064) | `Λ=ℤ_3`, `I=(3)`, `n=1,2`; `Λ=(∏𝔽_3)[[t]]`, `I=(t)`, `p=2` | levels `ℤ/3`, `ℤ/9`, `(ℤ/9) ⊗^L_{ℤ/9} ℤ/3 = ℤ/3`, limit unit `ℤ_3`; `tf = 0 ⇒ f = 0`, `Λ/tⁿ = (∏𝔽_3)[t]/tⁿ`, `3 = 0 ∈ I` | Pass; no noetherian hypothesis (ECD line 6738–6739, EnhancedDerivedSheaves E4.5 line 2820). |
| Adic global sections (1068, 1074) | completed `ℤ_3` unit and its shift; `0` | reductions `ℤ/3ⁿ`, `ℤ/3ⁿ[1]`, `0`; transitions are the ordinary reductions on both paths | Pass. |
| Non-statability docstring (`Suggested.lean:12`–30) | each of F0–F5 against the pins | `spaY : Set (Spv (𝕎 R))`, `spaX` a `Quotient` with a topology; no perfectoid, untilt, diamond, `Spd` or analytic-Cartier declaration in the pinned Tau Ceti; Mathlib's `fontaineTheta` is algebraic | Pass; nothing statable, nothing stated. |

Rank-zero coefficients (`Λ = 0` gives zero categories at every level, consistent with DiamondEtaleCohomology C2.2's Check), the empty test, the zero quotient, `p = 2` and non-algebraically-closed `F` are covered above. Nonreduced thickenings do not occur as perfectoid tests; `(T²)` plays that role for the Cartier quotient. No hypothesis was found to contain its conclusion, and no Check contradicts a theorem of its section.

**Supplier citations resolved.** Every cross-roadmap citation was resolved against main (for roadmaps on main) or the open head named in the index.

| Supplier | Where resolved | Result |
| --- | --- | --- |
| Completed/AdicSpaces Layer 6 (main) | `Completed/AdicSpaces/README.md:691`, `:698` (6.1), `:729` (6.2: `κ(φv) = pκ(v)`, breakpoint `c=(p+1)/2`, `U_n`, `V_n`), `:779` (6.3), `:807` (6.4: the five chart statements and the pseudouniformiser independence) | All cited interfaces exist with the conventions this README uses. |
| AdicSpacesPartII (main) | `:1769` (R0.3), `:2759` (R0.5; `BanachModule.CompletedTensor.exact_of_split` at `:2885`), `:3868` (R0.8, closed adic subspaces, `:3892`) | The citation scanner's `exact_of_split` lead is a README contract, not a missing declaration. |
| AdicSpacesPartIII (main) | `:10179` (R3.5), `:10181` (*split-injection-completed-base-change*) | Hypotheses as used at line 768. |
| PerfectoidSpaces (main) | P1.3 `:3780`, P1.5 `:3965` (*spectral-norm-under-sharp* at `:3986`), P1.7 `:4079`, P1.16 `:4525`, P1.17 `:4611`, P1.18 `:4652`, P1.20 `:4799`, P1.21 `:4870`, P1.22 `:4912`, P1.24 `:5049`, P2.2 `:6136`, P2.3 `:6235`, P2.11 `:7163`, P2.12 `:7322`; every parenthesised label of the `*Needs:*` lines is a slug there | P1.24's form “for a nonzerodivisor `π` with `π^p ∣ p` … Frobenius `R/π → R/π^p` bijective” is exactly what lines 244–249 and 780 use. |
| AdicEtaleGeometry (main) | A1.16 `:5886`; *adic-spaces-in-yoneda-adic-spaces* `:6272`; *yoneda-adic-fibre-products* `:4113` | Present. |
| EnhancedDerivedSheaves (main) | §§0.1–0.4 `:429`–492, E2.3 `:2125` (`postnikovCompletion`), E3.4 `:1229`, E4.5 `:2739` (`coefficientSystemReconstruction` `:2820`, non-noetherian) | Present. |
| DiamondsAndVStacks (#820) | D0.25 `:1991`, D0.26 `:2059` (*groupoid-quotients-and-two-fibre-products*), D3.9 `:5398`, D4.3 `:5957`, D6.1 `:8661` (*spd-of-a-tate-pair*), D6.2 `:8769`, D6.3 `:8831`, D6.4 `:8955`, D6.5 `:9036` (*etale-site-comparison*) | Present; D6.5 is stated for analytic adic spaces over `ℤ_p` with both site equivalences. |
| DiamondEtaleCohomology (#922) | C2.2 `:787`, C2.3 `:814`, C2.4 `:822`, C2.5 `:829`, C3.1 `:982`, C3.2 `:1011`, C3.4 `:1061`, C3.8 `:1104`, C3.11 `:1161` | Mathematics present for every ring `Λ`; the three names of R01 absent. |
| AdicCoefficientsAndComparisons (#965) | `L0/derived-I-complete-etale-category` `:510`, `L0/adic-coefficient-limit` `:548`, `L0/completed-tensor-and-colimits` `:578`; §2.1 `:148` | Present with the hypotheses the README states. |
| Downstream (#1205, #1209, #1241, #1006, #1180) | VectorBundlesAndIsocrystals VB−1 `:86`, VB1 `:414`, VB2 `:831`, VB3 `:1177`, citing `FarguesFontaineDiamonds Layer F4` at `:167`; RelativeFarguesFontaine Layers 2–4 `:1238`, `:1385`, `:1668`, citing F4 at `:89` and `:1826`; BunGAndNewtonStrata Layer 2 `:1335`; AutomorphicGaloisRepresentationsPartII `:2471`, `:2488` | The Downstream consumers section is accurate; these roadmaps are later in the merge order and cite this one, not the reverse. |

**Ownership.** `roadmaps grep` over main and the 432 open heads for the fixed-field product formula, the quotient `Spd(ℚ_p)/φ^ℤ` and untilt closed Cartier divisors finds the relative versions in VectorBundlesAndIsocrystals VB−1 (`:155`) and RelativeFarguesFontaine §3.2 (`:1412`), both of which consume this roadmap's F4 rather than restate it; the board package index lists five unrelated packages. The fixed-field `ℚ_p` diamond comparison and the analytic closedness argument have no other owner. The pinned libraries own the Witt-vector, algebraic-theta, ideal, set-image and antilipschitz facts, which the README cites rather than restates.

## Not verifiable

- No source was unreadable: FS and SW are author-page copies at MPIM (fetched with the author-page licence class), ECD and KL are arXiv texts; no missing-reference request was filed.
- Ownership against open pull requests was checked through the indexed heads (`roadmaps grep`, index of 2026-10-29) and the sibling checkouts named in the brief; packages under review on the board were checked only through the index, which lists none in this area.
- Nothing in the roadmap is statable at the pins, so the computed rows above are hand computations against the sources and suppliers, not elaborated Lean statements.

## Source issues

- **Misprint** in ECD at the paragraph before Lemma 17.5, printed p.98 (ECD line 4016–4017): the source writes the composition rule for pullbacks with the two functors in the written order of the maps; it should be the reverse order, since the pullback along the second map is applied first; affects the proof.
