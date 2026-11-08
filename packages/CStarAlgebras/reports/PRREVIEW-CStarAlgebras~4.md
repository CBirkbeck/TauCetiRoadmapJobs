# Review of CStarAlgebras (pull request #860 at 37316ab)

**Verdict:** needs changes

Incremental re-review of the 126 lines changed since 1acff0f (124 in the README, 2 in
`Suggested.lean`; nothing outside the folder). Every finding of the previous review is repaired,
with one exception of degree: the locator the previous review asked for at Smith's lemma (§3.2)
was added as the paper alone, without the theorem it refers to. That is the only finding below,
and it is P3. The gate passes, the elaboration is clean, the dependency check reports no problem,
and every new locator into a readable source (Blackadar, Dadarlat 2001, Pisier, the
VonNeumannAlgebras head) says what the README says it says.

## R01 (P3) — §3.2: Smith's lemma is cited to a whole paper, not to its theorem

**Location.** `TauCetiRoadmap/CStarAlgebras/README.md` line 928: "Smith's lemma: a map into
`M_n` has `‖u‖_cb = ‖u_n‖` (Smith, J. London Math. Soc. 27 (1983))"; line 2012 of the
references: "Smith's lemma, cited in §3.2" with no item number.

**Claim.** A locator into the source.

**Witness.** Every other locator added at this head names an item (Blackadar II.5.3.3, II.5.3.13,
III.5.2.11, II.7.3.6; Pedersen 3.11.9, 3.11.10, 3.12.3; Dadarlat 2001 Definition 2.4, Propositions
2.1–2.5, Theorem 2.6, Lemma 3.1; Effros–Haagerup §5); this one names ten pages. The manifest
entry `smith1983` records the locator as the page range `157–166`, scheme `page`, so nothing
narrows it. The source is uncertified, so it is cited by its locator alone, and the locator is
what carries the citation.

**Repair.** Cite the theorem: Smith's paper proves the lemma as its Theorem 2.10, for a bounded
map from a C*-algebra into `M_n`; write "(Smith 1983, Theorem 2.10)" at line 928 and in the
reference entry, and change the manifest locator to scheme `theorem`, "Theorem 2.10". Since §3.2
states the lemma for an operator space `E` while Smith states it for a C*-algebra domain, add
one clause that the compression argument uses only the matrix norms of `E` (or cite the
operator-space form, e.g. Effros–Ruan, *Operator Spaces*, Proposition 2.2.2, if that text is
added to the references). Tested on the Check at line 940: for `n = 1` the lemma gives
`‖u‖_cb = ‖u‖` for a functional on any operator space, which is what the Check uses.

## Previous findings

- R01 — repaired: line 1132 "`C*_r(F₂) ⊙ C*_r(F₂)`: `‖·‖_min ≠ ‖·‖_max`, since the
  representation on `ℓ²(F₂)` induced by the commuting pair … (Blackadar II.9.4.6(i)); the same
  holds for `C*(F₂) ⊙ C*_r(F₂)` (II.9.4.6(ii))"; line 1259 "the two-norm algebra
  `C*_r(F₂) ⊙ C*_r(F₂)`". Matches `blackadar` lines 8082–8085.
- R02 — repaired: line 488 "the adjoint shifts `S*^n` converge strongly to `0`
  (`‖S*^n x‖² = Σ_{k ≥ n} |x_k|²`) but `(S*^n)* = S^n` does not (`‖S^n x‖ = ‖x‖`, and
  `S^n e₀ = e_n`)".
- R03 — repaired: line 364 "a wrong adapter that imposed no condition at `ε` would admit the
  constant function `1` and `t ↦ sin(1/t)`, which are bounded and continuous on `(0,1]` but have
  no limit `0` at `0`".
- R04 — partly repaired: §1.5 line 410 cites Blackadar II.5.3.3 and II.5.3.13 (verified below);
  §2.9 lines 789–795 cite Pedersen 3.11.9, 3.11.10, 3.12.3 and Blackadar III.5.2.11, II.7.3.6
  (the Blackadar items verified below); §9.3 lines 1775–1786 cite Dadarlat 2001 by item; §9.5
  line 1832 cites Effros–Haagerup §5; line 1878 names V4.Normality and V1 by their statements
  (resolved below). §3.2 line 928 cites Smith's paper without its theorem: R01 of this report.
