<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6902174002 -->
Review (claude) of c04daae

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.6(c): the product identity is attributed to a lemma that only prescribes orders

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1075`: "`TauCeti.Place.exists_ne_zero_forall_mem_ord_eq` gives the product identity"; the same lemma in the *Needs:* line of 5.6 (line 1083).

   **Claim.** The identity `(1 + ⋂_{D_{fα}} 𝔪_Q)·(1 + ⋂_{D_{gα}} 𝔪_Q) = 1 + 𝔪_P` follows from a lemma producing an element with prescribed orders at finitely many places.

   **Witness.** At the pin, `TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:145` states only `∃ g ≠ 0, ∀ P ∈ s, P.ord g = r P`. The inclusion `⊇` needs congruences. In `𝔽₅(s)` with `P: s = 0`, `Q: s = 1`, `D_{fα} = {P, Q}`, `D_{gα} = {P}`, `x = s`: `b = s` and `b′ = 2s` have the same orders `(1, 0)` at `(P, Q)`; `b` gives `a = (x − b)/(1 + b) = 0`, while `b′` gives `a = −s/(1 + 2s)`, of value `−1/3 = 3 ≠ 0` at `Q`, so `a ∉ 𝔪_Q`. `pop_eei2 line 709` uses weak approximation here.

   **Exact repair.**

   - Line 1075: replace "and `TauCeti.Place.exists_ne_zero_forall_mem_ord_eq` gives the product identity" by "and weak approximation gives the product identity: for `x ∈ 𝔪_P`, `TauCeti.Place.exists_forall_mem_valuation_sub_le` gives `b` with `ord_Q(b) ≥ 1` at every `Q ∈ D_{gα}` and `ord_Q(b − x) > max(0, ord_Q(1 + x))` at every `Q ∈ D_{fα} ∖ {P}`; then `a = (x − b)/(1 + b)` lies in `𝔪_Q` for every `Q ∈ D_{fα}`, `b` in `𝔪_Q` for every `Q ∈ D_{gα}`, and `(1 + a)(1 + b) = 1 + x`".
   - Line 1083 (*Needs:* of 5.6): replace `TauCeti.Place.exists_ne_zero_forall_mem_ord_eq` by `TauCeti.Place.exists_forall_mem_valuation_sub_le`.
   - Layer 5 Dependencies (line 1110): add `TauCeti.Place.exists_forall_mem_valuation_sub_le` to the Tau Ceti list (the order lemma stays: 5.2 uses it).
   - `### From Tau Ceti` (after line 64): add "- `TauCeti.Place.exists_forall_mem_valuation_sub_le`: for a finite set of places, targets `f_P` and integers `r_P` there is `g` with `v_P(g − f_P) ≤ exp(r_P)` on that set (weak approximation with targets)."

   Tested on the witness: the conditions force `ord_Q(b − s) > max(0, ord_Q(1 + s)) = 0` at `Q`, which `b = s` satisfies and `b′ = 2s` does not (`b′ − s = s`, order `0` at `Q`). The declaration exists at `TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:130`, in `namespace TauCeti.Place`. The other two uses of the order lemma (4.7: least value at `w`, very negative values elsewhere; 5.2: `w(x) < 0 < w′(x)`) need orders only and are correct.

