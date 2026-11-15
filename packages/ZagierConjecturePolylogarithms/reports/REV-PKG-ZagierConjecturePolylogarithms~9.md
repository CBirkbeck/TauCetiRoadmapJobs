<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6902592226 -->
Review (claude) of e34a243

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §5.8: the correcting cochain leaves the `R₇²` component in `Λ²B₂`, and its eight-point form has the wrong slot and sign

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:920` (§5.8): "Remove its `Λ²B₂` component by subtracting the coboundary of the double-symbol cochain `h = −(3/28)·Alt₈ D₃₁(r(3,4|2,5,6,7), r(6,7|1,3,4,5))` … The result has values in `Γ(F,4)`", and the Checks at `:924`–`:926`.

   **Claim.** One eight-point double-symbol element removes every `Λ²B₂` component of the cocycle, for every `N ≥ 4`.

   **Witness.** Three points, each computed.

   1. The `Λ²B₂` components of the map of §4.8 sit in degree two, on seven-vector configurations, and there are two of them: the wedge term of `R₇³` on `C₇(3)` and all of `R₇² = −(1/84)·Alt₇([r(1,2,3,4)]₂∧[r(1,5,6,7)]₂)` on `C₇(2)` (§4.6). For `N = 5` the first decorations of seven flags in `F⁵` give `t₀ ∈ C₇(5)` (§4.3), whose Gale dual lies in `C₇(2)`, so the cocycle has the component `R₇²` there. It is not zero: on two independent random configurations of eight vectors in `ℂ³`, with the form `(D∘σ₁)∧(D∘σ₂)` of §4.8, `R₇²∘p` takes the values `−9.488676` and `+23.260395`. The displayed `h` involves only cross-ratios projected from two vectors, so it does not touch `C₇(2)`; `Γ(F,4)` has no `Λ²B₂` in degree two, so for `N ≥ 5` the result does not have values in `Γ(F,4)` and the Check at `:926` fails.
   2. Slot. `h` is written as `Alt₈` of a function of eight vectors, the slot of the degree-one term `𝓛₄`, while the component to remove lives on seven vectors. A homotopy that removes it is a cochain on seven vectors.
   3. Sign of the eight-point element. By the rule of §4.8 (Checks), `(Alt₇ g)∘p = −Alt₈ g(8|·)`, so the `Λ²B₂` component of `δ_{G₄} = R₇³∘p` on eight vectors is `−(3/28)·(−1)·Alt₈ = +(3/28)·Alt₈([r(8,1|2,5,6,7)]₂∧[r(8,2|1,3,4,5)]₂)`. Under Gale duality in the supplier's normalization `(I,B) ↔ (−Bᵀ,I)` these arguments are exactly those printed: on a random rational `4×8` matrix, `r(8,1|2,5,6,7)` of the dual and `r(3,4|2,5,6,7)` of the original are both `51/40`, and `r(8,2|1,3,4,5)`, `r(6,7|1,3,4,5)` are both `2320/2761`. So the term the README calls "the `Λ²B₂` term `−(3/28)Alt₈(…)`" is `+(3/28)Alt₈(…)`; subtracting `−(3/28)Alt₈D₃₁(…)` from `𝓛₄` leaves `(3/28 + 3/28)Alt₈(…) ≠ 0`.

   **Exact repair.** In §5.8 replace the two sentences from "Remove its `Λ²B₂` component" to "The result has values in `Γ(F,4)`" by:

   > Remove the `Λ²B₂` components, which sit in degree two on seven-vector configurations, by a homotopy. Let `h` be the `L₄(F)`-valued cochain on the seven-vector terms of the dual complex obtained by writing `D₃₁(x,y)` for each wedge `[x]₂∧[y]₂` of §4.6: `h = −(3/28)·Alt₇ D₃₁(r(1|2,5,6,7), r(2|1,3,4,5))` on `C₇(3)`, `h = −(1/84)·Alt₇ D₃₁(r(1,2,3,4), r(1,5,6,7))` on `C₇(2)`, and `h = 0` on `C₇(1)`. Since `δ₂₂D₃₁(x,y) = [x]₂∧[y]₂`, `δ₂₂h` is the `Λ²B₂` component of `R₇³` on `C₇(3)` and is `R₇²` on `C₇(2)`. Subtract `δ∘h + h∘D` from the map. The degree-two components become `R₇³ − δh` and `R₇² − δh`, with values in `L₃(F)⊗U(F) = B₃(F)⊗U(F)` (§1.5). The degree-one components become `𝓛₄∘R₈⁴ − h∘p` on `C₈(4)`, `−h∘(∂ + p)` on `C₈(3)` and `−h∘∂` on `C₈(2)`; their `δ₂₂` vanish, by §5.7(i) on `C₈(4)` and by the identities `R₇³∂ + R₇²p = 0` and `R₇²∂ = 0` of §4.8 on the other two, so by §3.3 they lie in `B₄(F)`. The components in degrees three and four do not change. The result is a map of complexes with values in `Γ(F,4)`, chain homotopic to the original.

   Replace the sentence "The correcting element printed on p. 93 omits the coefficient `−3/28`; … so the coefficient is needed." by:

   > On `C₈(4)`, `h∘p = (3/28)·Alt₈ D₃₁(r(8,1|2,5,6,7), r(8,2|1,3,4,5))`, by `(Alt₇ g)∘p = −Alt₈ g(8|·)` (§4.8, Checks); in the labelling of the Gale-dual configuration its arguments are `r(3,4|2,5,6,7)` and `r(6,7|1,3,4,5)`. This is the element printed on p. 93 of the source, which gives it no coefficient and names no correction on `C₇(2)`; for `N ≥ 5` that component is present, since the first decorations of seven flags in `F⁵` lie in `C₇(5)`, dual to `C₇(2)`.

   Replace the first three Checks of §5.8 by:

   > - `δ₂₂` of `D₃₁(x,y)` is `[x]₂∧[y]₂` with coefficient one, so `δ₂₂h` is the wedge term of `R₇³` on `C₇(3)` and `R₇²` on `C₇(2)`, with the coefficients `−3/28` and `−1/84`; the coefficient `1` on `C₇(3)` would leave `−(1 + 3/28)` times the wedge.
   > - Both rows are needed. For `N = 5` seven flags give a configuration in `C₇(5)`, dual to `C₇(2)`, where the map is `R₇² ≠ 0`; a correction on `C₇(3)` alone leaves it, and `Γ(F,4)` has no `Λ²B₂` in degree two. For `N = 4` only `C₇(3)` occurs.
   > - The eight-point element has coefficient `+3/28`: `h∘p = −(3/28)·(−Alt₈) = (3/28)·Alt₈ D₃₁(…)`, and `δ₂₂(𝓛₄∘R₈⁴ − h∘p) = (3/28 − 3/28)·Alt₈(…) = 0`; with `−3/28` the two terms add. On `C₈(3)` the new degree-one term `−h∘(∂ + p)` has `δ₂₂ = −((3/28)X − (3/28)X) = 0`, with `X` as in §4.8.

   The fourth Check stays. §5.9 needs no change: Lemma 9.6 of the source is a statement about `δD₃₁(x,y)` for all `x, y`, so it covers both rows of `h`. §6.1's clause "change only the components in degrees one and two" stays true.

   **Tested on the instance.** `N = 5`, row `C₇(2)`: after the repair the component is `R₇² − δh`, with `Λ²B₂` part `R₇² − δ₂₂h = 0`. Row `C₈(3)`: the two `Λ²B₂` contributions computed numerically are `9.488675588471503` and `−9.488675588473136` (sum `−1.6·10⁻¹²`), and `−23.260395031454255`, `23.260395031454202` on a second pair of configurations.

2. **F02** (P3) four definition sections have no API list

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:445` (§3.5), `:832` (§5.4), `:869` (§5.6), `:918` (§5.8): each goes from its defining paragraph straight to `**Checks.**`.

   **Claim.** Every definition lists its API as bullets.

   **Witness.** Counted by script: 48 numbered sections, 20 without the sentence "has/have the following API"; 16 of them state theorems only. §3.5 defines special derivations, §5.4 the current regulator, §5.6 the map `a₃`, §5.8 the generic cocycle. Round 2 raised the same for §§3.9, 4.7, 5.3.

   **Exact repair.** Insert before `**Checks.**` in each section.

   §3.5:

   > The special derivations have the following API.
   >
   > - `𝔤_S` is free on the `X_s`, `s ≠ a`, and graded by bracket length; a special derivation of degree `m` is given by elements `u_s` of degree `m` with `Σ_{s≠a}[X_s,u_s] = 0`, the condition `D(X_a) = 0`.
   > - The commutator of two special derivations is special, with `u_s = [u_s,u′_s] + D(u′_s) − D′(u_s)`, so they form a graded Lie algebra.
   > - In every weight `m ≥ 1` the dual of the weight-`m` part of `CLie_S` is the space of special derivations of degree `m`, and the commutator is dual to the cut cobracket.

   §5.4:

   > The current regulator has the following API.
   >
   > - On every stratum `Y` the forms of `R∘r_Y` are locally integrable and define currents on `X`.
   > - The component on a stratum of codimension `q` is `(πi)^q` times the pushed-forward current; the exterior column carries in addition the holomorphic component `(−1)^{n−1}2^{1−n}dlog f₁∧…∧dlog fₙ`.
   > - `dR − Rδ = πi Σ_Y i_{Y*}R res_Y`, so the total map is a map of complexes from the totalized diagram of §5.3 to the weight-four real Deligne complex of `X`.
   > - Applied levelwise to a simplicial smooth variety it commutes with the face maps.

   §5.6:

   > The map has the following API.
   >
   > - `r₃` is alternating in its six points and `μ₃` in each of its two triples; `a′₃` and `a″₃` are the alternating double sums over the omitted vertices.
   > - `a₃ = (1/6)a′₃ − (1/3)a″₃` kills the relations of `A₃(F)`, and an odd permutation of either simplex negates it.
   > - `δ₃∘a₃ = (a₂∧a₁)∘ν` on `A⁰₃`, with `a₂∧a₁` as in §5.5.
   > - When three projected points are collinear, `r₃` is replaced by `−2μ₃`.

   §5.8 (worded for the repair of R01):

   > The cocycle has the following API.
   >
   > - For `N ≥ 4` and an infinite field `F` the composite is a map of complexes from the generic decorated-flag complex of `GL_N(F)` to the weight-four Chevalley–Eilenberg complex of `L(F)`, commuting with field embeddings.
   > - After the homotopy `h` its degree-two components have no `Λ²B₂` part and its degree-one components lie in `B₄(F)`, so it has values in `Γ(F,4)`; the components in degrees three and four are those of §4.8.
   > - On the simplicial variety of generic decorated flags its values are regular wherever the eight-point configurations entering `𝓛₄` are generic, and point evaluation at an `F`-point gives the map for `F`.

   **Tested.** The commutator formula of §3.5: `[D,D′](X_s) = [[X_s,u_s],u′_s] + [X_s,Du′_s] − [[X_s,u′_s],u_s] − [X_s,D′u_s] = [X_s, [u_s,u′_s] + Du′_s − D′u_s]` by the Jacobi identity. Every other bullet restates a sentence of its section.

