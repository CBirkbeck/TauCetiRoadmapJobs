# Review of FarguesFontaineDiamonds (pull request #964 at 389338f)
**Verdict:** accepted

Incremental re-review of the 48 lines (24 insertions, 24 deletions, all in `TauCetiRoadmap/FarguesFontaineDiamonds/README.md`) changed since d18392d, the head the previous review read. The changed passages are the DiamondEtaleCohomology supplier contract (lines 268–278), the compatible-roots Check of the affinoid product bijection (lines 419–423), the root-cancellation Check of the untilt divisor frame (lines 787–799), the F5 coefficient paragraph (lines 964–965) and the `*Needs:*` lines and routes of the global-sections and tensor-compatibility targets (lines 1011, 1013, 1021, 1023). Each was reviewed in full with everything that cites it; the rest of the roadmap is carried from the previous review. No file outside the folder changed.

## R01 (P3) — The four cited sources still have no manifest

**Location:** the folder `TauCetiRoadmap/FarguesFontaineDiamonds/`, which contains `README.md`, `Suggested.lean` and `metadata.toml` only; `README.md:1118`–1147 cites FS, SW, ECD and KL.

**Claim:** Every cited work is recorded in the roadmap's `sources.toml`.

**Witness:** `ls` of the folder at 389338f lists three files and no `sources.toml`; the diff since d18392d touches only `README.md`. All four texts are legally readable (FS and SW on the authors' MPIM pages, FS with the SHA-256 printed at `README.md:1130`; ECD arXiv 1709.07343; KL arXiv 1301.0792), so the records can be written.

**Repair:** Add a `tauceti-roadmap-sources/v1` manifest with one record each for FS (author-page, the printed hash, locators II.1.1–4, II.1.15–19), SW (author-page, draft of 27 March 2020, locators 5.3.2–5.3.9, 11.3.1, 13.1.1, 13.5.1), ECD (arXiv v4, locators §§14–17, 26) and KL (arXiv v5, locators 8.2.16–8.2.19). This repeats the previous review's R02 (and the review before it, R05); it does not block acceptance.

## Previous findings

- R01 — repaired: `README.md:271`–274 now reads “derived tensor product of §C3.8 on `D_et(Y,Λ)`, symmetric monoidal with unit `Λ_Y` … the right adjoint `Rf_*` of §C3.2, exact and limit-preserving, with `RΓ(Y,−)` the mapping object out of `Λ_Y`”; lines 964, 1011, 1013, 1021 and 1023 carry the same descriptions. `grep` for `etTensor`, `push_globalSections`, `push_limits` over the README returns nothing. Each description matches an API bullet of DiamondEtaleCohomology at its open head (see Verified sound).
- R02 — not repaired: no `sources.toml` in the folder (re-raised above as R01, P3).
- R03 — repaired: `README.md:789`–799 now writes the sequences as `p_m`, `v_m`, `s_m`, matching line 670 (“`s_m=p_m/v_m` obey `s_m^p=s_(m−1)`”); `grep` for `pRoot`, `varpiRoot`, `ratioRoot`, `tRoots`, `pRoots` returns nothing. The four computations are recomputed below and are correct.

## Verified sound

**Gate, build and dependency direction.** The worker's gate at 389338f passed every check. I reran it from the worktree on this head: `gate FarguesFontaineDiamonds: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. `lake env lean TauCetiRoadmap/FarguesFontaineDiamonds/Suggested.lean` from the worktree: exit 0, no output. The file is unchanged since the previous review: one `import Mathlib`, one module docstring naming the headline theorems of F0–F5 and the carriers each lacks, `namespace TauCetiRoadmap.FarguesFontaineDiamonds`, no declarations; so there is no sorry'd data, no `set_option`, nothing to probe with one tactic, no binder to lose and no padding. The dependency check returned exactly

```text
depcheck: 201 roadmaps, 1315 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. In the merge order DiamondsAndVStacks (line 15), DiamondEtaleCohomology (line 73) and AdicCoefficientsAndComparisons (line 90) precede FarguesFontaineDiamonds (line 102), so every supplier the changed passages cite is earlier. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FarguesFontaineDiamonds'` is empty. The worktree was clean before and after; nothing in it was changed.

**The repaired DiamondEtaleCohomology citations, resolved at its open head (#922).** `roadmaps show DiamondEtaleCohomology` was read at these lines:

| README passage | DiamondEtaleCohomology at #922 | Result |
| --- | --- | --- |
| `README.md:272`–274, 1011, 1013: “`Rf_*` of §C3.2, exact and limit-preserving” | `README.md:1011` “#### C3.2 Pushforward `Rf∗` on `D_ét`”; API bullet at line 1020 “`Rf∗` is exact and preserves all limits” | Exists, stated for any map of small `v`-stacks and any `Λ`. |
| `README.md:273`–274, 1011: “`RΓ(Y,−)` the mapping object out of `Λ_Y`” | line 1021 “`RΓ(Y, −) := RHom_{𝒟_ét(Y,Λ)}(Λ_Y, −) : D_ét(Y, Λ) → D(Λ)`” | Exists; the README's “corepresented by `Λ_Y`” (lines 276, 1013) is this definition. |
| `README.md:271`–272, 964, 1021, 1023: “derived tensor product of §C3.8 on `D_et(Y,Λ)`, symmetric monoidal with unit `Λ_Y` and compatible with pullback” | `README.md:1104` “#### C3.8 The derived tensor product on `D_ét`”; bullets at lines 1110–1112: symmetric monoidal structure with unit `Λ_Y`; `f^∗` symmetric monoidal | Exists. |
| `README.md:274`, 1023, 1025: “§C3.11 for derived coefficient reduction” | `README.md:1161` “#### C3.11 Change of coefficient ring on `D_ét`”, line 1163: `Λ → Λ/I`, `Λ/Iⁿ → Λ/I^m` give the reduction functors | Exists. |
| `README.md:276`–278: “stated for an arbitrary commutative coefficient ring, so they apply at every finite level `Λ/I^n`” | DiamondEtaleCohomology Conventions line 40: “`Λ` is a commutative coefficient ring in the tensor … results”; C3.2 and C3.8 carry no hypothesis on `Λ` (the only `nΛ = 0`, `n` prime to `p` clause at line 1024 is the qcqs base-change compatibility, which this README does not use) | Agrees with `README.md:129`–133 and ECD §§14, 17. |

**Seeded sample.** The sample names “API” ten times, one per `**API.**` block. Two blocks' Checks changed; both were rechecked at the text (FS is the author-page copy whose SHA-256 the README prints; page markers coincide with printed pages). The other eight blocks are unchanged and carried from the previous review's table.

| API block | Source passage read this round | Result |
| --- | --- | --- |
| Affinoid untilt-product bijection (`README.md:404`; changed Check at 419–423) | FS line 1838–1847 (Prop. II.1.2, p.49): a map `T → Y_S` is a map `W(R⁺) → A⁺` with `[ϖ]` invertible in `A`, equivalently by the universal property of `W(R⁺)` a map `R⁺ → (A⁺)♭` with `ϖ` invertible in `A♭` | The inverse sends `[x]` to `f(x)♯`; on the compatible roots `[t^{1/p^m}] ↦ p^{1/p^m}` as the Check states. |
| Untilt divisor root frame (`README.md:859` block; changed Check at 787–799) | FS line 1828–1830 (proof of II.1.1, p.48): `A⁺₀/[ϖ]` is `(R⁺/ϖ ⊗ O_{E∞}/π)[t₁^{1/p^∞}]` modulo the relations `π^{1/p^m} − [ϖ]^{1/p^m} t₁^{1/p^m}` | With `p_m = π^{1/p^m}`, `v_m = [ϖ]^{1/p^m}`, `s_m = t₁^{1/p^m}` this is the Check's `s_m·v_m = p_m`; the source's own relation is the one the Check verifies algebraically. |
| The other eight (446, 563, 629, 699, 738, 895, 982, 1049) | unchanged | Carried from review ~2 (FS II.1.17 p.55, II.1.16 pp.54–55, II.1.18 p.55; ECD Lemma 15.6 pp.91–92, Def. 14.13–Prop. 14.15 p.88, §26 pp.161–162; SW 5.3.2–5.3.9 pp.38–40, 11.3.1 p.94). |

**Adversarial computations on the changed statements.** Notation as in the previous review: `F_t` the completed perfection of `𝔽_p((t))`, `u` the Kummer untilt with `t♯ = p`.

| Statement (README line) | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Supplier contract: `RΓ(Y,−) = RHom(Λ_Y,−)` preserves Postnikov limits (276, 1013) | `A = ⊕_{j≥0} Λ[j]`, tower `τ_{≥−n}A`; `Λ = 𝔽₃` at a geometric point | `RHom(Λ, τ_{≥−n}A)` has `H^{−j} = Λ` for `j ≤ n`, `0` for `j > n`; `lim_n` has `H^{−j} = Λ` for every `j`, equal to `RHom(Λ, A)` degreewise; corepresentable functors preserve all limits, so no further hypothesis is needed | Pass; C3.2 bullet at #922 line 1021. |
| Supplier contract: `Rf_*` exact and limit-preserving (272, 1013) | `f = id`; `f : Spa(C,O_C) × S → Spa(C,O_C)`, `S` profinite, `M` a `Λ`-module | `R(id)_* A = A`; `Rf_* M = C(S, M)` in degree 0, which is `lim` over finite quotients of `S` of `M^{S_i}` and exact in `M` | Pass; C3.2 Checks at #922 lines 1027–1029. |
| Supplier contract: §C3.8 tensor with unit `Λ_Y`, compatible with pullback (271–272, 1021, 1023) | `Λ_Y ⊗ A`; `f^*(Λ[1] ⊗ Λ[−1])` | `Λ_Y ⊗ A ≅ A`; `f^*(Λ[0]) = Λ[0] = f^*Λ[1] ⊗ f^*Λ[−1]` | Pass; C3.8 bullets at #922 lines 1110–1112. |
| Compatible-roots Check (419–423) | `F = F_t`, `m = 0, 1`; `p = 2` | `(t^{1/2})² = t` in `F_t` (unique root, `F_t` perfect); inverse of `(id_S,u)` sends `[t^{1/2}] ↦ (t^{1/2})♯ = 2^{1/2}` and `[t] ↦ 2`; `(2^{1/2})² = 2 = t♯` by multiplicativity of sharp; `2` and `[t] ↦ 2` are units of `ℚ_2(2^{1/2^∞})^`, and `2` is not a unit of its valuation ring | Pass; FS line 1845–1846. |
| Root-cancellation Check, the algebraic step (789–792) | commutative `B`, arbitrary `m` | `(s_{m+1}v_{m+1})^p = p_{m+1}^p`, i.e. `s_{m+1}^p · v_m = p_m = s_m v_m`; multiply by `v_m^{−1}`: `s_{m+1}^p = s_m` | Pass; uses exactly the three listed hypotheses and the unit. |
| Root-cancellation Check, `ℚ` instance (793) | `p = 2`, `p_m = v_m = 1` | `s_m = 1/1 = 1`; `1² = 1` | Pass. |
| Root-cancellation Check, real instance (794–795) | `p = 2`, `p_m = 4^{1/2^m}`, `v_m = 2^{1/2^m}`, `s_m = 2^{1/2^m}` | `s_m v_m = 2^{2/2^m} = 4^{1/2^m} = p_m`; `p_{m+1}² = 4^{2/2^{m+1}} = 4^{1/2^m}`; `v_{m+1}² = 2^{1/2^m}`; `s_{m+1}² = 2^{2/2^{m+1}} = 2^{1/2^m} = s_m` | Pass. |
| Root-cancellation Check, `ℤ/4` negative control (796–798) | `p = 2`, `p_m = v_m = 0`, `s_m = 2` | `s_m v_m = 2·0 = 0 = p_m`; `p_{m+1}² = 0 = p_m`, `v_{m+1}² = 0 = v_m`; `s_{m+1}² = 4 = 0 ≠ 2 = s_m`; `0` is not a unit of `ℤ/4`, so the unit hypothesis is the one that fails | Pass; the wrong model (no unit condition) is excluded by this instance. |
| Consistency with line 670 (`s_m^p = s_{m−1}`) and FS line 1830 | `m ↦ m+1` reindexing | line 670 at index `m+1` reads `s_{m+1}^p = s_m`, the Check's conclusion; FS's relation `π^{1/p^m} = [ϖ]^{1/p^m} t₁^{1/p^m}` is `p_m = v_m s_m` | Pass; the roadmap agrees with itself and with the source. |
| F5 coefficient paragraph: discrete tensor is §C3.8's transported to the left-completed adic site; adic tensor is L0's `I`-completed tensor (964–965) | `Λ/I^n` with `Λ = ℤ_3`, `I = (3)`, `n = 2`; `Λ = ℤ_3` adic | discrete level `ℤ/9`: `ℤ/9 ⊗^L_{ℤ/9} ℤ/9 = ℤ/9`, a discrete ring so §C3.8 applies; adic: completed `ℤ_3 ⊗̂^L ℤ_3 = ℤ_3`, which is L0's tensor, not §C3.8's | Pass; the two tensors are assigned to the right coefficient classes. |
| Global-sections `*Needs:*` and route (1011, 1013) | tower `A_n = τ_{≥−n}A`; `A = Λ[0]` | inputs named: F5 bounded-below and left-completed comparisons, C3.2's `RΓ` and limit-preserving `Rf_*`, E3.4 mates; for `Λ[0]` both sides are `RΓ(X_et, Λ)` and the map is the identity on `H⁰ = Λ` | Pass; every input is a named target or supplier section, none derived from the target. |
| Tensor-compatibility `*Needs:*` and route (1021–1025) | `Λ[1] ⊗ Λ[−1]`; unit; two nested chart restrictions | `Λ[0]` on both sides; `Λ ⊗ Λ = Λ`; restriction of the unit isomorphism along `r∘s` equals the local unit isomorphism on either path | Pass; inputs: F5, F3, C3.8, C3.11, E3.4, ECD 14.15 and 17.7. |

**Rows carried from the previous review (statements the diff leaves untouched).** Each row below is the previous report's row, with its instances and values as recorded there (PRREVIEW ~2, “Adversarial computations”); none of these statements changed at this head, and the citations they contain were re-resolved only where the diff touches them.

| Statement (README line) | Values (from review ~2) | Result |
| --- | --- | --- |
| `Y = D(p) ∩ D([ϖ])` (67) | `v(p)=0 ⇒ v(p[ϖ]) = 0`; prime support both ways | Pass |
| Radius and Frobenius (87–88) | `κ = 2 ↦ 2p` for `|p| = 1/2`, `|[ϖ]| = 1/4` | Pass |
| Window breakpoint (97–101) | `c = 3/2` (`p=2`), `2` (`p=3`) | Pass |
| Tate versus plus units (79–80) | `p⁻¹ ∈ B^I`, `|p⁻¹| > 1` | Pass |
| Sharp multiplicative only (80–81) | `(t²)♯ = p²`; `(t+t)♯ = 0 ≠ 2p` at `p=2` | Pass |
| Adic coefficient hypotheses (135–140) | `(ℤ_3,(3))` admitted at `p=2`; `(ℤ_2,(2))` excluded | Pass |
| Analytic interface (328) | `p = 0`, `[ϖ] ≠ 0` fails `mem_spaY_iff` | Pass |
| `ℚ_p` factorisation (340, 346) | zero ring: `0 = 1`, map exists; char 2 nonzero: none | Pass |
| Chart morphisms (352) | `(f∘r∘s, s^*r^*u)` both paths | Pass |
| Bounded Witt–θ (382, 388) | `θ(W(f)[t^{1/p^m}]) = p^{1/p^m}` | Pass |
| Affinoid product bijection, API and base-point/empty Checks (394, 413–417) | `{*} ≃ {*}×{*}`; `(id,u) ≠ (φ_S,u)` at `t` | Pass |
| Naturality (424) | `(f∘id, id^*u) = (f,u)` | Pass |
| Product isomorphism extensionality (436, 451) | first projections `t` vs `t^p` | Pass |
| Field-map naturality (461) | `[t] ↦ p` both composites | Pass |
| Frobenius equivariance (493, 499) | `p^p = 4, 27` versus the inverse convention's `2^{1/2}, 3^{1/3}` | Pass |
| Adic graph relation (505, 511) | `U₀ ∩ φ^{−k}V₀`: `{3/2}`, `{1}`, `∅`, `∅` for `k = 0,1,2,−1` | Pass |
| Diamond graph relation (517, 523) | `n + (−n) = 0`; `(0,1)` locally constant section | Pass |
| Local-isomorphism cover (529, 535) | fibre `ℤ`; `κ = 1 ∈ U₀`, `κ(φx) = 2 ∈ V₀` | Pass |
| Effective quotient (541, 547) | `h∘φ^n = h ⇔ h∘φ = h` | Pass |
| Quotient comparison (553, 565–573) | `π∘α∘φ_Y = π∘α` | Pass |
| qcqs and translates (577, 583) | `1 ≤ 2^k ≤ 2 ⇒ k ∈ {0,1}` | Pass |
| Chart restriction of site equivalence (607, 613) | `{1,2}` restricts to `{1,2}` | Pass |
| Frobenius descent cocycle (619, 633, 637) | `c₂ = 2·2 = 1` in `𝔽₃`; `c_{−1} = c₁^{−1}`; `S₃` non-commuting test | Pass |
| Finite étale descent (643, 649) | `τ² = id` | Pass |
| Analytic Cartier ideal (688–719) | `(1),(T),(T²),(0)` quotients `0, K, K[ε]/ε², A` | Pass |
| Closedness criterion (690–691) | `(T)` closed image on both charts | Pass |
| Section–untilt bijection (728, 740–748) | `(id_S,u) ≠ (id_S,u∘φ_S)`; `p = 0` excluded | Pass |
| Primitive equation (752, 758) | `θ(p − [t]) = 0`; `(vξ) = (ξ)` | Pass |
| Split root frame (764, 770) | `σ(1) = 1`; `b·σ(p^{1/p}) = 0` retraction | Pass |
| Perfectoid root annuli (776, 782) | `π^p = [ϖ] ∣ p`; `V₀ = [3/2,2]`, `φ^{−1}V₀ = [3/4,1]` | Pass |
| Gauge normalisation (807, 813) | `g([ϖ]) = 2^{−p}`, `g(π) = 1/2`; `p=3` gives `1/3` | Pass |
| Boundary supremum (803, 811) | `r^j` on disc and boundary | Pass |
| Multiplication bound (819, 825) | `|ξ| = p^{−n}`: `1/4`, `1/9`; `ξ = 0` fails for `c > 0` | Pass |
| Rational strict exactness (831, 839–843) | `ξ = 1` range all; `ξ = 0`, `c = 0` not injective | Pass |
| Untilt divisor on `Y` (849, 861–869) | `(C, O_C)` quotient; disjoint chart quotient `0` | Pass |
| Exact divisor sequence (873, 879) | `(vξ)(v^{−1}b) = ξb` | Pass |
| Untilt divisor on `X` (885, 897–905) | radii `2^n`, finitely many in `[a,b]` | Pass |
| Untilt-quotient sections (909–923) | one-point `|S|`; `u∘φ_S^{−1}` shift `−1` | Pass |
| Orbit invariance (929, 935) | `q∘φ_Y = q` | Pass |
| Left-completed comparison (972, 990–993) | `D(Λ)` both sides, `𝔽₃`, `𝔽₂` at `p = 2` | Pass |
| Bounded-below comparison (997, 1003) | `H⁰(Λ[0]) = Λ`, `H^{−1}(Λ[1]) = Λ` | Pass |
| Adic comparison (1033, 1051–1064) | `ℤ/3`, `ℤ/9`, `(ℤ/9) ⊗^L ℤ/3 = ℤ/3`, limit `ℤ_3`; `(∏𝔽_3)[[t]]`, `I = (t)` | Pass |
| Adic global sections (1068, 1074) | reductions `ℤ/3ⁿ`, `ℤ/3ⁿ[1]`, `0` | Pass |
| Non-statability docstring (`Suggested.lean:12`–30) | `spaY : Set (Spv (𝕎 R))`, `spaX` a topological quotient; no perfectoid, untilt, diamond, `Spd` or Cartier carrier at the pins | Pass |

**Other cross-roadmap citations in the changed passages.** AdicCoefficientsAndComparisons Layer L0 (`README.md:279`–282, 965) and EnhancedDerivedSheaves §E3.4 (`README.md:1011`, 1023) are cited exactly as at d18392d; the previous review resolved them at #965 (lines 510, 548, 578) and on main (line 1229). AdicCoefficientsAndComparisons precedes this roadmap in the merge order (line 90 versus 102). No new supplier, target or gap was introduced; no notion moved down.

**Ownership.** Unchanged since the previous review: the fixed-field product formula, the Frobenius quotient `Spd(ℚ_p)/φ^ℤ` and the untilt Cartier divisors have no other owner on main or at the 432 indexed heads, and the relative versions in VectorBundlesAndIsocrystals VB−1 and RelativeFarguesFontaine §3.2 consume this roadmap's F4. The board's package index lists five packages, none in this area.

## Not verifiable

- Nothing in the roadmap is statable at the pins, so the computed rows above are hand computations against the sources and the suppliers, not elaborated Lean statements.
- Ownership against open pull requests was checked through the indexed heads (`roadmaps grep`/`show`, index of 2026-10-29) and the sibling checkouts the brief names; board packages were checked only through the index.
- The unchanged passages were not re-read against their sources this round; their rows are carried from the previous review as the brief directs.

## Source issues

- none