2. **F02** (P3) §0.8: the anisotropy witness in characteristic `p` takes a constant `b`, which need not exist at the chosen point

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:287`: "take a smooth closed point of a model of `K′` … and `b` a constant that is not an `n_K`-th power in the finite residue field (it contains `ζ₃`), and apply 0.6(e)".

   **Claim.** At a smooth closed point of a model of `K′` some constant is a non-`n_K`-th power in the residue field, so 0.6(e) (a form over the base field) applies with *Needs:* 0.4, 0.5, 0.6 only.

   **Witness.** `K = 𝔽₃(t)`, `K′ = 𝔽₉(t)`, `n_K = 2`, a closed point of degree two: residue field `𝔽₈₁`, and `𝔽₉ˣ` is the subgroup of order `8` of the cyclic `𝔽₈₁ˣ` of order `80`, that is the `10k`-th powers of a generator, all squares. No constant works there. A point of degree prime to `n_K` exists only by a point count (Lang–Weil), which the *Needs:* line does not list.

   **Exact repair.** Replace the quoted clause by: "and `b` a unit of the local ring at the point whose residue is not an `n_K`-th power in the finite residue field (the residue field has odd order when `n_K = 2` and contains `ζ₃` when `n_K = 3`, so such residues exist), and apply 0.6(d) successively along the chain of discrete valuation rings `(A_j)_{(t_j)}` of the proof of 0.6(e): that argument uses only that the coefficients of `⟨1, −b⟩_{n_K}` lie in the local ring and that its reduction to the residue field has no nontrivial zero". The characteristic-zero branch of the same paragraph already takes a unit with nonsquare residue; the *Needs:* line is unchanged.

   Tested on the witness: at the degree-two point of `𝔸¹_{𝔽₉}` with prime `π`, take `b ∈ 𝔽₉[t]` whose residue generates `𝔽₈₁ˣ` (an odd power of a generator, a nonsquare); `⟨1, −b⟩₂` is anisotropic over `𝔽₈₁`, and 0.6(d) makes `⟨⟨π⟩⟩₂ ⊗ ⟨1, −b⟩₂` anisotropic over `𝔽₉(t)`: the two blocks have values `0` and `1` modulo `2`. This is the one-slot form `σ₁` needs (`δ = 1`). Pattern search: 0.12(b) (residue degree `1` or `ℓ > 3`, prime to `n_K`) and 0.14(a) (a unit `b` at a place split completely in the residue field) already control the residue field; only 0.8 does not.

Two findings, both P3, none blocking. The three findings of the previous round are repaired and the repaired passages hold against the Stacks text and on the instances recomputed below. Both new findings are in proof routes of the README (one pinned lemma cited for a step it cannot supply, one route step whose existence input is not named); each repair is a few lines of README text. `Suggested.lean`, `metadata.toml` and `design/plan.json` need no change. This review changed no author file.

## Verified sound

### Previous findings, finding by finding

| Previous finding | Repaired passage (quoted) | Status |
|---|---|---|
| F01 (P3): four consumed suppliers missing from the contracts, two from the scope | Scope, line 20: "§2.5 (Springer's theorem for odd-degree extensions, separable or not)"; line 25: "**ClassicalAdicEtaleCohomology** §11.2 (the transcendence-degree bound …)"; line 32: "**AnalyticNumberTheoryPartI** §0.21 (Mertens's second theorem)". Contracts, lines 76, 110, 118, 119: §2.5 with `TauCetiRoadmap.QuadraticFormInvariantsPartII.anisotropic_extendScalars_of_odd_finrank`; §11.2 with `TauCetiRoadmap.ClassicalAdicEtaleCohomology.field_cohomological_dimension_transcendence`; "JacobianChallenge Layer F (§F.1) … the pointed curve case of 0.8a"; "AnalyticNumberTheoryPartI §0.21 … `O(log log x)`" | **Repaired.** Placing AnalyticNumberTheoryPartI and JacobianChallenge under "on main" is right: both folders are on main |
| F02 (P3): a theorem of an unrecorded work cited by number | Line 1150: "(Stacks, Lemma 10.157.6, tag 031T; Dittmann–Pop, proof of Proposition 5.1, p. 16)"; line 517: "(Jannsen, p. 5)" | **Repaired**; "Matsumura" and "Jannsen–Saito" no longer occur. `jannsen_hasse lines 195–197` carries the claim for `0 < a ≤ 4` |
| F03 (P3): resolution of surfaces located by a chapter | Lines 41, 517, 526, 530, 544, 573, 1025, 1035, 1110, 1459 and the `stacks` locator of `sources.toml`: "Stacks, Theorem 54.14.5 (tag 0BGP) and §54.1 (tag 0ADX)", with the argument for projectivity and smoothness (1.4), for the generic fibre and flatness (1.5) and for the local ring `O_v` (5.4) | **Repaired**; no chapter-level citation remains (searched "chapter") |

The resolved names were checked at the suppliers' heads: `field_cohomological_dimension_transcendence` is declared in `namespace TauCetiRoadmap.ClassicalAdicEtaleCohomology` (its `Suggested.lean` line 126, after `end ValuationSpectrum`) for `K L`, a prime `ℓ` and `Algebra.trdeg K L`; `anisotropic_extendScalars_of_odd_finrank` in `namespace TauCetiRoadmap.QuadraticFormInvariantsPartII` (line 133); JacobianChallenge README line 1331 "### F.1 Abel–Jacobi and the Albanese property" with `isAlbanese_abelJacobi`; AnalyticNumberTheoryPartI README line 616 "### 0.21 Mertens's second theorem: the reciprocal-prime sum".

Adversarial pass on the passages the repair changed or added (Stacks text read in the chapter extraction the sources service holds, cited below as the Resolution of Surfaces chapter):

- §54.1 (chapter lines 33–38) says that a two-dimensional scheme of finite type over a field, or over a Dedekind domain with fraction field of characteristic zero such as `ℤ`, satisfies the condition; Theorem 14.5 (lines 1880–1888) gives the equivalence with a resolution by normalized blow-ups; Definition 14.2 (lines 1752–1761) makes every stage proper over `Y`. The README uses exactly these three facts. 1.5 applies §54.1 to a scheme of finite type over a ring of integers of a number field (Dedekind, characteristic zero) or over a finite field: both are covered.
- 1.5, "closed points lie in closed fibres": `Spec O_k` and a curve over a finite field are Jacobson, so a closed point of a scheme of finite type over them lies over a closed point. `E: y²z = x³ − xz²` over `ℤ`: singular point of the closure at `(1:0:1)` in the fibre at `2`; the generic fibre is untouched.
- 5.4, "geometrically integral `κ`-surface": the resolution is regular of finite type over the perfect `κ`, hence smooth; `K/κ` is regular, so the smooth `X` is geometrically integral.
- Pattern search for the repaired defects: every roadmap cited in the body occurs in the scope and in the contracts (counted for the 27 supplier names); no other cited work is missing from the manifest (19 entries, 19 reference lines; "after Nies" and "Lipman" are attributions without locators).

The maintainer left no notes for this roadmap.

### Principles and shape

Read in full this round: the README (1463 lines; Layers 0–8, each ending with Examples and Dependencies), `Suggested.lean` (10 declarations), `metadata.toml`, `sources.toml`, and the `gaps` list of `design/plan.json`. No route-specific shortcut, re-planned roadmap, computational algorithm, sorry'd data or `set_option`. A scan of the README and the Lean file for process words, pull-request numbers, machine paths, HTML anchors, LaTeX delimiters, "optional", "deferred" and "for later" found none. Every definition has at least three Checks (0.1: 4; 0.2: 4; 0.3: 3; 0.4: 4; 1.1: 3; 2.1: 4; 2.6: 3; 3.3: 4; 4.1: 3; 4.2: 3; 4.3: 3; 4.4: 3; 5.5: 4; 6.1: 4; 6.5: 4). The layer order is forced by the *Needs:* lines (3.1 needs 1.2–1.4 and 2.1; 4.6 needs 3.8; 5.2 needs 4.7; 6.4 needs 5.7; 7.6 needs 6.9; 8.5 needs 7.6).

### Seeded source sample (15 targets)

| Target | Text read | Result |
|---|---|---|
| 0.2 | `dittmann_pop lines 59–64`, p. 2 | Supports: prime divisor, the criterion `dim(Kv) = dim(K) − 1` for finitely generated `K`, geometric versus arithmetic |
| 0.3 | `dittmann_pop lines 71–77` (Theorem 1.3, p. 2); `poonen_uniform lines 137–140` (Definition 3.1, p. 4) | Supports; "empty failed fibres" is the last clause of Theorem 1.3 |
| 0.10 | `poonen_uniform lines 153–210` (Lemmas 3.4–3.7, pp. 4–5), `lines 47–48` (Theorem 1.1, p. 2), `lines 489–492` (proof, p. 10) | Supports all five items; the sentence is "closed under addition, `S ≠ 2S`, `2 ≠ 0`", false in every field of positive characteristic |
| 0.12 | `poonen_uniform lines 415–487`, pp. 9–10 | Supports (a), (c); (b), (d) are the README's corrected forms (Source issues), recomputed below |
| 1.4 | `dittmann_pop lines 204–225`, p. 5; `jannsen_hasse lines 180–197` (Conjecture 3, Theorem 0.6, p. 5), `lines 1889–1897` (Definition 4.18, pp. 39–40), `lines 2176–2195` (Theorem 5.10 and its proof, pp. 46–47) | Supports: both clauses of `RS`, the vanishing for `0 < a ≤ 4`, the two-prime norm argument over a finite base |
| 2.2 | `dittmann_pop lines 410–431`, pp. 9–10 | Supports (the two polynomials by characteristic, the local-norm criterion, the split case at `v₀`) |
| 2.5 | `dittmann_pop lines 432–456` (Lemma 3.6, p. 10) | Supports; `k₁` is relatively closed by the proof (constant field, or relative closure of `κ₀(u₁)`) |
| 3.3 | `dittmann_pop lines 611–613` (4.1(3), p. 14), `lines 520–525` (Proposition 3.10, p. 12) | Supports: `α² − α = a_d/θ²`, `β² − β = τ²/a_d` |
| 4.1 | `dittmann_pop line 615`, p. 14 | Supports: `θ ∈ k_tˣ`, `τ ∈ K` |
| 5.1 | `dittmann_pop lines 340–345` (Definition 3.3, p. 8), `665–672` (Recipe 4.3, p. 15) | Supports; the Hensel and preordering formulas are the README's own |
| 5.2 | `dittmann_pop lines 665–672`, p. 15 | Supports |
| 6.3 | `dittmann_pop lines 709–711`, p. 16; `stacks` tag 031T (read by the previous round, statement unchanged) | Supports |
| 6.7 | `dittmann_pop lines 751–762`, p. 17 | Supports |
| 6.8 | `dittmann_pop lines 737–748`, p. 17 | Supports |
| 8.5 | `dittmann_pop lines 44–46` (Theorem 1.1, p. 2), `line 781`, p. 18 | Supports; hypothesis "characteristic two and dimension above three" is the README's and the Lean's |

Read in addition, for the sections the previous round did not compare with their sources: 0.9 (`poonen_uniform lines 142–152`); 1.3 (`kerz_saito lines 1852–1862`, Theorem 8.1 on p. 37; `line 699`, Theorem 3.2 on p. 14; `line 1678`, proof of Theorem 6.2 on p. 33; `dittmann_pop lines 190–203`); 1.5–1.6 (`pop_eei2 lines 256–299`, Theorem 2.1 and §2C, pp. 2097–2098); 2.3 and 2.7 (`dittmann_pop lines 410–431, 467–468`); 5.5–5.6 (`pop_eei2 lines 474–480, 607–629, 699–752`); 7.1, 7.2, 7.4, 8.4 (`akns lines 535, 581, 595, 599, 648, 677, 689, 783, 834` on pp. 12–18; `903, 931` on p. 20; `959, 961, 968, 980` on p. 21; `1014, 1031` on p. 22, `1046` on p. 23); 0.8a (`wittenberg_albanese lines 1030–1045`, p. 26). All locators agree with the page markers. R01 came out of the comparison of 5.6 with `pop_eei2 line 709`.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.2; `IsGeometricPrimeDivisor` | `ℤ_(p) ⊂ ℚ`; `t`-adic ring of `ℚ(t)`; arc valuation on `ℚ(s,t)`; `O = K` | `δ(𝔽_p) + 1 = 1 = δ(ℚ)` but characteristics `p ≠ 0`; `1 + 1 = 2`; residue `ℚ`, `1 + 1 ≠ 3`; a field is no discrete valuation ring | prime not geometric; geometric; excluded; excluded |
| 0.2, Abhyankar bound | mixed characteristic, `K/ℚ` of transcendence degree `r` | `trdeg(Kv/𝔽_p) + rr(vK/vℚ) ≤ r`, so `δ(Kv) ≤ r = δ(K) − 1`; equality forces `vK/ℤ` finite, `vK ≅ ℤ` | holds, equality gives a discrete valuation ring |
| 0.3 | failed fibre `K`; false guard | `K` would enter a universal quantifier over fibres; `∅` contains neither `0` nor `1` | Checks true |
| 0.6(c), number-field case | `n ≥ r + 2`, `m = 2` | `b₁·⟨⟨a₁, …, a_n, b₂/b₁⟩⟩` is an `(n + 1)`-fold Pfister form, `n + 1 ≥ r + 3 > cd₂(K) = r + 2` | isotropic |
| 0.6(d) | degree `n`, primitive `x⃗_j` | `v(π^j q(x⃗_j)) ≡ j mod n`, `j = 0, …, n − 1` | values distinct |
| 0.8, both directions | `δ(K) = m ≠ n` | `m > n`: an anisotropic `m`-slot form has an anisotropic `(n + 1)`-slot subform; `m < n`: `n ≥ r + ε` | `σ_n` fails in both cases |
| 0.8, route (R02) | `𝔽₉(t)`, point of degree two | `𝔽₉ˣ` = tenth powers in `𝔽₈₁ˣ`, all squares | no constant `b`; finding |
| 0.10(e); `exists_sentence_charZero` | `ℚ`; char `p` odd; char `2`; `Z = ∅` | `ℤ ≠ 2ℤ`; `s = 2·((p+1)/2)s`, so `Z = 2Z`; `2 = 0`; `∅ = 2∅` | true in `ℚ`, false in every field of positive characteristic, finitely generated or not |
| 0.10(d) | members that are fields with `δ = 1` | characteristic zero: subfields of `κ`, and `κ` is one; characteristic `p`: global function fields, the number-field sentence fails | union `κ`, resp. `∅` |
| 0.11 Checks | `y² + xy = x³ + 1` and `y² + y = x³` over `𝔽₂` | points `1 + 2 + 1 = 4`, trace `−1`; points `2 + 0 + 1 = 3`, trace `0`; `2·4 = 8`, `3·4 = 12` | ordinary; supersingular; counts true |
| 0.12 example | `𝔽₅`, `y² = x³ + x + 1`, `c = 2`, `P₀ = (2, 1)` | values `1, 3, 1, 1, 4` at `x = 0, …, 4`: `2 + 0 + 2 + 2 + 2 + 1 = 9`, trace `−3`; `z(P₀) = 1/2 = 3`, `b = 6 = 1`, `∂(s² − b)/∂s = 2` at `s = 1` | Checks true |
| 0.12(b), corrected test | odd characteristic, `σP = −P` | `x(P) ∈ K`, `y(P) ∈ y_u K`, so `z(P) ∈ y_u K` and `(y_u K + y_u K) ∩ K = {0}`; `ord_O z = −3 + 2 = −1`, `ord_O x = −2` | sums must be taken in `K_u`; slot from `z` |
| 0.12(d) | `L ∈ 𝓛(K)`; maximal kept fibre `F` | `L(ζ₃) ∩ K = L` (`K/L` regular); closure of `F` is a kept fibre containing `F` | members are exactly `𝓛(K)` |
| 0.14(b); `exists_formula_not_algebraicIndependent` | `n = 0`; `n = 1`; finite `K`; `t₁ ∉ κ` | empty family independent, formula false; `t₁ ∈ κ`; `t₁ ∈ κ = K`; closure of `κ(t₁)` is a member | both directions hold |
| 1.1 Check | `(−1, −1)` over `ℚ(√5)` | invariants `1/2` at two real places; at the inert `2`: `2·(1/2) = 0` | not detected at finite places |
| 1.3 Check | `F = 𝔽₃(t, b³)`, henselization of `F ∩ 𝔽₃[[t]]` | `[F(b) : F] = 3` purely inseparable, `b` in the completion, not in a separable extension of `F` | henselian, finite residue field, not excellent |
| 1.4 | `d = 0`; `d = 4` with `X = ℙ⁴` | `H¹(𝔽_q) = ℤ/2 ≠ 0`, empty sum; `a = 4 ≤ 4` | `d ≥ 1` needed; unconditional for a given model |
| 2.1 Check | `(21, −1)`, `(7/3, −1)` over `ℚ` | `21 ≡ 1 mod 4`, a norm from `ℚ₂(i)`; `v₃(7/3) = −1`, odd, no norm from unramified `ℚ₃(i)` | nice; not nice |
| 2.2 Checks | `ℚ₃`, `a₀ = −1`, `a₁ = 3, 2`; `𝔽₂((t))`, `a₀ = 1` | `v₃(3)` odd; `2 = 1 + 1`; `X² + X + 1` irreducible over `𝔽₂` | anisotropic; isotropic; anisotropic |
| 2.4 example | `a₀ = 3`, `a₁ = 145` | `145 = 5·29 = 2·72 + 1`; squares mod `5` are `1, 4`; `3·145 = 435` | nice, anisotropic over `ℚ₅ ⊇ ℚ(i)` |
| 2.5 | `𝔽_p(s, t, r)`, `r`-adic; counts | basis `(s, t^p)`: `[𝔽_p(s,t) : 𝔽_p(s, t^p)] = p`, inseparable; `d − 2` parameters in both characteristics | separating basis needed |
| 3.3 | `τ = 0`; `a_d/θ² = −1/4` over `ℚ`; `t` over `𝔽₂(t)` | `X² − X` splits; `(X − 1/2)²`; `X² + X + t` irreducible, derivative `1` | root field `K`, `ℚ`, quadratic |
| 3.4, 3.5 | pole of `u_i`; `w̃(a_d) < 2w̃(θ_N)` | `u_i²(1 − 1/u_i − ε_i/u_i²)`; `(α_Nθ_N)²(1 − 1/α_N) = θ_N²(α_N² − α_N) = a_d` | square times principal unit in both |
| 3.7 | `𝔭 = {x : w(a_d) ≤ N w(x) for some N}` | `xy ∈ 𝔭` gives `w(a_d) ≤ 2N max(w(x), w(y))`; `a_d ∈ 𝔭` with `N = 1`; `a_i ∉ 𝔭` | prime ideal, as stated |
| 4.1 | isotropic `q_a`; `θ = 0` | no `θ` passes, `b_a = ∅`; outside the quantifier | Checks true |
| 4.6 | `β² − β = τ²/a_d`; restriction to `K` | `(a_dβ/τ)²(1 − 1/β) = a_d`; `e·w(a_d)` odd forces `e = 1` | identity holds, `w ∈ V_a` |
| 4.7 Check | `ℤ ∪ ℤ√2 ⊂ ℚ(√2)` | `√2·ℤ ⊆ ℤ√2`, `√2·ℤ√2 = 2ℤ ⊆ ℤ` | `√2` stabilizes the union, not `ℤ` |
| 5.1 | `⟨1, −3, −5, 15⟩`; `a₀ = a₁ = −1` | `(5, 3)₂ = (−1)^{2·1} = 1`, `(5/3) = (2/3) = −1`; preordering generated by `1, 1` is the sums of squares, `−1` not in it | isotropic at `2`, anisotropic at `3`; rejected |
| 5.2 | `O_P ∩ O_Q`; `K`; zero slot | orders `(−1, 1)`: neither `x` nor `1/x`; omits nothing; guard fails | all three fibres empty |
| 5.5 | `x ∗ 1`, `x ∘ 2`; `𝔽₂(t)`, `n = 3`, `δ = t` | `x + 1 − 1 = x`, `(x − 1)·1 + 1 = x`; `c_n = 3`, `v_t(3) = 0` | neutral elements `1`, `2`; condition `v_t(β − 1) > 0` |
| 5.6(c) (R01) | `𝔽₅(s)`, `P: s = 0`, `Q: s = 1`, `x = s` | `b = s`: `a = 0`; `b′ = 2s`: `a(Q) = −1/3 = 3` | orders do not suffice; finding |
| 5.7; `exists_formula_isGeometricPrimeDivisor` | `d = 0`; `ℚ`; `𝔽_q(t)`; `d = 2`, `k₁` with `K/k₁` not smooth | no discrete valuation ring; residue characteristic `p ≠ 0`; all places; a proper valuation ring containing `k₁` is a place of `K/k₁`, geometric | empty failed fibres hold for every member `k₁` |
| 6.7 | `f = (s + 2)/3` | `ḡ(2) = 4 = 1` in `𝔽₃`; lift `−1`; `g(−1) = 1`; value of `f` is `−1` | excluded |
| 6.9; `exists_formula_arithmeticNormalization` | `(d, e) = (0, 0)`, `𝔽₄`; `(1, 0)`, `ℚ`; `(1, 1)`, `𝔽₂(t)`, `T = (t²)`; mismatched `e` | closure of `∅` is `𝔽₂`, all of `𝔽₄` integral; `ℤ`; `X² − t²`, ring `𝔽₂[t]`; no basis of that length | agrees with `R_T` |
| 8.3, 8.4; `…_of_isDomain` | `S` zero ring; `ℤ/4`; `𝔽₄`, `𝔽₂` | fails `0 ≠ 1`; `2·2 = 0`; cardinalities `4`, `2` | only `𝔽_q` realizes `θ_q` |
| 8.5; `exists_sentence_realize_iff_nonempty_ringEquiv` | `K = 𝔽₄`; `K = ℚ` vs `ℚ(i)`, `ℚ(t)` | `θ₄`; not isomorphic as fields | `L` carries only `Field.FG` |
| Gap route (line 104) | `𝔽₂`, `ℙ²`, `C: x² + xy + y²`, `f = y` | `(x/y)|_C = ω`, algebraic, excluded; `(z/y)|_C` transcendental, chosen | holds |

### Lean acceptance test

- `lake env lean` on `packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean`, run from the content checkout: exit 0; the only output is eight "declaration uses `sorry`" warnings (lines 54, 62, 73, 81, 93, 113, 128, 139). The import header is the single `import Mathlib`.
- `#check @name` for all ten declarations in one scratch copy, elaborated once: every type agrees with the worker's elaborated signatures and with its README statement (§§0.1, 0.2, 0.8, 0.10(e), 0.13, 0.14(b), 5.7, 6.9, 8.4, 8.5); no binder lost; nothing changed.
- One-tactic probe on all eight sorried theorems in a scratch copy: each of `simp`, `rfl`, `infer_instance`, `trivial`, `exact?`, `aesop`, followed by `done`, under `fail_if_success`: all 48 failed to close (exit 0). No padding: no declaration restates a definition, mirrors a Check, computes a value or treats a boundary case.
- Headlines of the Summary: uniform geometric prime divisors (stated), finite normalizations (stated), bi-interpretability with ℤ (named in the docstring as not statable: no interpretation carrier under `Mathlib/ModelTheory` at the pin), the single sentence (stated for fields and for domains), the Layer 0 results of Pop and Poonen (four stated), the characteristic-two cases above dimension three (named in the docstring). The local–global principles of Layer 1 are inputs of the divisor theorem, not end theorems, and are not statable at the pins either (henselizations of valued fields come from LocalFieldsRamificationPartII). All ten Lean names occur in the README and every backticked name the README attributes to this roadmap is one of the ten.