3. **F03** (P3) §1.3 gives equation (19) the page of the sentence that refers to it

   **Location.** `packages/ZagierConjecturePolylogarithms/README.md:173` (§1.3): "(Goncharov–Rudenko [GR], §1.2, item 1, Definition 1.10 and (28), p. 11; (29) and (19), p. 12)".

   **Claim.** Equation (19) is on p. 12.

   **Witness.** GR line 336, on p. 9, is the display (19). Page 12 has only the sentence that (29) specializes further to (19), GR line 504.

   **Exact repair.** Replace "(29) and (19), p. 12" by "(29), p. 12; the further specialization of (29) to the relations (19) of p. 9 is stated on p. 12, GR line 504".

Three findings: one blocking (P2) in §5.8 and two P3. The finding of round 8 is repaired. `Suggested.lean` elaborates with `sorry` as the only warning, has no padding and states both headline theorems; it needs no change.

## Verified sound

### The finding of the previous review

| Previous finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3), §3.13 miscounted the cuts of `(0,0,1,y)` | `README.md:580`: "of the eight cuts of `(0,0,1,y)` seven vanish: the four with a factor `Cor_∞(0,0,1)` or `Cor_∞(y,0,0)` …, the two with the pure factor `Cor_∞(0,0)` …, and `Cor_∞(0,1)∧Cor_∞(1,y,0)`"; "The one survivor … is `Cor_∞(0,1,y)∧Cor_∞(y,0)`" | repaired |

