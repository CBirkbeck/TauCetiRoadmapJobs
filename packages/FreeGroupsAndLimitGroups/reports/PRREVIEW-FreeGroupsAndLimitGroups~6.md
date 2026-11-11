# Review of FreeGroupsAndLimitGroups (pull request #2205 at d31b59b)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README:903 "Use [GL-JSJ] §1.2, pp. 16–17 (actions without inversions, …), §1.3, p. 18 (`(𝒜, ℋ)`-trees), and §1.4.2, p. 19 (domination, deformation spaces)". Lines 800 and 872 now read "§1.2, p. 16", and 963 reads "§1.2, Proposition 1.1, p. 17".
- R02 — repaired: 247 "For `x`, `y ∈ FreeGroup α`: `x * y = y * x` if and only if"; 1230 "makes `ℤ` a CSA group"; 1782 "let `Ω_K` be the kernel `Ker Ω` with its free items deleted (IFT §5.2, p. 31, writes it with an overline)". All 17 listed lines are fixed.
- R03 — repaired: 1029–1033, five Checks, from "`ℤ` is freely indecomposable, since a free product of two nontrivial groups is nonabelian" to "uniqueness concerns `q` and the conjugacy classes of the factors `G_i`, not the free part".
- R04 — repaired: 489 "lifts to a closed path in `Γ` whose label differs by inserting `x⁻¹x` … at each passage through the identified terminus"; 494 "that is the accepted subgroup (the set of labels itself can change)".
- R05 — repaired: the description reads "**Order with #2221.** … This pull request merges first and #2221 is rebased onto it", and the merge-order block reads "`FreeGroupsAndLimitGroups`: **this pull request** → #2221."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3 primitive Check (1.3) | `a b` with basis `(a b, b)`; `a b²` with basis `(a b², b)`; `[a,b]` | `a=(ab)b⁻¹`; `a=(ab²)b⁻²`; abelianisation `0`, not primitive | holds | none |
| §1.5 commuting elements | `x=a²,y=a³`; `x=a,y=b`; `x=1` | `r=a,(m,n)=(2,3)`; `ab≠ba`, no common root; `r=y` | holds both directions | none |
| §1.8 malnormality example | `u=a,g=b`; `u=a²,g=a` | `b aᵏ b⁻¹` reduced, not in `⟨a⟩`; `a⟨a²⟩a⁻¹∩⟨a²⟩=⟨a²⟩` | holds; hypothesis needed | none |
| §2.2(1) finite spanning tree | one-petal rose; theta graph | tree is the vertex: `0=1−1` edges; tree has one edge: `1=2−1` | holds | none |
| §2.4 folds (sample, cited by §2.5) | KM02 Def. 2.4 lines 125–169 (pp. 3–4); Lemma 2.5(2) line 177 (p. 4) | folding with common origin identifies termini; image path keeps label | locators verified | none |
| §2.5 lift sketch and gloss | `e₁:u→w₁`, `e₂:u→w₂` (label `a`), `b₁:w₁→u`, `c₂:u→w₂` | folded `cb` lifts to `c₂e₂⁻¹e₁b₁`, label `ca⁻¹ab=cb` in `F`; `cb∉L(Γ,u)` | sketch and gloss hold (KM02 lines 276–302) | none |
| §2.6 Check `[a², a³]` | `⟨a², a³⟩` | `a=a³a⁻²`, so `⟨a⟩`, one petal | holds | none |
| §2.7(3) containment | `⟨a²⟩≤⟨a⟩`; `⟨b⟩` vs `⟨a⟩` | the 2-cycle maps onto the `a`-petal; no `b`-edge, so no morphism | holds | none |
| §4.1 (sample) | GL-JSJ lines 772–782 (p. 16) | splitting = marked graph of groups; minimal, no inversion, finite quotient | locator verified | none |
| §4.5 one-edge splittings | GL-JSJ lines 774–775 (p. 16) | one edge gives `A∗_C B` or `A∗_C` | locator verified | none |
| §4.6 trees, domination | GL-JSJ §1.2 lines 756–809 (pp. 16–17), §1.3 line 860 (p. 18), §1.4.2 lines 914–917 (p. 19) | domination is an equivariant map, equivalently elliptic vertex stabilizers; §4.12 keeps GL-JSJ Def. 2.1 (line 1049) | locators verified | none |
| §4.9 trichotomy | GL-JSJ Prop. 1.1 line 834 (p. 17); `ℚ` | every element elliptic, no fixed point, `ℚ` not finitely generated | holds | none |
| `IsFreelyIndecomposable` | `ℤ`; `1`; `ℤ/2∗ℤ/2`; `ℤ/3` | yes (nontrivial coproducts are nonabelian); no (not `Nontrivial`); no; yes (finite) | Checks 1–3 correct | none |
| `IsGrushkoDecomposition` | `ℤ²∗F(c,d)`: `t=(c,d)`; `(ℤ²,⟨c⟩),t=(d)`; `t=(c,d²)` | yes; no (`⟨c⟩≅ℤ`); no: the image lies in the kernel of `ℤ²,c↦0`, `d↦1` | Check 4 correct | none |
| `IsGrushkoDecomposition.unique` | `ℤ/2∗ℤ`, `(⟨s⟩,(c))` vs `(⟨s⟩,(sc))` | `θ(c)=sc`, `θ²(c)=s·sc=c`; `q=q′=1`, `σ=id`, `g=1`; `⟨(0,1)⟩≠⟨(1,1)⟩` in `ℤ/2×ℤ` | consistent; the theorem claims nothing of `t` | none |
| `exists_isGrushkoDecomposition` | `1`; `ℤ`; `ℤ/2∗ℤ/3` | `p=q=0`; `p=0,q=1`; `p=2,q=0` | true | none |
| §5.2 (sample) example | `G=F(a,b)`, `S={x²}`; IFT lines 214–235 (pp. 5–6) | `V={1}` (torsion-free); `x≠1` in `G∗ℤ/2`, so `ncl(x²)≠ncl(x)=Rad` | holds; ALG page remark below | none |
| §5.5 injectivity example | trivial `F(a,b)→ℤ` | `ℤ` abelian, so CSA; `x=y=1` (the generator) commute: zero divisor, not a domain | holds | none |
| §5.6 `G=1` | `H` nontrivial, `x=y=h≠1`; `H=1` | `[h,h]=1`: zero divisor, so a domain is trivial; every `V(S)` is the point, `∅` closed and not algebraic | holds | none |
| §5.11 (sample) | ALG Cor. 8 line 1387 (p. 36), Lemma 15 and Thm 5 lines 1533–1552 (p. 40), Thm C1 line 224 (p. 7); VAR-I lines 167–182 (p. 5) | statements match, with hypotheses EN, domain and nonempty | holds; section remark below | none |
| §6.1 example | `S⁺(1,0)`; `S⁻(1,0)` | `ℤ²`, `χ=2−2=0`; `ℤ/2`, `χ=2−1=1` | holds | none |
| §6.4 example | index 2 in `S⁺(2,0)`; double cover of `S⁻(3,0)` | `2·(−2)=−4=2−2·3`; `2·(2−3)=−2=2−2·2` | holds | none |
| §6.5 (sample) Check | `z₁⁻¹az₁z₂⁻¹bz₂z₃⁻¹az₃(aba)⁻¹` at `(1,1,1)`; IFT lines 326–365 (p. 8); VAR-I line 299 (p. 8) | `a·b·a·(aba)⁻¹=1`; `m=3`: `S⁺(0,4)`, `χ=2−4=−2` | holds | none |
| §7.4 D4 kernel | IFT line 1360 (p. 31), line 1362 | overline means "delete free variables"; `F_{R(Ω)}=F_{R(Ω̄)}∗F(Y)` | `Ω_K` matches the source | none |
| §8.1 API bullet | free group of uncountable rank; `F₂×ℤ` | fully residually free and `F₂`-discriminated (retract onto a finite free factor); neither | holds; countability remark below | none |
| §8.3 example | `w` with exponent sums `(e_x,e_y)` in `(ℤ,(1,k))` | `w↦e_x+k e_y`, zero for all large `k` iff `e_x=e_y=0` iff `w∈[F₂,F₂]` | holds | none |
| §8.6 (sample) locator | IFT lines 271–284 (pp. 6–7); VAR-II lines 129–143 (p. 4) | `ξ_k` discriminate; `G[X]` `G`-embeds in `G(u,t)` for nonabelian CSA BP `G`, `u` not a proper power | verified | none |
| §8.9 Check, abelian base | `G=ℤ`, `[x₁,y₁][x₂,y₂]` | vanishes on `ℤ⁴`, so `[x₁,y₁]∈R(S)`; `≠1` in `ℤ∗S⁺(2,0)=G_S` | holds | none |
| §9.2 `l_x` | Cayley tree of `F(a,b)`, `x=1` | `l(ab)=2`; `2(a·b)_1=1+1−2=0∈ℤ` | holds | none |