### Pinned declarations opened

Mathlib: `FirstOrder.Ring.CompatibleRing` and `compatibleRingOfRing` (`Mathlib/ModelTheory/Algebra/Ring/Basic.lean:156, 223`), `Set.Definable` (`Mathlib/ModelTheory/Definability.lean:54`), `IsTranscendenceBasis` (`Mathlib/RingTheory/AlgebraicIndependent/Defs.lean:173`), `algebraicClosure` (`Mathlib/FieldTheory/AlgebraicClosure.lean:39`), `ValuationSubring.ofPrime` (`Mathlib/RingTheory/Valuation/ValuationSubring.lean:298`), `LocalSubring.exists_le_valuationSubring` (`Mathlib/RingTheory/Valuation/LocalSubring.lean:117`), `QuadraticMap.Anisotropic` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054`), `HenselianLocalRing` (`Mathlib/RingTheory/Henselian.lean:95`), `FiniteField.ringEquivOfCardEq` (`Mathlib/FieldTheory/Finite/GaloisField.lean`); `Field.FG` and `Algebra.trdeg` through the elaboration. Tau Ceti: `patchTopology` (`TauCeti/AlgebraicGeometry/AdicSpace/PatchPresentation.lean:96`, `namespace TauCeti.ValuationSpectrum`, with the compactness and clopen statements of its header); `Place`, `integers`, `ord` (`TauCeti/FieldTheory/FunctionField/Place/Basic.lean:103, 132, 145`); `exists_ne_zero_forall_mem_ord_eq` and `exists_forall_mem_valuation_sub_le` (`…/Place/Approximation.lean:145, 130`); `exists_ord_eq_neg_and_forall_ne_ord_nonneg` (`…/Consequences/HighDegree.lean:247`: `IsFunctionField`, `IsIntegrallyClosedIn k F`, `2g ≤ n`, as the contract says); `exists_forall_mem_valuation_sub_le_and_forall_mem_integers` (`…/Consequences/StrongApproximation.lean:88`); `Scheme.Hom.exists_finite_isSeparable_comp_eq` (`TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean`); `AbelianVariety.IsAlbanese` (`TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean`).

### Duplication, suppliers and merge order

- The five names the citation resolver listed are supplier-planned names, found at the suppliers' heads: `ModuliDescent.polarizedDescentComparison` (AlgebraicModuliForArithmeticGeometry README line 1832), `arithmetic_normalization_genericallyEtale` and `ArithmeticCoefficients.valuation_prolongation_integrality` (lines 9281, 9291), `NaturalIntegration.properAlbanese_exists` (ColemanIntegrationPartII line 637), `SieveLangWeil.lang_weil_uniform` (SieveMethodsAndPrimePatterns §5.4, resolved by the previous round, unchanged).
- Suppliers and the merge order: every roadmap named is on main (AlgebraicCurves, AnalyticNumberTheoryPartI, ClassFieldTheory, EllipticCurves, GlobalQuadraticForms, JacobianChallenge, SchemeAndStackFoundations; Chebotarev, GlobalNumberFields, RealAlgebraicGeometry under `Completed/`) or earlier in the order (lines 35, 42, 58, 62, 67, 69, 73, 75, 91, 92, 126, 234, 324, 355, 388, 389, 391; this roadmap is line 392). None is on the never-cite list.
- Ownership by object, searched on main and at the open heads: no other `Suggested.lean` declares `IsGeometricPrimeDivisor` or any of the eight theorem names; Kerz–Saito's principle, Rumely's definitions, nice Pfister forms, the Albanese torsor and the cyclic Hasse norm theorem for function fields occur in no other roadmap as targets (ClassFieldTheory Layer 13 is the number-field theorem). AlgebraicModuliForArithmeticGeometry §7.5 states the normalization and prolongation lemmas this roadmap imports, with the same Dittmann–Pop locators: imported here, not restated. `kroneckerDimension` is declared by QuadraticFormInvariantsPartII in its own namespace (its `Suggested.lean` line 310); this package says in its scope that it restates that notion, and the fully qualified names differ.
- Gaps: the four slugs agree between `design/plan.json` and the README's contracts; each names an earlier supplier and its section, is one precise statement with its hypotheses, and asks for what nobody provides.
- Overlap facts: no other pull request changes this roadmap, no cited id is dropped, none is defined only by a revision.
- Remark, no change here: AdicCoefficientsAndComparisonsPartII names "LogicAndDefinabilityInNumberTheoryPartII §2.1" as the consumer of its §PA.6.10; the consumer is §3.1.
- Remark, no change here: the `stacks` manifest entry keeps the fetch record of the Varieties chapter; its locator names the three chapters read.

Dependency check:

```text
depcheck: 240 roadmaps, 2274 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Overlap check: read QuadraticFormInvariantsPartII, AdicCoefficientsAndComparisonsPartII, LogicAndDefinabilityInNumberTheory, LocalFieldsRamificationPartII, MotivesAndAlgebraicCycles; one object shared: the Kronecker dimension, owner QuadraticFormInvariantsPartII §5.7 (restated here on pinned carriers and cited); Jannsen's `ℤ/2` principle and the dimension theorem are QuadraticFormInvariantsPartII §§6.3, 6.5 and are cited; nothing else shared.