No finding of the repair report was marked not actionable. The repair also rewrote the fifteen-cut sentence and the four-letter formula at `:581`; all three were recomputed (rows below). The repaired pattern, a cut count, was looked for in the rest: §3.4 (`5+5+5`), §3.8 (three cuts) and the `(2,2)`-cuts of `(0,0,x,1,y)` are right.

### Adversarial table

Fresh rows: the repaired passage, the 15 sampled targets, the headlines and the targets of the findings. For text no repair touched and outside the sample, the computed rows of rounds 6 to 8 stand.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §3.13 eight cuts (changed) | all `ℓ(ℓ−2) = 8` cuts of `(0,0,1,y)` by letter and arc | 4 with `⟨0,0,1⟩` or `⟨y,0,0⟩`, 2 with `⟨0,0⟩`, 1 with `⟨0,1⟩`, survivor `⟨0,1,y⟩∧⟨y,0⟩` | 7 + 1, coefficient 1 |
| §3.13 fifteen cuts (changed) | all 15 cuts of `(0,0,0,1,y)` | lengths (2,4),(4,2): 4 shuffle, 4 pure, 1 `u(−1)`, survivor `⟨0,0,1,y⟩∧⟨y,0⟩`; five (3,3)-cuts each with a repeated letter | 14 + 1 |
| §3.13 four-letter formula (changed) | `(0,0,1,y)`; `(0,x,1,y)` | `k=1,4`: zero factor; `k=3`: `u(0)−u(−1) = 0`; `k=2`: `Cor(0,1,y)∧u(y)`. Distinct points: units `(1−y)/y`, `y/x`, `x/(1−x)`, `(1−x)/(1−y)`; equals `−δD₂₁(x,y)` term by term with `[(y−x)/(1−x)]₂ = −[(1−y)/(1−x)]₂` | sound |
| §1.1 | `Z(0,…,5)`; `s(∞,1,0,7)`, `s(∞,0,1,7)` | `1/5`; `7`; `−6 = 1−7` | sound |
| §1.3 against §1.5 | case `a > 0 = b` of (29) | `[1−v₀⁻¹]₃ + [1−v₀]₃ − [1]₃ = −[v₀]₃` | matches `−S₃(v₀)` |
| §1.2 against §3.1 | three order cases of `δD₃₁` | `a>0=b`: `−S₃(v₀)⊗(u₀/v₀) + S₃(v₀)⊗u₀ = δS₄(v₀)`; `a=0<b`: `−S₃(u₀)⊗u₀`; `a=b<0`: `(2+1)S₃(u₀/v₀)⊗(u₀/v₀)` | signs `+,−`, factor 3 |
| §2.1 | `K₀`–`K₃` | 1; 2 vertices; 5; `14 − 21 + 9 − 1 = 1` | sound |
| §2.2 flip identity | formal letters `Δᵢⱼ` | `W_T − W_T′ − (1+X)∧X`: 0 terms | exact |
| §2.4 facet identity | `(0,1,3,7,11,17,23)`, `(0,1,2,5,−3,1/2,9)`, `(2,3,5,7,11,13,19)`, new `(1,4,9,16,25,36,50)`, exact rationals | facet sum 70 terms (42+28), `Q₄` 35 (21+14), left minus right 0 terms, four times; coefficients of `D₃₁(−69/8,−1/4)`: `−1`, `0`; of `D₃₁(−1/4,−69/8)`: `1`, `−1`; `L¹` plus its rotation: 0 terms | exact |
| §2.4 source form | `Σ_k L¹(x_{k+1},…)` against `Σ_i(−1)^i L¹(…x̂ᵢ…)` | rotation by `k−1` gives `(−1)^{k−1}` | negatives of each other |
| §3.6 non-admissible Check | `F⁰ = O(e₀ + x e₁)` at `s = 1/x = 0` | saturation `O(s e₀ + e₁)`, fibre `ℂe₁ ⊂ W_{−2}`, zero on `gr^W_0` | (a) fails, as stated |
| §3.10 | `m = 1`; `m = 2` | `(2πi)⁻¹log|z₀−z₁|` continuous off `z₀ = z₁`; limit `L₂((a−c)/(b−c))` depends on direction | sound |
| §4.1 | rows of `BC_m^{(4)}` and its dual, `m = 4,…,9` | `BC₄ = 0`, `BC₅ = C₅(4)`; dual rows `q′ ≤ m−4`; every component of `D` on the dual checked against the seven identities of §4.8 and the two relations of `G₄` | consistent |
| §4.4 | `𝔽₂`, `N = 2` | 3 lines in `𝔽₂²` | no fourth generic flag |
| §4.8 cancellation | two pairs of random configurations of 8 vectors in `ℂ³`, form `(D∘σ₁)∧(D∘σ₂)` | `X = 88.5609721590764`, `Y/X = −9.000000000000075`; `(Alt₇∘∂)/X = −0.99999999999990`, `(Alt₇∘p)/Y = −1.00000000000006`; parts `9.488675588471503`, `−9.488675588473136`. Second pair: `X = −217.097`, ratio `−9.0000000000007` | identity holds, `X ≠ 0` |
| §4.8 arithmetic | coefficients | `−(3/28)(−X) = (3/28)X`; `−(1/84)(9X) = −(3/28)X`; `3/28 + 9/84 = 3/14` | sound |
| §5.1 `µ` | weight 4 | `binom(5,2) = 10`; `4, 6, 4`; `1, 3, 3, 1`; zero-forms `20`, `6`, `2`; `X/4`-type split `(5/24)d^C∧d^C + (1/24)d∧d` | sound |
| §5.1 diagonal equation | `z = i`, `∂θ` | `Re Li₃(i) = −3ζ(3)/32`; `R`: both `−3iζ(3)/256 = −0.0140866i`; `C_H`: both `15iζ(3)/128 = 0.1408660i` | sound |
| §5.2 | `2+i`; `x = 0.4+1.3i` | `D = 0.5116664`, `log²√5 = 0.6475726`, correction `0.3313411`, `L₄* = 0.1462942`, `(5/16)L₄ = 0.1393913`; `L₄(x)+L₄(1/x) = 7·10⁻¹⁶` | hypothesis needed |
| §5.7 Check | moment curve `t = (2,3,4,5,6,8/5,0,1)` | 70 minors nonzero; `ρ = (4, 5/2, 2, 4)`; 720 permutations with a coincidence, 144 with `ρ₁ = ρ₄`, 0 adjacent | as stated |
| §5.8 | see R01 | `R₇²∘p = −9.4887 ≠ 0`; dual cross-ratios `51/40`, `2320/2761` | R01 |
| §5.9 Check 2 | `|123| = 0` | `(1/108)T₃ = (1/36)r₃`, `r₃ → Alt_{S₃×S₃}[…]₃`; `(36/36 − 1)Alt = 0` | residue zero |
| §5.3 degrees | residue `Γ(F,4)^j → Γ(k(Y),3)^{j−1}` | total degree `j−1+2 = j+1`; codimension 4: `0 + 8` | shift `2q` right |
| §5.4 constant | `t∧u` | `d(d^C log|t|) = 2πi·δ`; `ω₂` has boundary `πi·log|u|·δ` | `πi` |
| §6.1 | degrees | `K₇→H¹`, …, `K₄→H⁴`; after R01 the homotopy still changes degrees one and two only | sound |
| §6.2 | `[i]` over `ℚ(i)`; exponent | `β(4)/8 = 0.1236181`; `−β(4)/(64π³) = −0.00049836`; `4r₂ − 4N = −4(r₁+r₂)` | sound |
| §6.3 | zero cycle; `[x]+[x⁻¹]`; conjugate | `0`; `7·10⁻¹⁶`; `L₄(x̄)+L₄(x) = 0` | sound |
| `zagier_four_exists` | `ℚ`; `ℚ(i)` with `[i]`; totally real | `π⁴ = 90ζ(4)`; `π⁴β(4)/2 = 48.16609493406505 = 45ζ(4)β(4)`; `π^{4r₁}/√d` | `q = 90`, `45`, Siegel–Klingen |
| `zagier_four_everyFamily` | zero column; `[i]+[−i]`; other embedding | `0`; `β(4) − β(4) = 0`; row negated | `q = 0`, `0`, `−q` |
| `polylog`, `singleValued` (Lean formulas, integrated numerically) | `Li₂(1)`; `polylog 1 3`; `L₃(2)`, `L₃(−1)`, `L₃(1/2)`; `L₄(i)`, `L₄(2)`, `L₂(i)` | `π²/6` to `5·10⁻¹⁵`; `−log 2 − πi`; `1.0517998 = 7ζ(3)/8`, `−0.9015427`, `1.0517998`; `0.9889446`, `−7·10⁻¹⁶`, `0.9159656` | match the Checks |
| `TrilogRelationFunction` with `b = L₃` | `(2,3,5)`, `(−2,1/2,3)`, `(3/10,−7/10,3/5)`; wrong models | `4.6·10⁻¹⁴`, `3.9·10⁻¹⁵`, `−4.2·10⁻¹⁴`; `A,B` exchanged `−0.5210414`; sign of `b(A/d)` `5.9610645`; constant function `7v`; `a=c=d=1`: `3ζ(3) − 3ζ(3)` | predicate true for `L₃`, wrong models excluded |

