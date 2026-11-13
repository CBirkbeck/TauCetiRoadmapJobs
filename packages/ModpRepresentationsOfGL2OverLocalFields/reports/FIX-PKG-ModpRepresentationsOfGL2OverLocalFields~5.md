# FIX-PKG-ModpRepresentationsOfGL2OverLocalFields~5

Repair of the two findings of `REV-PKG-ModpRepresentationsOfGL2OverLocalFields~4`. Files changed:
`packages/ModpRepresentationsOfGL2OverLocalFields/README.md` and `.../sources.toml` (BP12 locator
and `cited_for` only; the fetched fields are untouched). `Suggested.lean`, `metadata.toml` and
`design/plan.json` are unchanged: no Lean statement depends on the changed text, and no new
supplier gap is needed.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~4/F01 (P2) — applied

Verified (CDN23 lines 478, 726, 729; witness recomputed). §1.2 old: graded pieces are quotients of
`I(σ_i)`. New: quotients of `c-Ind_K^{G′} W_i`, `W_i` irreducible `k[K]`-modules (split by §0.6),
Serre weights over `k` exactly when `k` contains the image of `k_F` (always for `ℚ_p`). Irreducible
Check amended; `ℚ_{25}`/`𝔽₅` negative control added. Same pattern repaired in §§1.3, 2.3, 2.4, 0.5.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~4/F02 (P3) — applied

Verified (BP12 line 3302, Proposition 14.7; lines 3670–3676, §16 (iii)). §3.5 third Check old:
`H`-characters of `D₁` are those of all constituents' invariant lines. New: `p = 17`, `r₀ = 5`
irreducible example, `dim D₁ = 2`, socle characters `(5,0)`, `(0,5)` (values 5, 1 at `diag(3,1)`);
cosocle characters (6, 13) do not lift.

## Notes on the repairs

**F01, pattern repair.** I searched the whole README for the same construction, an irreducible
`k[K]`-module over a general finite `k` treated as an absolute Serre weight:

- Layer 1 preamble: one sentence added. The Serre weights `Sym^r ⊗ det^s` of `GL₂(𝔽_p)`
  (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15) are defined over `𝔽_p ⊆ k`. So for
  `F = ℚ_p` the irreducible smooth `k[K]`-modules are exactly the Serre weights defined over `k`.
  This is why §§1.1, 1.3, 1.5 and 1.6 and the gap `ext1-finite-length-into-compact-induction` (all
  for `ℚ_p`) can keep the split form.
- §1.3 route: now says that for `F = ℚ_p` the `W_i` of §1.2 are Serre weights `σ_i` over `k`.
- §2.3, last clause: "an irreducible `KZ`-weight" became "a Serre weight defined over `k`
  (absolutely irreducible with central character, as in the admissible form of §0.8)". The route
  of this clause uses §0.8's admissible form, which is stated for absolutely irreducible `σ`.
  HU12 works with weights over `F̄_p`, so this is the source's own generality after descent.
  VIGNERAS11 line 754 reaches the general case by a finite extension of scalars. One sentence now
  sends a non-absolutely-irreducible `k`-form to that extension, which §2.4 performs.
- §2.4 route: the old wording was "extend scalars so that a generating `KZ`-module has a
  central-character composition series". It now extends scalars to a finite field containing the
  image of `k_F` and the eigenvalues of `ϖ`, so that the composition factors are Serre weights
  over that field (§1.2). §1.2 is added to its *Needs*. Without the image of `k_F` the factors can
  have a central character and still not be absolutely irreducible. Example: `k_F = 𝔽₂₅`,
  `k = 𝔽₅`, `det^3` through `σ_0`. The scalars act by `z^6 ∈ 𝔽₅^×`, but `det^3 ≠ det^{15}`.
- §0.5 Check: "`σ` a Serre weight" became "a Serre weight defined over `k`", with freeness used
  over `k̄[T]` after extending scalars, because `c-Ind σ` must be a `k`-representation.