### Copyright, licences and scope

Wording: 22 passages set beside the sources (the 15 sampled statements; the routes of 0.10(b), 4.6, 4.7 and 6.7; the definitions of 5.5; the repaired sentences of 1.4 and 1.5 against the Stacks introduction). The longest shared runs are short and forced: "has finitely many singular points" (5 words, Resolution of Surfaces chapter line 35) and one-line theorem statements. The route of 0.10(b) lists the ingredients of `poonen_uniform lines 176–185` in the order the argument forces, in a third of the length and in other words.

Arrangement: Dittmann–Pop has the largest share (57 of 111 parenthetical locators in the layers). Its sections are 1 Introduction, 2 local–global principles, 3 A/B/C, 4 uniform definability, 5 main theorem. The layers do not map onto them one to one: Layer 0 is Poonen, Rumely and Pop 2002; Layer 2 takes §3 B with the definition of §3 A; Layer 3 takes Proposition 3.4 of §3 A with §3 C; Layers 4 and 5 divide §4 and add Pop 2017; Layers 7–8 are mostly AKNS. The order is the one the *Needs:* lines force.

Reuse: no table, figure or list of examples is taken over. I know of no public formalisation that `Suggested.lean` resembles.

Source independence: 22 passages compared with 6 sources, none shared; largest share dittmann_pop, 57 of 111 locators; contents compared with dittmann_pop: independent.