- R05 — repaired: lines 2008–2010 add Dadarlat, *Residually finite dimensional C*-algebras and
  subquotients of the CAR algebra*, Math. Res. Lett. 8 (2001), with items; line 1804 "(Dadarlat
  2001, Theorem 2.6, where the AF algebra is the CAR algebra)"; the "Blackadar V.4.2.12 and the
  remark citing [Dad00]" clause is gone. The author chose the 2001 paper rather than the 2000
  Amer. J. Math. one the previous review named; the 2001 text (certified, author's page) proves
  exactly the cited statements (verified below), so this is the better citation.
- R06 — repaired: `Suggested.lean` line 67 "§1.4 (Arveson)"; README line 390–391 "`Suggested.lean`
  states `exists_quasicentral_approximateUnit`" is in §1.4.
- R07 — repaired: line 1431 "(Blackadar II.9.6.6, end: exactness is strictly weaker than
  nuclearity)"; the quoted six words are gone (grep for "not every exact" finds nothing).

## Verified sound

**Gate at 37316ab.** The worker's gate: every check 0, `build=0`, OK. Re-run from the worktree
with the brief's command: every text check 0; its `depcheck` line reads `NOT IN ORDER:
CStarAlgebras (insert it after its last supplier)`, which is the main-branch merge order not
listing this new roadmap, not a defect (the brief: "not in the merge order" is never a finding
before intake); with the candidate order the check is clean, below. `lake env lean
TauCetiRoadmap/CStarAlgebras/Suggested.lean`: exit 0, nineteen "declaration uses `sorry`"
warnings at lines 53, 60, 69, 78, 87, 110, 117, 139, 152, 159, 165, 173, 191, 209, 231, 261, 293,
326, 347, nothing else. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder
holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Dependency check** (the brief's command, `--movable`, with the candidate order):

```
depcheck: 237 roadmaps, 2104 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the candidate order lists VonNeumannAlgebras at line 5,
CStarAlgebras at line 6, HilbertModules at line 12.

**The Lean file.** The only change is the docstring word "§1.5" → "§1.4" at line 67; no
statement changed, so the previous report's signature comparison (26 declarations against their
README statements; the two leads `directSumOperator` and `conjugate` without `[CompleteSpace]` are
`def`s whose types do not need it, and `voiculescu_weyl_von_neumann` carries it) and its
one-tactic probe (all nineteen theorems fail `first | rfl | simp | infer_instance | exact?`) carry
forward unchanged; the worker's `signatures.md` at this head flags the same two leads and nothing
else.

**New locators checked against the texts.**

- §1.5: `blackadar` lines 3913–3916 (II.5.3.3: every closed left ideal has a right approximate
  unit, from an approximate unit of the hereditary subalgebra) and 4025–4030 (II.5.3.13: for a
  nonclosed left ideal `N`, approximating a right approximate unit of its closure by elements of
  `N` gives one in `N`; with more care an increasing one). The README's addition, positivity and
  contractivity from the `b_F(δ + b_F)⁻¹` construction, is the roadmap's own and the Check at line
  426 computes it.
- §2.9: `blackadar` lines 13687–13694 (III.5.2.11: `J** = pA**` for a central projection `p`
  that is the σ-strong limit of an increasing approximate unit of `J`) matches "Blackadar
  III.5.2.11 for the ideal case, where `p` is the strong limit of an increasing approximate unit of
  the ideal"; lines 6292–6299 (II.7.3.6, attributed there to Pedersen 3.12.3: a left centralizer of
  a nondegenerate concrete `A` is left multiplication by a unique element of `A′′`) matches
  "II.7.3.6 realizes each left centralizer by an element of the bicommutant", and corroborates the
  Pedersen 3.12.3 locator's topic.
- §5.1: `blackadar` lines 8079–8085 (II.9.4.6(i): the representation of `C*_r(F₂) ⊙ C*_r(F₂)` on
  `ℓ²(F₂)` induced by `(λ, ρ)` is not min-continuous; (ii) the same for `C*(F₂) ⊙ C*_r(F₂)` with
  `(λ∘π, ρ)`), lines 8088–8089 ((iii): `(λ∘π, ρ∘π)` is min-continuous, so the old Check's claim is
  absent); `pisier-gt` lines 1945–1946 (Problem 12.9: unique C*-norm on `A ⊗ A` for
  `A = C*(F_N)`, `N > 1`) and 1917–1918 (`F_∞` may be replaced by `F₂`). "Bounded for `‖·‖_max`"
  is automatic for a commuting pair. Consistent with line 1568's QWEP remark.
- §6.2: `blackadar` lines 8198–8207 (II.9.6.6 end) support "exactness is strictly weaker than
  nuclearity"; the quotation is gone.
- §9.1: `dadarlat2001` line 227 (p. 550, in the proof of Lemma 3.1): the unitized cone over an
  RFD exact algebra is RFD because the algebra is. The source asserts it without argument; the
  README's route (evaluations composed with finite-dimensional representations) is its own and is
  checked in the table.