- Unchanged: §0.8 already says "an absolutely irreducible `W`". §1.1 and the `ℚ_p` gap are for
  `F = ℚ_p`. The §0.4 and §2.4 Checks do not depend on the coefficient field of `σ`.

**F01, the split clause.** The §1.2 statement adds a "Prove that" clause: if `k` contains the image
of an embedding `k_F → k̄`, every irreducible smooth `k[K]`-module is absolutely irreducible. The
proof:

- §0.6 (CDN23 Lemme 1.7) gives `W ⊗ k̄ = ⊕_{k_i → k̄}` of pairwise nonisomorphic absolutely
  irreducible modules, permuted transitively by `Gal(k̄/k)`.
- The absolutely irreducible modules (BP12, equation (2), pp. 13–14) are tensor products of
  Frobenius twists of `Sym^{r_j}` through the embeddings, times `η∘det` with `η` a character of
  `k_F^×`. Their matrix entries and the values of `η` lie in the image of `k_F`, so each is fixed
  by `Gal(k̄/k)`.
- Pairwise nonisomorphic Galois-conjugate summands that are all Galois-fixed force `[k_i : k] = 1`.

The converse also holds: if `k` does not contain the image of `k_F`, then `det` through `σ_0` is
not defined over `k`. The reviewer's example is this case. The heading number §1.2 is unchanged.
Its title became "A filtration by compact inductions of irreducible K-modules". No roadmap on main
or at an open head cites the old heading or an id for §1.2 (`roadmaps grep` for
`serre-weight-induction`, `filtration-by-serre`, `serre-filtration`, `MP.1/`: only `MP.1/central-ext`
is cited, by ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, and it maps to §1.4, which is
unchanged).

**F02.** No other passage identifies `D₁(ρ̄)` with invariants of the semisimplification. §7.3 and
§7.6 use `JH(D₁(ρ̄))` of the actual module. §4's `W_{χ,2}` character list is about a different
module. The new Check pins the convention for `χ_λ`: the invariant line is spanned by `x^r`, on
which `diag(a,d)` acts by `a^{r+b}d^b`. This agrees with the Conventions'
`α_i(diag(a,d)) = σ_i(a/d)` for `λ = α = (1,−1)`.

## Checks run

- **Elaboration**: `lake env lean packages/ModpRepresentationsOfGL2OverLocalFields/Suggested.lean`
  from the content checkout. Exit 0, seven warnings, all "declaration uses `sorry`", at lines
  104, 121, 133, 151, 166, 180 and 202. There are no `TauCeti.*` imports, so no module build was
  needed. The file is unchanged this round.
- **Signatures**: a scratch copy with `#check @name` for all twelve declarations (`IsSmoothRep`,
  `IsTorsionAdmissible`, `IsFinitelyPresented`, `smoothDualSpan`, `GL2ModScalar` and the seven
  theorems) elaborated with exit 0. Its output is identical, line for line, to the pre-round
  elaborated signatures (0 differing lines). No binder is lost and nothing changed. The README
  statements of the seven theorems are unchanged, and the Lean generality still matches:
  `isFinitelyPresented_of_finite` holds over every finite `k` for `GL₂(ℚ_p)/p^ℤ`, which is the
  split case of the new §1.2.