The rows for statements this change leaves untouched stand as in the previous review, of `11a9d0f`.

- Source locators checked against the text: 23, in 6 sources: GL-JSJ 6, IFT 5, ALG 5, KM02 4, VAR-I 2, VAR-II 1. The sampled targets in the changed passages are §§4.1, 5.2, 5.11, 6.5 and 8.6; §2.4 is checked because §2.5 cites it. All of them verify, apart from the two section and page slips below.
- Library: `Suggested.lean` is byte-identical to `11a9d0f`. All 26 `#check @name` elaborate in one scratch file with no error, and the types are unchanged. Opened Tau Ceti `GroupTheory/LimitGroup/ResiduallyFree.lean:110` (`IsFullyResiduallyFree`).
- Cross-roadmap: #2221 sets GL-JSJ §1.2 at its lines 904 and 964, so the description's claim holds. SurfaceTopology, NeronModelsAndSemistableAbelianVarieties and ArithmeticFuchsianGroups cite §§2.2, 2.2a and 6.0a–6.1a, whose headings and names this change leaves unchanged.
- Gate rerun at this head: every check is 0, OK. Depcheck: `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`. No file outside the folder changed.
- Elaboration: `lake env lean` gives 12 `sorry` warnings and no other diagnostic. The one-tactic probe stands from `11a9d0f`.
- Overlap check: read SurfaceTopology, RandomGraphs and GraphConnectivityAndFlows. SurfaceTopology consumes §§2.1–2.2a and 6.0a–6.0d (owner: this roadmap). GraphConnectivityAndFlows owns multigraph walks, components and forests (§§2.1a and 2.2a cite it). RandomGraphs shares nothing.
- Remark (untouched text): §5.2 (line 1163) "ALG §3.1–3.4, pp. 26–36": §3 begins on p. 30 (ALG line 1177). §5.11 (line 1357) "ALG §4, Lemma 15 and Theorem 5": both are in §3.6 (lines 1442, 1533–1550).
- Remark (untouched content): the "for countable `G`" in §8.1's bullet (line 1927) is not needed. A finite set of images lies in a finite free factor of the free image, and that factor embeds in `F₂`.

## Not verifiable

- [TREES] Serre, *Trees* (cited on the changed lines of §§4.1, 4.5, 4.6 and 4.9): the Springer DOI is paywalled, so the citation is uncertified.

## Source issues

- **Error** in KM02 at proof of Lemma 3.4, p. 7: the source says path reduction in the folded graph keeps the label, giving `L(Γ, v) ⊆ L(Γ′, v′)`; it should say only the element is kept (reducing `e⁻¹e` deletes `x⁻¹x`), so `ca⁻¹ab` leaves the language; affects a stated result.
- **Misprint** in IFT at §2.5, the theorem cited from [40], p. 7: the source says the maps `ξ_k` discriminate `G(u, v)` into `G`; it should be `G(u, t)`; affects nothing.
- **Misprint** in VAR-II at §0, Lemma 2 and the sentence before Theorem 1, p. 4: the source prints unresolved citation keys `[?]`; it should name the cited papers; affects nothing.