- §9.3: `dadarlat2001` lines 125–129 (Definition 2.4: `(F, ε)`-admissible means
  `‖σ(a) − π^∞(a)‖ < ε` on `F` for some faithful unital `σ` with `σ(A) ∩ K = 0` on
  `H = ℂ^k ⊕ ℂ^k ⊕ ⋯`), 130–134 (the remark: `π ⊕ γ` stays admissible; existence from Proposition
  2.3 for separable nuclearly embeddable RFD algebras), 117–121 (Proposition 2.3), 73–77
  (Proposition 2.1), 96–100 (Proposition 2.2), 137–142 (Proposition 2.5: `u(φ ⊕ Nπ)u* ≈ ψ ⊕ Nπ`
  within `3ε` on `F`), 163–164 (in the proof of Theorem 2.6: any two unital homomorphisms of the
  unitized cone into `M_k` are homotopic) and 192–193 (the same for representations on any `H`).
  "Exact" for Dadarlat's "nuclearly embeddable" is §7.1's Kirchberg equivalence (Blackadar
  IV.3.4.18, verified in the previous report).
- §9.4: `dadarlat2001` lines 158–159 (Theorem 2.6: `CA` and `SA` embed in the CAR algebra for
  separable nuclearly embeddable RFD `A`), 189–229 (Lemma 3.1: the pullback `F` of
  `∏M_k → ∏M_k/⊕M_k` along the Voiculescu embedding of the unitized cone, nuclear embeddability of
  `F` by the cp lift, `F` RFD, the semisplit essential extension `0 → I → C̃F → A → 0`), 230–244
  (§4: `C̃F` embeds in the CAR algebra by Theorem 2.6, so `A` is a quotient of a subalgebra of it).
  The README's non-unital version (`B = CA`, `E` the pullback, `CE → E → CA → A`) is the same
  argument; exactness of `E` through §7.1's locally split criterion replaces Dadarlat's
  nuclearity-of-`Φ` argument, and the ideal `⊕M_{k_n}` and quotient `CA` are exact.
- §9.6 transport: VonNeumannAlgebras at its open head dee80881, V4.Normality (its lines
  1124–1148): "normal faithful representations preserving the intrinsic predual" and "every
  normal star homomorphism is represented by amplification, reducing projection and spatial
  identification of its image, with kernel a central summand"; V1 (line 409): "equality of weak
  with ultraweak and strong with ultrastrong on norm-bounded sets". Both statements the README
  attributes exist there, and the argument (bounded strong-star = ultrastrong-star, which the
  positive normal functionals, hence the predual, determine) is checked in the table.