- **Dependency direction** (full output):

  ```text
  depcheck: 237 roadmaps, 2151 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations**: `roadmaps resolve` on the README found no cross-roadmap citations and no Lean
  names "found nowhere".
- **Sources**: every locator I added was read in the cached texts: CDN23 lines 478, 717–730; BP12
  lines 479–486 (eq. (2), pp. 13–14), 3302–3304 (Proposition 14.7, p. 83), 3655–3676 (§16, p. 92);
  VIGNERAS11 lines 697–758; HU12 lines 171, 294–299 (coefficients `F̄_p`). In `sources.toml` the
  BP12 locator now also lists "Proposition 14.7 (p. 83); §16, case (iii) (p. 92)", and its
  `cited_for` is "Layers 1, 3, 5". No new work was cited and nothing was requested. There is no
  `needs-references.toml`.
- **Ownership**: no new construction was introduced. §1.2 is the existing target, restated at its
  correct generality. The supplier citations (R07.5.15, §0.6) are unchanged and resolve. Ownership
  against open roadmap pull requests was checked with `roadmaps grep` for consumers of §1.2 (none).

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §1.2 general form (all `F`, all finite `k`) | `V = 0`; `V = I(σ)`; trivial character for `F = ℚ_p`, `k = 𝔽_p`; reviewer's `F = ℚ_{25}`, `k = 𝔽₅`, `V = 𝔽₂₅` via `ac∘det` | `r = 0`; one step (identity); one step with `W = Sym^0`; one step with `W = V|_K`, `dim_k W = 2`, `End_K W = 𝔽₂₅` | Holds in all four; the old split statement fails on the fourth (`Hom_{G′}(I(σ),V) = 0` for every `σ` over `𝔽₅`). Restated |
| Witness arithmetic | `t² = 2` in `𝔽₅`; matrix of `diag(t̃,1)`; Frobenius | squares in `𝔽₅` are `0,1,4`, so `X² − 2` has no root; matrix `(0 2; 1 0)`; `t⁵ = t·(t²)² = 4t = −t ≠ t` | `V|_K` irreducible, not absolutely; `V ⊗ 𝔽₂₅ = χ ⊕ χ⁵`, dimensions `2` against `1 + 1`. Added as negative control |
| Witness descends to `G′` | scalar `5`; `K₁`-action | `det(5·I₂) = 25`, `ac(25) = 1`; `det(1 + ϖM₂(𝒪_F)) ⊆ 1 + 5𝒪_F`, residue `1` | Smooth `k[G′]`-module ✓ |
| §1.2 "iff", converse direction | `c-Ind_K^{G′} W_i` | `W_i` irreducible smooth, so finite-dimensional (finite `K`-orbit of one vector); compact induction of finite type; §0.4 closure | Holds ✓ |
| §1.2 split clause | `p = 2`: `GL₂(𝔽₂) = S₃`, `k = 𝔽₂`; `p = 3`: `GL₂(𝔽₃)`; `F = ℚ₄`, `k = 𝔽₂`; ramified `F = ℚ_p(√p)` | `S₃`: irreducibles `Sym^0` and `Sym^1` over `𝔽₂`, count `2 = p(p−1)`; `GL₂(𝔽₃)`: `Sym^r ⊗ det^a`, `r ≤ 2`, `a ≤ 1`, count `6 = p(p−1)`; `ℚ₄`: `Sym^1` through `σ_0` and `det^{(0)}` (order 3) not over `𝔽₂`; `k_F = 𝔽_p ⊆ k` | Split for `ℚ_p` and ramified `F`; fails for `ℚ₄` over `𝔽₂`, as the hypothesis predicts |
| Count of `p`-regular classes of `GL₂(𝔽_p)` (Layer 1 preamble) | general `p` | central `p−1`, split `(p−1)(p−2)/2`, nonsplit `p(p−1)/2`; total `p(p−1)` = number of `Sym^r ⊗ det^a` | All irreducibles over `k̄` are defined over `𝔽_p` ✓ |
| `c-Ind_K^{G′} W = c-Ind_{KZ}^G W` with `ϖ` trivial | general `F` | `Z = 𝒪_F^× · ϖ^ℤ`, `K ∩ ϖ^ℤ = 1`, so `KZ/ϖ^ℤ ≅ K`; `(ϖ·f)(g) = f(ϖg) = f(g)` | Identity holds ✓ |
| §2.3 last clause (absolutely irreducible `σ`) | trivial character with `W = k`; `c-Ind σ` itself; reviewer's `k`-form | `Δ = k` (dim 1); `Δ = 0`, infinite length (Check unchanged); `k`-form not covered, but after `⊗ 𝔽₂₅` the factors are the characters `χ`, `χ⁵`, each covered, and `V` has length 1 | Consistent with §1.2 and §0.8; matches HU12's coefficient setting |
| §2.4 extension of scalars | `k_F = 𝔽₂₅`, `k = 𝔽₅`, `det^3` through `σ_0` | scalars act by `z^6`, of order dividing 4, so in `𝔽₅^×`; `det^3 ≠ det^{15}` since `z^{12} ≠ 1` for a generator | Central character alone does not split; requiring the image of `k_F` does |
| §2.4 extension on the witness | `V = 𝔽₂₅`, generating `W = V|_{KZ}` | `ϖ` acts by `ac(ϖ²) = 1`, eigenvalue `1`; over `𝔽₂₅` the factors are `χ|_{KZ}`, `χ⁵|_{KZ}` | Each factor is a Serre weight over `𝔽₂₅` ✓ |
| §0.5 Check (Serre weight over `k`) | trivial weight, general `F` | `c-Ind σ ⊗ k̄` is free over `k̄[T]` (R07.5.15), so `T` has no kernel on `c-Ind σ` | Holds ✓ |
| §3.5 new Check: parameter | `f = 1`, `p = 17`, `s = −1`, `μ = (6,0)` | `a_0 = (6,0)`, `a_1 = s(6,0) = (0,6)`; characters `ω₂^{6+17·0} = ω₂^6`, `ω₂^{0+17·6} = ω₂^{102}`; 1-deep: `1 < 6 < 16` | `ρ̄` irreducible tame ✓ |
| §3.5 new Check: `W(ρ̄)` | `ω ∈ {0, −η_0}` | `t_{(5,0)}(0) = (5,0)` gives `Sym^5`; `t_{(5,0)}(−1) = (0,−11)` gives `Sym^{11} ⊗ det^5` (§3.2 Check) | Matches the BP12 §16 (iii) socle `Sym^{r₀} ⊕ Sym^{p−1−r₀} ⊗ det^{r₀}` ✓ |
| §3.5 new Check: dimensions | BP12 §16 (iii), `r₀ = 5` | `6 + 10 + 12 + 4 = 32`; `dim D₁ = 3^1 − 1 = 2` (Proposition 14.7) = socle invariant lines | `D₁` = socle invariants ✓ |
| §3.5 new Check: characters | exponents `(r+b, b)` mod 16; `3` a primitive root mod 17 (`3^8 ≡ −1`) | `Sym^5`: `(5,0)`, `3^5 ≡ 5`; `Sym^{11}⊗det^5`: `(0,5)`, `3^0 = 1`; `Sym^9⊗det^6`: `(15,6)`, `3^{15} ≡ 6`; `Sym^3⊗det`: `(4,1)`, `3^4 ≡ 13` | Four distinct values; `D₁` has `{5, 1}` only; the old Check would add `6, 13`. Replaced |
| §3.5 new Check against the rest of Layer 3 | API "semisimple `H`-module"; BP12's pairing `{χ, χ^s}`; §7.3 depth | two characters; `(5,0)^s = (0,5)`; `μ − η = (5,0)` is 5-deep, not 6-deep | Consistent; §7.3 does not apply to this example, so there is no conflict |
| Convention for `χ_λ` | `λ = α = (1,−1)` | `x^r` convention gives `a^1 d^{−1}`, matching `α(diag(a,d)) = a/d` in the Conventions | Agrees ✓ |

## For the maintainer

- No Lean name changed, and no name that other roadmaps cite changed. Only the §1.2 heading title
  changed; its number did not, and nothing cites it.
- §1.2 is now a general-coefficient statement with a split clause. Consumers that need absolute
  Serre weights for `F ≠ ℚ_p` must take `k` containing the image of `k_F` (Layers 3–9 already
  assume this) or extend scalars as §2.4 does.
- The review contains no instruction-like or suspicious passage.