### Sources: the seeded sample

All seven texts were read from the cache; the author flagged no locator as unverified. Every sampled locator is on the stated page and supports the statement, except the one of R03.

- **1.1**: (3), p. 4, GR line 130; (23)–(25), p. 10, GR lines 386–396; (34), p. 13, GR line 540.
- **1.3**: Definition 1.10 and (28), p. 11, GR lines 456–464; (29), p. 12, GR line 494; (19) is on p. 9 (R03). `Q₃` and `Q₄` agree with (28) and (32) term by term.
- **2.1**: Figure 6, p. 21, GR line 884; Theorem 3.8, p. 39, GR line 1749; Proposition 3.9, p. 40, GR line 1760; (85), p. 46, GR line 2044.
- **2.4**: (101), Definition 4.2, (102), p. 52, GR lines 2296–2302; (35)–(36), p. 13, GR lines 548–552; Proposition 5.5, p. 56, GR line 2555.
- **3.6**: (183)–(184), p. 76, GR lines 3510–3515; G08 §§4.1–4.2, pp. 39–44 (lines 1633, 1726, 1867); the two conditions at infinity, p. 87, G08 lines 3812–3820.
- **3.10**: M20 Theorem 11, p. 18, line 899; Lemma 29 and the closing corollary, printed pp. 44–45, lines 2378 and 2430–2433.
- **4.1**: (129)–(130), pp. 62–63, GR lines 2826, 2866; (159), p. 69, GR line 3209; the unfixed signs, GR line 2838.
- **4.4**: (240), p. 94, GR line 4285; §9.1, pp. 85–87 (heading at GR line 3907).
- **4.8**: Theorem 7.6, p. 70, GR line 3245; Proposition 7.8, p. 71; Lemma 7.9, p. 72, GR line 3341; Theorems 10.9, 10.11, 10.15 and Lemmas 10.10, 10.12–10.14, pp. 98–106, GR lines 4424–4798; (165)–(168), pp. 70–71, with the coefficients `−5/2`, `1/2`, `1/108`, `−3/28`, `−1/84`.
- **5.1**: (190)–(192), pp. 77–78, GR lines 3588–3608; G08 Definition 2.1 and Lemma 2.3, p. 28, lines 1151, 1161; Definition 4.10, p. 47, line 1967; the differential equation, p. 105, line 4628.
- **5.7**: G09 Theorem 3.4, p. 18; Definition 4.1, p. 22; Theorems 4.2–4.3, pp. 23–24; GR lines 3973–3975 (p. 87) and 4236–4249 (p. 93); CGR Theorem 9 and Remark 10, p. 8, lines 440, 465.
- **5.9**: Lemmas 9.2–9.3, p. 89, Corollary 9.4, p. 90, Lemma 9.6, p. 93, GR lines 4064–4115, 4251; (231)–(232), (235)–(236), p. 89; G93 §4.3, (4.10)–(4.11), printed p. 190, and Theorem 4.6, p. 191 (scan pp. 22–23).
- **6.1**: Theorem 1.3(i), p. 6, GR line 230; GR lines 4274–4291, p. 94; 4236–4243, p. 93; 1126–1131, p. 26.
- **6.2**: Theorem 1.3(ii), (iv), pp. 6–7, GR lines 233–242; Theorem 9.1, p. 87, GR line 3988.
- **6.3**: (40)–(41), pp. 15–16, GR lines 661, 671; GR lines 1066–1075, p. 25; G08 §1.3, p. 7, lines 294–302.