## Not verifiable

- `kato_hasse`, `merkurjev_suslin`, `moret_bailly` and `lenstra_cm` are settled as uncertified; only the papers that quote them were read (`pop_eei2 lines 257, 279`, `poonen_uniform line 144`).
- `rumely`, `serre_albanese`, `waterhouse`, `cossart_piltant`, `achter_casalaina_vial` and `poonen_bertini` were not reopened this round; their locators stand on the earlier rounds' reading and on the papers that quote them (`poonen_uniform lines 120–125`, `dittmann_pop lines 678–680, 698`).
- The detection statement of 1.4 for `d ≤ 3` without `RS(𝔽₂)` rests on results Jannsen reports on p. 5 from other papers; the report was read, the proofs were not.
- Ownership against open pull requests was checked through the roadmap service's index and the board packages index; nothing outside them was checked.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, p. 9: the source says the sums of the coordinate function are taken in `K` and the form is tested over `K`; it should take them in the quadratic extension `K_u` and test there; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, p. 10: the source says `x` composed with a separable endomorphism has a simple pole at the point; it should use `z = y/x`, since `x` has a double pole; affects the proof.
- **Gap** in poonen_uniform at Proposition 4.10, p. 10: the source says keeping the fibres that are fields of Kronecker dimension one leaves exactly the relatively closed ones; it should also discard non-maximal fibres, or prove closedness; affects a stated result.
- **Misprint** in dittmann_pop at Proposition 3.10, proof of Claim 1, p. 12: the source says the unit factor is `1 − 1/u_i + ε_i/u_i²`; it should be `1 − 1/u_i − ε_i/u_i²`; affects nothing.
- **Misprint** in dittmann_pop at Notations/Remarks 4.1(2) and proof of Theorem 4.2, p. 14: the source says the divisor set is taken over `k_a`; it should be over `k_t`; affects nothing.
- **Misprint** in dittmann_pop at Proposition 5.1, Case 2, p. 16: the source says the composites `v ∘ w` are indexed by the rank-one family `W_T`; it should index them by the geometric prime `e`-divisors just defined; affects a stated result.
- **Gap** in dittmann_pop at proof of Lemma 5.3, p. 17: the source says the intersection lies in the geometric normalization "as above"; it should show that each pole-detecting divisor is refined by a flag with a terminal place keeping `T` integral; affects the proof.
- **Error** in akns at proof of Theorem 3.1, p. 23: the source says the finitely generated one-dimensional core is therefore Dedekind; it should first invert a conductor element, since the core of `ℤ[√5, t]` is `ℤ[√5]`; affects the proof.
- **Error** in pop_eei2 at Notation/Remarks 3.5, p. 2102, and Recipe 5.1, p. 2109: the source says the congruence threshold is twice the value of `2n`; it should use `n` in characteristic two, where `2n = 0` has infinite value; affects a stated result.
- **Misprint** in pop_eei2 at Recipe 5.1(4), p. 2109: the source says the ring is cut out of `U` by stability of `U` under both shifted operations; it should stabilize `X₀` under the shifted product, as its Notation/Remarks 4.4(1) defines; affects nothing.

## For the human reviewers

- Licence: `achter_casalaina_vial` is recorded with venue Annales de l'Institut Fourier 76 (2026) and cited by arXiv v3 numbering; the published volume was not confirmed (`packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:1463`).
- Scope: two gaps of this roadmap rest on Poonen's Bertini theorem over finite fields, which no roadmap owns (`packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:104`); whether one supplier should state it once is a maintainer's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c04daae4f976351e304243e2e1350f4e0e85aea6", "job": "REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~8", "model": "fable", "worker": "chris-x80"} -->
