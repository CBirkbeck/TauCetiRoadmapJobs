# FIX-PKG-ZagierConjecturePolylogarithms~11

This round fixes the one finding of `REV-PKG-ZagierConjecturePolylogarithms~10`. Every edit is in `packages/ZagierConjecturePolylogarithms/README.md`. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-ZagierConjecturePolylogarithms~10/F01 (P3) — applied

Old §3.8: the domain excludes `b₀ = b₁` in weight one, but the cut formula (66) on words with repeated letters produces such factors, and §3.13 gives one a value. New §3.8: such a factor is the image of the pure word `⟨X_b,X_b⟩`. That word is zero in `CLie_S`, so `Cor_{a,v}(b,b) = 0`, and for `a = ∞` this is `u(0) = 0`. §3.8 also gains an API clause, a Check clause and a cancellation Check.

### Verification

- **Source.** GR (64)–(66) is at GR lines 1202–1219, p. 28. It allows coinciding `bᵢ` and states the cut formula with no rule for a weight-one factor on two equal points. The roadmap's own §3.4 divides `CLie_S` by the pure words, and §3.5 shows that `⟨X_s,X_s⟩` pairs to zero with every special derivation (`X_s ↦ [X_s,2X_s] = 0`). The correlator of §3.8 is defined by dualizing through §3.5, so the image of that class is zero. The convention is a consequence of the definition, not a new choice.
- **The finding's instance.** I recomputed the eight cuts of `(0,0,1,y)`, with letters `v₁…v₄ = 0,0,1,y`:
  - four vanish by the first shuffle (`⟨0,0,1⟩` or `⟨y,0,0⟩`);
  - two carry the pure factor `⟨0,0⟩`;
  - one carries `⟨0,1⟩ = u(−1) = 0`;
  - the survivor is `⟨0,1,y⟩∧⟨y,0⟩ = Cor_∞(0,1,y)∧u(y)`.

  This agrees with §3.13.
- **A fact the review did not note.** The two cuts that carry a factor on an adjacent equal pair at the places `i, i+1` are `⟨vᵢ,vᵢ₊₁⟩∧W` and `W′∧⟨vᵢ,vᵢ₊₁⟩`, where `W` omits `vᵢ` and `W′` omits `vᵢ₊₁`. Since `vᵢ = vᵢ₊₁`, `W′` is a rotation of `W`, so the two cuts cancel whatever value the factor has. So no cobracket the README computes changes. Only the definition through `CLie_S` fixes the value. I added this as a Check of §3.8 because it is the discriminating test: a "regularized" nonzero value such as a tangent-vector unit is invisible to the cobracket.

### Departures from the review's wording

- I wrote the text in my own words.
- I placed it after the "Prove …" sentence so that the cut formula is introduced before the convention.
- "No correlator of weight one with equal arguments occurs otherwise" became "Outside the cut formula no weight-one correlator with equal arguments is used". A search confirms it: the only weight-one factors on equal letters in the README are in the cut computations of §3.13, at the `Cor_∞(0,0)` lines and at `u(y) − u(0)` in the double-symbol Check.
- I cite §§3.9–3.10 for the missing Hodge value, because §3.9 defines `Cor^H`.

### Pattern repaired elsewhere

- **§3.9, period comparison.** It was stated "for every cyclic word `x` of weight `m` with complex entries". At `m = 1` with equal entries the left side is `(2πi)^{−1}log 0`, which is undefined, while `Cor^Hod(z,z)` is the image of the zero class. So the target and its API bullet now say the two entries are distinct when `m = 1`.
  - No other restriction is needed. For `m ≥ 2` with all entries equal, every plane trivalent tree has a vertex with two leaves, so two edge functions coincide and the integrand `f₀ d^C f₁∧…` vanishes identically. Then `Cor^H = 0 = p(0)`, the word being pure and killed by shuffles.
  - Partial collisions for `m ≥ 2` are §3.10's domain and are unchanged.
- **§3.13.** The Check "the two with the pure factor `Cor_∞(0,0) = u(0) = 0`" now points to §3.8.
- **No change needed.** §3.11 (`Cor_b(a,…,a)` has `ℓ ≥ 3` letters, weight at least two), §3.12 (weight at least three) and the double-symbol Check of §3.13 (its `u(0)` term is the same pure cut, `0` by the Conventions) need nothing.

## Adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §3.8 `Cor_{a,v}(b,b) = 0` (new) | `a = ∞`, `b = 0`; the definition through §3.5 | `Cor_∞(0,0) = u(0 − 0) = u(0) = 0` (Conventions); pairing of `⟨X_s,X_s⟩` with a derivation `X_s ↦ [X_s,u_s]` gives `[X_s,2X_s] = 0` | consistent with §§3.4–3.5 and the Conventions | new sentence |
| §3.8 cut formula on `(0,0,1,y)` | eight cuts, `j = 1,…,4`, first-factor lengths 2, 3 | shuffle zero: `j=1,L=2`; `j=2,L=3`; `j=3,L=3`; `j=4,L=2`. Pure `⟨0,0⟩`: `j=1,L=3`; `j=2,L=2`. `⟨0,1⟩`: `j=3,L=2`. Survivor: `⟨0,1,y⟩∧⟨y,0⟩` | `4+2+1+1 = 8`; `δ = Cor_∞(0,1,y)∧u(y) = δS₃(y)` | none (§3.13 now cites §3.8) |
| §3.8 cut formula on `(0,0,0,1,y)` | ten cuts of types `(1,3)` and `(3,1)` | pairs `P₁ = P₂ = (0,0)`, `P₃ = (0,1)`, `P₄ = (1,y)`, `P₅ = (y,0)`; shuffle zero: `P₄,P₅` of `(1,3)` and `P₃,P₄` of `(3,1)`; pure: `P₁,P₂` in both types; `u(−1)`: `P₃` of `(1,3)`; survivor: `P₅` of `(3,1)`, `Cor_∞(0,0,1,y)∧u(y)` | `4+4+1+1 = 10`, as §3.13 states | none |
| §3.8 cancellation Check (new) | `(0,0,1,y)` with `Cor_∞(0,0) = c ≠ 0`; `⟨b,b,c⟩`; `(0,0,0,1,y)` | `c∧Cor_∞(0,1,y) + Cor_∞(1,y,0)∧c = c∧A − c∧A = 0` with `A = Cor_∞(0,1,y) = Cor_∞(1,y,0)`; `⟨b,b⟩∧⟨b,c⟩ + ⟨b,c⟩∧⟨c,b⟩ + ⟨c,b⟩∧⟨b,b⟩ = 0 + 0` (two-letter words are symmetric); `P₁`: `W = ⟨0,0,1,y⟩`, `W′ = ⟨0,1,y,0⟩`, a rotation | cancels in every case | new Check |
| §3.13 double-symbol formula at `(0,0,1,y)` | `k = 1,…,4` with `u(0) = c` | `k=1`: `Cor_∞(0,0,1) = 0`; `k=2`: `A∧(u(y) − c)`; `k=3`: `A∧(c − u(−1)) = A∧c`; `k=4`: `Cor_∞(y,0,0) = 0` | total `A∧u(y)` for every `c`; with `c = 0`, only `k = 2` contributes, as stated | none |
| §3.9 comparison, weight one (changed) | `(z,z)`; `(0,1)`; `(0,2)` | `Cor^H(z,z) = (2πi)^{−1}log 0` undefined, against `p(0) = 0`; `(2πi)^{−1}log 1 = 0 = c₁(2πi)^{−1}·0`; `(2πi)^{−1}log 2 = c₁(2πi)^{−1}log 2` with `c₁ = 1` | holds off the diagonal only | "two entries distinct when `m = 1`" |
| §3.9 comparison, `m ≥ 2` on the full diagonal | `(0,0,0)`; `m ≥ 3` | `m = 2`: integrand `f d^C f∧d^C f = 0`, so `Cor^H = 0`; `2⟨X,X,X⟩ = 0`, so `p(Cor^Hod) = 0`. `m ≥ 3`: at least two vertices with two leaves, and some coinciding pair carries two `d^C`, so integrand `0` | both sides `0` | no restriction needed |
| Conventions `u(0) = 0` | against §1.2's `u₀ = u(0)` | §1.2's `u` is a unit of `K(t)` evaluated at `t = 0`, a different symbol in a different section | no clash in the changed text | none |

## Checks run

- **Elaboration.** `lake env lean packages/ZagierConjecturePolylogarithms/Suggested.lean`, run from the content checkout: exit 0. The only warnings are two `declaration uses sorry`, at 124:8 (`zagier_four_exists`) and 133:8 (`zagier_four_everyFamily`).
- **`#check @name`.** I put all ten declarations in one scratch copy of the file and elaborated it once. The elaborated types are identical to the job's elaborated signatures:
  - `[Field F]` is on `unitVector`, `trilogCyclic`, `TrilogRelationFunction` and `IsCycle4`;
  - `[AddCommGroup V] [Module ℚ V]` is on `TrilogRelationFunction`;
  - `[Field F] [NumberField F]` is on `periodMatrixFour`, `zagierDeterminantFour` and both theorems;
  - the hypothesis `∀ j, IsCycle4 (c j)` is on `zagier_four_everyFamily`.

  No binder was lost, each type agrees with README §6.4, and nothing changed.
- **Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 244 roadmaps, 2276 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve`): there are no cross-roadmap citations and no Lean names found nowhere.
- **Overlaps ledger:**
  - no other open pull request changes this roadmap;
  - no id this README cites is dropped;
  - no id comes only from an open revision.
- **Style scan of the changed lines:** there are no LaTeX delimiters, process words or paths. The only hit is the mathematical word "currents", in unchanged text.

## Gate failures

None were listed for this round.

## For the maintainer

- No section, target, layer or Lean name changed, so no other roadmap's citation is affected.
- No new object or construction was introduced. The convention follows from the existing §§3.4–3.5, so no ownership question arises, and ownership against open pull requests needed no new search.
- No source was added. `sources.toml` is unchanged and `needs-references.toml` was not written.
- The change is formal: the factor in question cancels in every cut formula, so no value elsewhere in the README moves.