### Lean form, headlines and padding

- **Elaboration.** `lake env lean` on the absolute path of `packages/ZagierConjecturePolylogarithms/Suggested.lean`, from the content checkout: two warnings, both `declaration uses sorry` (124:8, 133:8), nothing else.
- **Form.** `import Mathlib` only; one module docstring in the required form; namespace `TauCetiRoadmap.ZagierConjecturePolylogarithms`; a docstring on each of the ten declarations; no `set_option`, `lemma`, `#eval`, `#print`, `#synth`, `example` or sorry'd data.
- **One-tactic probe, both sorried theorems.** On scratch copies: `rfl`, `simp`, `infer_instance`, `exact ⟨0, by simp⟩`, `aesop`, `trivial`, `exact ⟨_, rfl⟩`, `simp [zagierDeterminantFour, periodMatrixFour, IsCycle4]`, a zero-family witness closed by `simp`, `exact ⟨0, by simp [zagierDeterminantFour, periodMatrixFour]⟩`, `norm_num`, `decide`: 24 probes, 24 failures. No padding.
- **`#check @name`** for all ten declarations in one scratch file: `[Field F]` on the four field-level definitions, `[AddCommGroup V] [Module ℚ V]` on `TrilogRelationFunction`, `[Field F] [NumberField F]` on `periodMatrixFour`, `zagierDeterminantFour` and both theorems, `hc` on `zagier_four_everyFamily`. No binder lost; each equals README §6.4. Nothing changed.
- **Headlines.** The Summary's end theorems are `zagier_four_exists` and `zagier_four_everyFamily`; both are stated. The five groups of results that are not statable are named in the module docstring with the missing carriers.
- **Names.** The ten backticked names the README attributes to this roadmap are the ten declarations. Polylogarithms' `Suggested.lean` declares `polylog`, `singleValued`, `unitVector`, `trilogCyclic`, `TrilogRelationFunction` in its own namespace; no fully qualified name is shared.