- References: Dadarlat MRL 8 (2001) 545–555 matches `dadarlat2001` line 5; the four new manifest
  keys `dadarlat2001` (certified, author's page), `smith1983`, `pedersen1979`,
  `effros-haagerup1985` (uncertified) exist with the README's venues and DOIs.

**Adversarial table** (values computed on each side; rows marked (r3) carry the previous
report's values for statements this diff leaves untouched, re-read at this head).

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §1.3 nonunital Gelfand adapter Check (rewritten) | `A = C₀((0,1])`; the two witnesses | constant `1`: continuous and bounded on `(0,1]`, `lim_{t→0} 1 = 1 ≠ 0`; `sin(1/t)`: continuous, `|sin(1/t)| ≤ 1`, oscillates between `±1` on every `(0,δ)`, no limit; both in `C_b((0,1]) ∖ C₀((0,1])`, both excluded by the condition at `ε` | holds; witnesses discriminate | none |
| §1.5 right approximate identity in a left ideal (locators added) | `C[0,1]`, `L = x·C[0,1]`; `L = 0`; `L` closed | `e = x²/(δ + x²) ∈ L`, `‖x − xe‖² = δ/4` at `t = √δ`; `L = 0`: zero net; closed `L`: Blackadar II.5.3.3 gives a right approximate unit from the hereditary subalgebra `L ∩ L*`, agreeing with the construction since `b_F(δ + b_F)⁻¹ ∈ L ∩ L*` | holds; locator supports the closed case, II.5.3.13 the nonclosed one | none |
| §1.7 strict topology Check (rewritten) | `x = e₀`; general `x`; `x, y ∈ ℓ²` | `S*^n e₀ = 0` for `n ≥ 1`; `‖S*^n x‖² = Σ_{k≥n}|x_k|² → 0`; `S^n e₀ = e_n`, `‖S^n x‖ = ‖x‖`; `⟪S^n x, y⟫ = Σ_k x_k \overline{y_{k+n}}`, bounded by `‖x‖(Σ_{k≥n}|y_k|²)^{1/2} → 0` | holds: `S*^n → 0` strongly, not strictly; `S^n → 0` weakly, not strongly | none |
| (r3) §2.9 open projections (locators added, statements unchanged) | `K(ℓ²)`; `C[0,1]`, `a = x`; `C₀(X)` | every projection of `B(ℓ²)` open; support of `x` is `χ_{(0,1]}`; `χ_U`; Blackadar III.5.2.11: `p = σ-strong lim h_λ` central for an ideal, matching "central open projections" | holds | none |
| §3.2 Smith's lemma (locator added) | transpose on `M_n` into `M_n`; `u : E → ℂ = M_1`; `u : M_2 → M_2` transpose at level `m = 4` | `‖u_n‖ = n = ‖u‖_cb` (the flip `[E_ji]` of norm `1` maps to `n·P`), so the level-`n` amplification already attains the cb norm; `n = 1`: `‖u‖_cb = ‖u‖`; level `4` adds nothing beyond `2` | holds at the README's generality (operator spaces: only matrix norms of `E` are used) | R01 (locator precision) |
| §5.1 Check (rewritten) | `C*_r(F₂) ⊙ C*_r(F₂)` with `(λ, ρ)`; `C*(F₂) ⊙ C*_r(F₂)` with `(λ∘π, ρ)`; `C*(F₂) ⊙ C*(F₂)` with `(λ∘π, ρ∘π)` | `λ(g)ρ(h) = ρ(h)λ(g)` for all `g, h` (left and right translations commute), so `λ × ρ` is a representation of the algebraic tensor product and `‖·‖_max`-bounded by the universal property; not `‖·‖_min`-bounded by II.9.4.6(i); (ii) likewise; (iii) min-continuous, so no two-norm claim for the full algebra | holds; consistent with line 1568 | none |
| (r3) §5.4 Examples line 1259 | the two-norm algebra named | now `C*_r(F₂) ⊙ C*_r(F₂)`, the (i) case | consistent with §5.1 | none |
| §6.2 Check (quotation removed) | `C*_r(F₂)`; separable exact non-nuclear | `C*_r(F₂)` is exact (discrete group, II.9.6.6) and not nuclear (II.9.4.6, since `C*_r(F₂) ⊙ C*_r(F₂)` has two norms); so "strictly weaker" has a witness | holds | none |
| §9.1 cones over RFD are RFD (locator added) | `F` RFD, `0 ≠ f ∈ C₀((0,1]) ⊗ F ⊆ C₀((0,1], ∏M_{k_n})`; `F = 0`; `F = ℂ` | some `t ∈ (0,1]` has `f(t) ≠ 0`, some `π_n` has `π_n(f(t)) ≠ 0`, so `π_n ∘ ev_t` separates; `C(0) = 0` RFD; `C₀((0,1])` RFD by point evaluations | holds; Dadarlat line 227 asserts it, route is the roadmap's | none |
| §9.3 admissibility and the `3ε` estimate (locators added) | `σ₀ = σ₁`; `A = ℂ`; `A = C(𝕋)`, `σ₀ = ev_1`, `σ₁ = ev_{−1}` into `M_1` | `u = 1`, `N = 1`, difference `0 < 3ε`; `ℂ`: the only unital rep into `M_k` is `a ↦ a·1`, `π^∞ = σ`, admissible with `0 < ε`; `C(𝕋)`: `ev_1`, `ev_{−1}` homotopic through `ev_{e^{iπs}}`, but `ev_1` is `(F, ε)`-admissible only if `|f(1) − …|`: `π^∞(f) = f(1)·1` is within `ε` of a faithful essential `σ` on `F` only when `F` is constant to within `ε`, so for `F = {z}` and `ε < 1` no one-point evaluation is admissible and Proposition 2.5's hypothesis fails, as it must (`(N+1)ev_1` and `ev_{−1} ⊕ N ev_1` have spectra `{1}` and `{−1, 1}`, distance `2` for `z`) | holds; hypothesis necessary | none |
| §9.3 unitized-cone representations homotopic (locator added) | unital `φ : C̃A → B(H)`; `H = 0` | `φ ∘ (φ_t ⊕ id_ℂ)` for `t ∈ [0,1]` with `φ_1 = 0` on `CA` (§5.5 Check) joins `φ` to `χ·1_H`, `χ` the character killing `CA`; so any two are homotopic; `H = 0`: unique rep | holds at the README's generality (any `H`, Dadarlat lines 192–193) | none |
| §9.4 subquotient route (locators added) | `CE → E → CA → A`; `A = ℂ`; `A = C*(F₂)` | `e ↦ (t ↦ te)` is a section of `ev_1 : CE → E`, so `ev_1` is onto; `E → CA` onto by the pullback; `ev_1 : CA → A` onto; composite onto; `ℂ`: `C₀((0,1]) ⊆ C[0,1] ⊆ C(Cantor)`; `C*(F₂)` not exact, so not a subquotient of an AF algebra (subalgebras and quotients of exact algebras are exact, §7.1) | holds; Theorem 2.6 and Lemma 3.1 are the cited steps | none |
| (r3) §9.5 local reflexivity (locator added) | `A` nuclear; `E = ℂ·1`; `B(ℓ²)` | nuclear ⇒ locally reflexive (Ozawa p. 27); `E = ℂ·1`: the inclusion itself; `B(ℓ²)` is not locally reflexive (not exact) though it is WEP | holds | none |
| §9.6 transport under faithful normal realizations (rewritten) | `(x_i)` bounded by `M`, `x_i → x` strongly, `(ξ_n)` square-summable; the unbounded rank-one net `T_F` of V1; `B = ℂ` | `Σ_n ‖(x_i − x)ξ_n‖² ≤ Σ_{n ≤ N} ‖(x_i − x)ξ_n‖² + 4M² Σ_{n > N} ‖ξ_n‖²`, both terms small, so bounded strong ⇒ ultrastrong, and the converse always; applied to `x_i*` gives strong-star = ultrastrong-star on bounded sets; `T_F → 0` SOT with `φ(T_F) = 1`, so the bound is needed; ultrastrong-star seminorms `x ↦ φ(x*x)^{1/2}, φ(xx*)^{1/2}` for `φ ∈ M_*^+` are transported by a normal star isomorphism (V4.Normality: predual preserved); `B = ℂ`: all topologies equal | holds | none |
| (r3) every other row of the previous report (§1.1, §1.2, §1.3 annihilators and heredity, §1.4, §1.8, §2.1–2.8, §2.10, §3.1, §3.3, §4.1–4.4, §5.2–5.5, §6.1, §6.3, §7.1–7.4, §8.1–8.4, §9.2, §9.7) | as in the previous report | as in the previous report | holds | none |

**Ownership and duplication.** The diff adds no object; the previous report's search by object
(Stinespring, Kadison transitivity, quasidiagonality, Choi–Effros, Voiculescu, multipliers,
Pedersen ideal, Haagerup tensor product, Dauns–Hofmann, Grothendieck inequality, Wittstock, Ruan,
open projections, maximal tensor norm) stands; the new citations consume VonNeumannAlgebras
V4.Normality and V1, both earlier in the merge order, and the VonNeumannAlgebras head's consumer
statement (its lines 64–72) still names CStarAlgebras as a consumer only.

**Seeded sample.** Of the fifteen seeded targets, those the diff touches are 9.1, 9.5 and 9.6
(checked above with their new locators) and the §1.4 docstring label; 1.4, 1.6, 1.8, 2.5, 2.8,
6.1, 6.2 (the Check only), 6.3, 7.1, 7.2, 8.2, 8.3 are unchanged since the previous report, whose
locator checks (`blackadar` II.4.2–II.4.3, II.6.5.10–15, III.5.2.5–11, IV.3.1, IV.3.2.4,
IV.3.4.2–21, II.8.4.29, V.4.1–V.4.2; `pisier-gt` 7.1, 12.3–12.8, 13.3–13.10; `ozawa2004` 2.2–3.17;
`stinespring1955` Theorems 1 and 4; `phillips1940` Lemma 3.3) carry forward.

## Not verifiable

- Pedersen 1979, Proposition 3.11.9, Theorem 3.11.10, Proposition 3.12.3 (print monograph, no
  legal copy; 3.12.3's content is corroborated by Blackadar II.7.3.6's attribution, the other two
  by their topic in Blackadar II.5.3 and III.5.2.11), Smith 1983 (paywalled; the theorem number
  in R01 is from the reviewer's knowledge of the paper, not from the text), Effros–Haagerup 1985
  §5 (paywalled; Dadarlat 2001 lines 56 and 260 cite its Proposition 5.3 for property (C), so §5
  holds the local-reflexivity material): settled as uncertified, cited by locator.
- The uncertified texts of the previous report (Ruan, Blecher–Paulsen, Wittstock, Paulsen,
  Arveson, Haagerup 1983 and 1985, Choi, Kirchberg, Dadarlat 1999, Runde, Takesaki, Pisier LNM,
  Connes, Lance, Effros–Lance): unchanged by this diff.

## Source issues

- none