### Pinned declarations opened

Mathlib: `Finsupp.linearCombination` (`LinearAlgebra/Finsupp/LinearCombination.lean:54`), `Submodule.mkQ` (`LinearAlgebra/Quotient/Defs.lean:227`), `TensorProduct.lift` (`LinearAlgebra/TensorProduct/Basic.lean:122`), `exteriorPower` (`LinearAlgebra/ExteriorAlgebra/Basic.lean:79`), `exteriorPower.ιMulti` (`LinearAlgebra/ExteriorPower/Basic.lean:56`), `Matrix.det_isEmpty`, `Matrix.det_mul` (`LinearAlgebra/Matrix/Determinant/Basic.lean:97`, `:141`), `FreeLieAlgebra` (`Algebra/Lie/Free.lean:121`), `LieDerivation` (`Algebra/Lie/Derivation/Basic.lean:43`), `groupHomology` (`RepresentationTheory/Homological/GroupHomology/Basic.lean:226`), `ProjectiveResolution` (`CategoryTheory/Preadditive/Projective/Resolution.lean:41`), its `lift` (`CategoryTheory/Abelian/Projective/Resolution.lean:92`, between two projective resolutions), `NumberField.dedekindZeta` (`NumberTheory/NumberField/DedekindZeta.lean:50`), `NumberField.discr` (`NumberTheory/NumberField/Discriminant/Defs.lean`), `InfinitePlace.embedding`, `IsComplex`, `nrRealPlaces`, `nrComplexPlaces` (`NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, `:188`, `:437`, `:441`), `bernoulli_one` (`NumberTheory/Bernoulli.lean:207`, value `−1/2`).

Tau Ceti: `MixedHodgeStructure` (`Geometry/Hodge/Mixed/Basic.lean:72`), `MixedHodgeStructureCat` (`Mixed/Category.lean`), the instance `abelian` (`Mixed/Abelian.lean:33`), `Hom.range_inf_F_eq_map_F` (`Mixed/Strictness.lean`), `tate` (`Tate/Basic.lean:93`).

By object: no file of the pinned Mathlib or Tau Ceti defines a polylogarithm, a Bloch–Wigner function or a pre-Bloch group (one Mathlib docstring mentions the dilogarithm); Tau Ceti's `Algebra/Homology/AInfinity/Stasheff.lean` is the `A∞` identities, not a cell complex.

### Suppliers, gaps and order

Every cross-roadmap citation was resolved again, on main or at the open head.

- **Polylogarithms** (open): §§2.1, 2.2, 3.1–3.7, 4.1–4.7, 5.1, 5.2, 5.4, 5.5, 5.9 (its lines 137–1102); blochWignerDesc, stableK_hurewiczPrimitive, trilogGroup, `IsCycle3`, `FiveTermFunction`, genericVectorConfig, stabilizedConfigurationComparison, rankTwo_vanish, zagierPeriod_calibration, explicitRawCycleFour, cycleObstruction, zagierExistence_totallyRealEven all occur. Its §3.6 fixes the dual of `(I_q,B)` as `(−Bᵀ,I)`, used in R01.
- **K3BlochGroups** (open): §§3.2–3.5, 3.8 (593–826); §4.21 with `|k| ≥ 4` and preBloch_rationalSpecialization (1755). **PeriodsAndSpecialValues** (open): PS.3.0 (752), PS.9.3 (2085), PS.9.8–PS.9.10 (2190–2231). **BorelRegulators** (open): §§1.1, 2.2, 2.3, 5.3, 5.4, 6.0a, 6.2 (171–795), with `π^(dₙ−Nn)` and `r_Bo = −2r_Be`. **MotivicEtaleKTheory** (open): §§3.3, 3.4, 7.1. **MotivesAndAlgebraicCycles** (open): §3.6, Layer 4, §§6.1–6.3. **MixedHodgeModulesAndIrregularHodgeTheory** (open): §§3.1–3.3.
- **PolylogarithmFunctions** (main): §§1.1, 4.2, 4.6, 4.7, 5.1, 5.2, 5.7; its cross-ratio `r(∞,0,1,z) = z` and the remark that the source's bracket gives `1−z` agree with the Conventions. **HodgeStructures** (completed, main): layers L0–L2.
- Merge order: the suppliers are on lines 39, 92, 138, 139, 261, 302, 306, 321; this roadmap is on line 323.

The four declared gaps have the same slugs in `design/plan.json` and under `## Exact supplier contracts`, each with a named supplier and section; none asks for what the supplier's head states.

Dependency check:

```text
depcheck: 239 roadmaps, 2260 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

### Duplication and overlap

- `roadmaps grep` over main and the open heads, by object: scissors congruence, Hodge correlators, the tetralogarithm, special derivations, framed mixed Hodge structures, cluster polylogarithms and Hodge–Tate variations occur nowhere else; motivic correlators, the Bigrassmannian and decorated flags only in Polylogarithms; Stasheff elsewhere only as `A∞` and disc-moduli vocabulary.
- The overlaps ledger lists no other pull request changing this roadmap, no dropped id and no id only a revision defines. Main has no folder of this name: no second copy.
- The two other board packages (AnalyticNumberTheory, LawrenceVenkateshMethod) were not opened.

Overlap check: read Polylogarithms, BorelRegulators, K3BlochGroups, PeriodsAndSpecialValues, MotivicEtaleKTheory and PolylogarithmFunctions; decorated flags and their acyclic resolution, owner Polylogarithms §3.4 (cited, with the declared gap decorated-flag-lengths); the weight-four theorem, `L₄*`, `κ` and the transfer to inductive cycles, owner this roadmap (Polylogarithms §4.5 and its scope paragraph); mixed Tate motives and path torsors, owner PeriodsAndSpecialValues PS.9.8–PS.9.10 (cited, two declared gaps); nothing else shared.

### Shape, style and copyright

- Six layers, each ending with Examples and Dependencies; 48 numbered sections, each with at least three Checks (counted by script); API lists as in R02; every theorem target has hypotheses and a locator.
- Pattern scan of the README and the Lean file for process words, pull-request numbers, round labels, machine paths, HTML and LaTeX delimiters: no hit.
- Arrangement against GR's contents (§§1–10): Layer 1 draws on §§1.2 and 5.1, Layer 2 on §§1.3, 3, 4, 5.2, Layer 3 on §§2, 5.2, 6, 8.2, Layer 4 on §§7, 9.1, 10, Layer 5 on §§8, 9 with G00, G09, CGR, G93, Layer 6 on §§1.1, 9.3. The source's §2 comes after the material of its §§3–4 here, and its §10 is merged into Layer 4; no run of layers maps one to one onto a run of sections. The order Layer 4 → 5 → 6 is forced by the *Needs* lines of §§5.8, 6.1.
- Wording, 9 passages beside their sources: the docstring of `zagier_four_exists` (GR 196–200), §1.2 (GR 407–441), §1.3 (GR 456–464), §3.6 (G08 3812–3820), §3.10 (M20 2430–2433), §4.8 (GR 3339–3344), §5.7 (GR 4236–4249; CGR 440–446), §6.1 (GR 4274–4291, 1124–1132). The longest shared run is five words ("Hodge bundles … extend to holomorphic subbundles"); no sentence, figure or list is taken over. The case table of §1.2 states the five cases of (26) in the roadmap's own layout.

Source independence: 9 passages compared with 4 sources, none shared; largest share GR, 97 of 143 page locators; contents compared with GR: independent.

## Not verifiable

- The truth of the owned research-level targets: §3.14(1) for an arbitrary discrete valuation, the family realization of §3.13, and the vanishing and regularity (a), (b), (d) of §5.7. They were tested on instances, not proved.
- The identities `δR₆² = R₅¹p`, `δR₇³ = R₆²p`, `δR₇² = R₆²∂` and `R₇²∂ = 0` of §4.8 were not recomputed; this round computed `R₇³∂ + R₇²p = 0` in its `Λ²B₂` part only.
- The plane integral of §3.9, the numerical cobracket values of §§3.1 and 3.13, the tetrahedron coassociativity of §5.5 and the `a₃` coefficients of §5.6 were not rerun; earlier rounds carry their values and the text is unchanged.
- G93 is an OCR of a scan: the heading of its Theorem 4.5 is garbled (the line reads "THEOREM 4."), so the number was confirmed by position, between Theorem 4.3 and §4.4, with (4.10)–(4.11) on the same page.

## Source issues

- **Error** in GR at Theorem 1.2, printed p. 5: the source says the determinant expression equals the zeta value for every number field; it should allow a nonzero rational factor, which is 90 over the rationals; affects a stated result.
- **Error** in GR at Lemma 7.9, printed p. 72: the source says the degree-two map composed with deletion vanishes on eight vectors in dimension three; it should say its wedge part is cancelled by the other degree-two map composed with projection; affects the proof.
- **Gap** in GR at §9.3, item 2, printed p. 93: the source says subtracting the cobracket of one eight-point double-symbol element lands the map in the polylogarithmic complex; it should carry the coefficient 3/28 and a second correction for the wedge-valued map on seven points of the line; affects the proof.
- **Error** in GR at §1.2, item 2, (36), printed p. 13: the source says the heptagon relation becomes the cyclic sum of the six-point elements; it should say that sum is minus twice the relation plus antisymmetrizers and inversion pairs; affects nothing.

The other source issues recorded in earlier rounds (G08 §9; GR §1.2 worked specialization, (99), §7.1 signs, (187)–(192), §9.3 with footnote 24; M20 (3) and the example after (16)) lie in text this round did not recompute.

## For the human reviewers

- **Scope.** `packages/ZagierConjecturePolylogarithms/README.md:903` states that part of the §5.7 target is open; §§5.8, 6.1 and 6.2 use it, so `zagier_four_exists` rests on it. `zagier_four_everyFamily` (§6.3) does not.
- **Scope.** The main source GR is recorded in `sources.toml` as an arXiv preprint (v5) with no journal reference. Reviews of this package record errors and gaps in its proofs (the section above).
- **Scope.** Polylogarithms' scope paragraph (its README, line 22) lists "decorated flags" and "the presentation map to the inductive complex" among what this roadmap owns; this README imports the flags from its §3.4 and constructs no such map (§6.5). The correction belongs to Polylogarithms.
- **Licence.** G93 is read from the author's page (`sources.toml`, `licence_class = "author-page"`), an OCR of a 1993 volume chapter.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e34a243ca716e291c853f3acc366a4b1364de4a5", "job": "REV-PKG-ZagierConjecturePolylogarithms~9", "model": "fable", "worker": "chris-x91"} -->
