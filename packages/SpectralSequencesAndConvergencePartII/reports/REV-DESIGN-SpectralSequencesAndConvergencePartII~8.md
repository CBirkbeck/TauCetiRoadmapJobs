<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14773#issuecomment-6868645565 -->
Review (claude) of be95cd0

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) one convergence contract omits the canonical-presentation clause its siblings carry

   **Location.** `packages/SpectralSequencesAndConvergencePartII/design/README.md:480–487`,
   gap:base-complete-convergence: "the spectral sequence converges strongly in every degree to `H^*(K)`
   with the induced filtration."; the same sentence in `design/plan.json`, `gaps`, slug
   `base-complete-convergence`.

   **Claim.** The contract supplies what 1.3(c) and, through it, the third case of 1.4 use. The route of
   1.4 (README:715–720) needs the structures of 1.3 to be through the canonical presentation, so that
   `Tot(f)` is a morphism of converging structures. The sibling contracts gap:base-finite-filtered-convergence
   (README:436–437) and gap:base-exhaustive-bounded-below-convergence (README:445–446) end with "through
   the canonical isomorphisms of gap:base-induced-filtration"; this one does not. Inside the README the
   Conventions bullet *Convergence* (README:142–151) defines the phrase, so the README is consistent;
   the `needs` sentence announced to the supplier stands alone and permits an abstract `β`.

   **Witness.** `K = V[0]`, trivial filtration, over a field: hypotheses of the contract hold;
   `β = id` and `β′ = σ ≠ id` are both strong structures; `β′ ∘ E_∞(id) = σ ≠ id = gr(id) ∘ β`, so the
   identity is not a morphism between them.

   **Exact repair.** In README:486–487 and in the plan's `needs` for `base-complete-convergence`,
   replace "converges strongly in every degree to `H^*(K)` with the induced filtration" by "converges
   strongly in every degree to `H^*(K)` with the induced filtration, through the canonical isomorphisms
   of gap:base-induced-filtration". Tested on the witness: the canonical presentation of `V[0]` is
   `id_V` on both sides, `σ` is no longer admissible, and `(id, id)` is a morphism. No hypothesis is
   added and no consumer changes.

2. **F02** (P3) the Definition 24.9 locator is not recorded in the manifest or the References

   **Location.** README:428–429: "(stacks-012K line 3131–3140, Definition 24.9, tag 012U)";
   `packages/SpectralSequencesAndConvergencePartII/sources.toml`, entry `stacks-012K` (`locator`,
   `cited_for`); README:1685–1686 (References, stacks-012K).

   **Claim.** Every cited locator is recorded. The citation is correct (stacks-012K line 3131–3140 is
   Definition 24.9, tag 012U, printed pp. 64–65), but the manifest's `locator` lists only §18, §25 and
   §26, its `cited_for` has no entry for the supplier contracts, and the References line lists no §24.
   Separately, the `mccleary2001` entry lists `6.2` in `cited_for`, and 6.2 does not cite it
   (README:1591–1648; it is cited in 5.2 and 6.1 only).

   **Witness.** `sources.toml`, `stacks-012K`: `locator = "012K; §18 Definition 18.3 …; §25 …; §26 …"`,
   `cited_for = ["Conventions", "1.1", "1.2", "1.3", "1.4", "1.5"]`.

   **Exact repair.** In `sources.toml`, `stacks-012K`: add "§24 Definition 24.9 (tag 012U, line
   3131–3140)" to `locator` and "Exact supplier contracts" to `cited_for`; in `mccleary2001` drop
   `"6.2"` from `cited_for`. In the README References, stacks-012K: add "§24 (Definition 24.9, tag
   012U)". Tested: after the change each of the 78 locators before the References resolves to a
   manifest locator.

Changes are requested: two findings, both P3 (R01, R02), each with a repair to apply. No P1 or P2
finding. The nineteen declared supplier gaps (all on SpectralSequencesAndConvergence) are contracts, not findings. Elaboration: not available (this lane
does not elaborate); the design has no `Suggested.lean`, so nothing was elaborated or probed.

## Verified sound

### The previous finding, checked first

| Round 7 finding | Repaired passage | Check | Status |
| --- | --- | --- | --- |
| F01 (P2): gap:base-induced-filtration equated abstract weak convergence with invertibility of the canonical presentation | README:425–430: "When both maps of this presentation are isomorphisms, their composite supplies the weak-convergence isomorphism `β` … The existence of some other isomorphism … is not asserted to make the presentation invertible." The same text is in the plan's `needs`. | Recomputed on `K = (k → k ⊕ V)`: `E_∞^{0,0} = k ⊕ V`, `gr^0 H^0 = V`, `B_∞ = 0`, `Bᵗ = k`; projection has kernel `k`; the shift `β` is an isomorphism. The repaired text claims only the sufficient direction. | repaired |

The repair report marks nothing "not actionable in this package". No maintainer notes were supplied.

Passages the repair changed or added, each read and recomputed (rows in the table below):
Conventions *Convergence* (README:142–151), 1.2 last bullet (592–596) and last Check (633–646), the
1.4 route and Needs (715–722), 5.2 third bullet (1481–1484), the contract (418–430). The repaired
pattern was then searched in every other contract and every statement that asserts a convergence:
gap:base-finite-filtered-convergence and gap:base-exhaustive-bounded-below-convergence say "through
the canonical isomorphisms"; 6.2 states its own canonical comparison (1604–1609); 2.4–2.6, 3.2–3.4
and 4.2–4.4 inherit 1.3 under the Conventions bullet; gap:base-complete-convergence is the one place
left (R01).

### Sources: the seeded sample, read at the locators

All eleven works are in the manifest (seven texts read, four settled uncertified). Nothing needed
fetching; the manifest was not changed.

| Target | Locator read | Result |
| --- | --- | --- |
| 1.2 | stacks-012K line 3241–3265 (§25, Lemma 25.1, tags 012X, 0130, pp. 67–68); grothendieck1957 line 1226–1235 ((2.4.1), p. 146); sign footnote line 1266–1268 | First pages and `′d_1 = H^q(d₁)` agree; the source's `″d_1 = (−1)^q H^q(d₂)` is the row-filtration sign, which the Check at README:616–620 reconciles through the flip. Grothendieck's hypothesis is finite antidiagonals; the README attributes only the pages to it. |
| 1.4 | stacks-012K line 3293–3315 (Lemma 25.4, tag 0133, pp. 68–69) | Supports the augmented finite case only, as the README says ("for an augmentation"). weibel1994 §5.6 uncertified. |
| 2.1 | stacks-05QI line 3402–3448 (Lemma 18.9, tag 013T, pp. 67–68) | Enough injectives, `Comp⁺`, given resolution of the first term: agree. |
| 2.3 | stacks-05QI line 3621–3654 (Definition 21.1, Lemma 21.2, tags 015H, 015I, pp. 72–73); line 3667–3668; line 3682–3689 | Six conditions of the definition, existence by horseshoes, total complex an injective resolution, split rows: agree. Lifting is cited to uncertified texts and has a route here. |
| 2.5 | stacks-05QI line 3655–3689 (Lemma 21.3, tag 015J, pp. 73–74); grothendieck1957 line 1236–1252, 1291–1299, 1348–1356 | `″E_2^{p,q} = R^pF(H^q K)`, bounded, finite filtrations, left exact `F`, bounded-below `K`: agree. The `F`-acyclic variant is at line 1295–1298; Remarque 3 at 1348–1356. |
| 3.1 | stacks-05QI line 3696–3717 (§22, Lemma 22.1, tags 015L, 015M, p. 74); grothendieck1957 line 1338–1342 | Direction `R(G∘F) → RG∘RF`, left exact functors, enough injectives in `𝒜`, `ℬ`, equivalence with acyclicity on injectives: agree. Remarque 1 gives the embedding form. |
| 3.2 | stacks-05QI line 3718–3730 (Lemma 22.2, tag 015N, pp. 74–75); grothendieck1957 line 1309–1337, 1343–1347, 1506–1529 | `E_2^{p,q} = R^pG(H^q(RF(X)))` for `X ∈ D⁺`, bounded, finite filtrations: agree. Remarque 2 and Proposition 2.5.4 are for objects; the complex form has its own route (2.2(v), 2.5). |
| 3.3 | grothendieck1957 line 1330–1337 (Théorème 2.4.1, p. 148) | The source gives the object sequence; the low-degree sequences are attributed to base §3.6, not to the source. |
| 4.1 | weibel1994 Theorem 2.7.2 | Uncertified, not read. Route checked against the pin (below). |
| 4.2 | stacks-more-algebra line 7121–7134 (Example 63.1, tag 061Z, pp. 153–154); line 8115–8127 (§69, tags 0AVG–0AVI, p. 176); line 7413–7422 | Source: chain complex with `K_n = 0` for `n ≪ 0`, i.e. bounded above here, as the README says; the unbounded case is this roadmap's, by 1.3(b). Ext forms for `K ∈ D⁺`: agree. |
| 4.3 | stacks-more-algebra line 7399–7412 (Lemma 65.4, tag 0H7Z, p. 160); line 7413–7422 (Example 65.5, tag 0H80) | Page formula and bidegree agree; the source is for `D^b`, which the README states; the short exact sequence has `i + j = n + 1` on the Tor side: agrees. |
| 4.4 | stacks-more-algebra line 7135–7140 (Example 63.2, tag 068F, p. 154) | `Tor^S_n(Tor^R_m(M, S), N) ⇒ Tor^R_{n+m}(M, N)` and the route through a free resolution: agree. |
| 5.2 | may-primer line 295–324 (pp. 7–8); line 310–311 | Product filtration, page pairings, `μ` on `E_1`, limit pairing under the convergence theorem: agree. mccleary2001 uncertified. |
| 5.3 | cartan-eilenberg1956 Ch. XV | Uncertified, not read. Both sign rules derived independently (table). |
| 6.2 | may-primer line 147–150 and 155–168 (Example 2.3, p. 4); hatcher-at line 13330–13337 (Proposition 3E.3, p. 305) | Higher universal-coefficient sequence in homological form, `E_∞` for finite type, the three summand rules under finite generation: agree. |

Also read: stacks-012K line 2154–2164 (Definition 18.3, the sign `d₁ + (−1)^p d₂`), 3131–3151
(Definition 24.9, Lemma 24.10), 3284–3291 (Lemma 25.3), 3347–3358 and 3393–3438 (§26, Lemmas 26.1,
26.3, 26.4: abelian groups only, as README:756–757 says); may-primer line 249–287 (the conditions
`μ_n`, Proposition 4.1, Corollary 4.2); stacks-more-algebra line 12960–13016 (§97 and footnote 18).

### Adversarial pass (values computed this round)

`k` is a field, `V = ⊕_{n≥0} k`.

| Statement | Instance | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, total sign | unit square over ℤ | `d(1) = (1, 1)`; `d²(1) = −1 + 1 = 0`; unsigned `d² = 2` | sign pinned | none |
| Conventions, classical indexing | `E_1^{0,0}`, `E_1^{1,0}` | native `(2p+q+1, −p−1)` = `(1, −1)`, `(3, −2)`; `fil = −q′−1 = 0, 1`; `deg = 0, 1`; step `(2, −1)` is the page-2 shape | consistent with gap:base-bidegree-assignments (`e = 1`) | none |
| 1.1 staircase | `D_p, O_p`, `p ≥ 0` | `y_p = x_p − (−1)^p x_{p+1}`; on `⊕`: bijective; on `∏`: kernel `ℤ·(1,1,−1,−1,…)`, cokernel `0` | `H^0(Tot^⊕) = 0`, `H^0(Tot^Π) = ℤ` | none |
| 1.2 last Check (new), double-complex axioms | `x_m ∈ K^{−m,m−1}`, `y_m ∈ K^{−m,m}` | `d₁y_m ∈ K^{−m+1,m} = 0`, `d₂y_{m−1} ∈ K^{−m+1,m} = 0`: `d₁d₂ = d₂d₁ = 0` on `x_m` | valid | none |
| 1.2 last Check, `Tot^Π` | `x_m ↦ y_{m−1} + (−1)^m y_m` | `b_0 = a_1`, `b_j = a_{j+1} + (−1)^j a_j`: bijection `∏ k x_m → ∏ k y_j`; preimage of `y_0` is `(1,1,−1,−1,1,…)`; `H^{−1} = 0`, `H^0 = V`, `F^0H^0 = V`, `F^1 = 0`; finite-support preimages force `a = 0`, so `B_∞ = 0`, `Bᵗ = k y_0` | canonical map `k y_0 ⊕ V ↠ V`, kernel `k`; abstract `β` exists; 1.3(c) excluded since `K^{−m,m} ≠ 0` | none |
| 1.2 last Check, `Tot^⊕` | functional `c = (1,1,−1,−1,…)` on `y_j` | `c_{m−1} + (−1)^m c_m = 0` for `m = 1,…,4`; `c(y_0) = 1`; quotient of degree 0 by the image is `k y_0 ⊕ V` | presentation is the identity; `K` is in columns `≤ 0`, so 1.3(b) applies | none |
| 1.3(b), (c) on the staircase | rows exact, `q ≤ 0`, `p ≥ 0` | (b) for `″E`: `″E_1 = 0`, `H(Tot^⊕) = 0` ✓. (c) for `′E`: `′E_1 = ℤ` at `(0,0)`, `H^0(Tot^Π) = ℤ`, `H^1 = 0` ✓. `′E` on `Tot^⊕` would give `ℤ ≠ 0` | half-plane hypotheses separate the cases | none |
| 1.3(a) stabilisation bound | a nonzero `d_r` out of total degree `n` | needs nonzero terms in columns `p, …, p + r` on antidiagonals `n, n+1`: `r + 1 ≤ N` columns, so `d_r = 0` for `r ≥ N` | bound "`N` plus one" holds | none |
| 1.3(c) regularity criterion | target of `d_r` from `(p, n−p)` | `′E_1^{p+r, n+1−p−r} = H^{n+1−p−r}(K^{p+r,•}) = 0` once `p + r ≥ p₁(n)` | matches gap:base-bounded-below-regularity | none |
| 1.4 (route, changed) | staircase → column 0 | `′E_1(f) = id_ℤ`; `Tot^Π`: `ℤ → ℤ` iso; `Tot^⊕`: `0 → ℤ`, and (b) for `′E` fails (`p` unbounded above) | third case needs canonical structures: R01 | R01 |
| 1.5 augmented forms | `M` adjoined in column `−1` | `p ≥ −1` gives `q ≤ n + 1` on antidiagonal `n`: the row hypothesis of 1.3(b) for `″E`; dual form is left half-plane, 1.3(c) flipped, `″E_1 = 0` regular | routes are licensed | none |
| 1.5 dictionary with Weibel | `C_{p,q} = K^{−p,−q}` | his four cases map to: lower half-plane + exact columns (`Tot^Π`), left + exact rows (`Tot^Π`), lower + exact rows (`Tot^⊕`), left + exact columns (`Tot^⊕`) | each is one of the eight cases | none |
| 2.1(b) relative horseshoe | route recomputed | `ν₁ = ν − (dh̃ + h̃d)`: in degree 0 the correction is `h̃¹d⁰`, and `h̃¹d⁰ε = 0`; `π′ν₁ = βπ`; `μ = ν₁ − ι′(dg̃ + g̃d)`: `μι = ι′α`, `π′μ = βπ` | `μ` over `f₂`, restricts to `α`, induces `β` | none |
| 2.1 Check | `0 → ℤ →(×2) ℤ → ℤ/2 → 0` | kernel of `×2` on `ℚ/ℤ` is `{0, 1/2}`; twisted middle has `H^0 = ℤ`; untwisted `ℤ ⊕ ℤ/2` | discriminates | none |
| 2.3 Checks | two columns `ℚ → ℚ/ℤ`, `d₁ = ×2`; `K = (A →(id) A)` | first: horizontal cokernels `0, 0` against `H^1(K) = ℤ/2`. Second: `ker d₁^{0,•} = 0`, `im d₁^{0,•} = J`, `H_I = 0` | non-example and example | none |
| 2.5 Checks | `F = Hom(ℤ/2, −)`, `K = (ℤ →(×2) ℤ)`; `F = id` on the non-CE model | `″E_2^{0,1} = ″E_2^{1,1} = ℤ/2`, degrees 1, 2. Non-CE: row 1 has kernel `ℤ/2` in column 0, so the class sits at `(1, 0)` against `(0, 1)` | conditions needed for page 2 | none |
| 3.1 | `F = G = Hom(ℤ/2, −)`, `I = ℚ/ℤ` | `F(I) = ℤ/2`; `R¹(GF)(I) = Ext¹(ℤ/2, ℚ/ℤ) = 0`; `H¹(RG(ℤ/2)) = ℤ/2`. Embedding form: `I` is a summand of `M`, so `F(I)` is a summand of `F(M)` | both directions of both equivalences | none |
| 3.2 | `ℤ/4 → ℤ/2`, `A = ℤ/2` | `Hom_{ℤ/4}(ℤ/2, ℤ/4) = {0, 2}`, killed by `×2`: `R^qF = ℤ/2` all `q`; `E_2^{0,q} = ℤ/2`; abutment `ℤ/2` in each degree | agrees | none |
| 3.3 | same example | `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`: exact at each of the four inner places with middle map bijective | agrees | none |
| 3.4 | `F = − ⊗ ℤ/2`, `G = Hom_{ℤ/2}(−, ℤ/2)`; `G = Hom_ℤ(−, ℤ)` | first: `E_2^{0,q} = ℤ/2` (`q = 0, 1`), `Ext^n_ℤ(ℤ/2, ℤ/2) = ℤ/2` (`n = 0, 1`). Second: composite `0`, would-be `E_2^{1,0} = ℤ/2` | acyclicity hypothesis sharp | none |
| 4.1 | `Tor_1(ℤ/4, ℤ/6)`; socle product on `R = 𝔽₂[x,y]/(x²,y²)`, `X = R/(xy)` | kernel of `×6` on `ℤ/4` is `{0,2}`, kernel of `×4` on `ℤ/6` is `{0,3}`. `Tor_0(X,k) = X/(x,y)X = k`; `Tor′_0 = coker(0 : soc R → soc R) = k`; `X ⋆ k = soc X = ⟨x, y⟩`, dimension 2 | balance holds; `Tor_0 ≠ ⋆` without right exactness | none |
| 4.2(a) | `K ⊠ P`, `P` in degrees `≤ 0`; two columns | rows vanish for `q > 0`: 1.3(b) for `″E`; `″E_2^{p,q} = H^p(H^q(K) ⊗ P) = Tor_{−p}`; `gr^0 = F^0` is the subobject `H^n(K) ⊗ M`, `gr^{−1} = Tor_1(H^{n+1}K, M)` | sequence direction correct | none |
| 4.2(c) | `K = N[1]`; `X = (ℤ →(×2) ℤ)`, `M = ℤ` | `H^{−1}(K) = N` at `q = 1`: `Ext^p(N, M)` in degree `p + 1` = `Hom(N[1], M[p+1])` ✓. `E_2^{1,0} = Ext¹(ℤ/2, ℤ) = ℤ/2 = H¹(Hom(X, ℤ))` | indices correct | none |
| 4.3 | finiteness; `k[ε]/(ε²)`, `K = L = k` | `Tot(P)^n` uses `a ∈ [n, a₀]`; filtration index `s ∈ [n − a₀ − b₀, 0]`; `i ∈ [q − b₀, a₀]`: all finite. `E_2^{p,0} = k` for `p ≤ 0`, one term per total degree | strong convergence with finite filtrations; no two-column bound claimed | none |
| 4.4(a) | `ℤ → ℤ/4`, `M = N = ℤ/2` | `E²_{p,q} = ℤ/2` (`p ≥ 0`, `q = 0, 1`); abutment `ℤ/2, ℤ/2, 0, 0, …`; `E³ = E^∞` forces `d² : E²_{p,0} → E²_{p−2,1}` bijective for `p ≥ 2`; survivors `E²_{0,0}`, `E²_{1,0}` | nonzero differential forced | none |
| 5.1 | `M = (ℤ →(×4) ℤ)`, `f = 2` | `k(1) = 2 ∈ ℤ/4`, `j(2) = 0`: `d_1 = 0`, `μ_0` true. `i(c) = 2` forces `c` odd, `j(c) = 1 ≠ 0`: `μ_1` false. `d_2(1·1) = 1 ≠ 0`: `μ_0` false for `φ′` | shift starts at `n = 1`; converse route uses `i^n k = 0`, `n ≥ 1` | none |
| 5.2 (changed bullet) | `𝔽₂[x,y]/(x²)`, `dx = y` | `d_1(xy) = y² = d_1(x)y + x d_1(y)` (`d_1 y = 0`); `E_2 = 𝔽₂` at `(0,0)`; filtration finite in each degree (`F^p ∩ A^n = 0` for `2p > n`), so the canonical presentation is invertible | canonical hypothesis met | none |
| 5.2 route | `c = [d(x̃ỹ)]` | `dx̃ ∈ F^{p+n+1}`, `ỹ ∈ F^{p′}`: `d(x̃ỹ) ∈ F^{p+p′+n+1}`; its class in `gr` is `j(a)y + (−1)^{|x|} x j(b)` | `μ_n` holds | none |
| 5.3 sign rules | `D = d₁ + (−1)^p d₂` on `xy` | bidegree `(1,0)`: `d₁(xy) = d₁x·y + (−1)^{p+q} x d₁y`; bidegree `(0,1)`: `(−1)^{p+p′} d₂(xy) = (−1)^p d₂x·y + (−1)^{p+q+p′} x d₂y`. Flip: `(−1)^{(p+p′)(q+q′)} = (−1)^{pq+p′q′}·(−1)^{pq′+p′q}` | both rules and the flip sign as stated | none |
| 5.3 Check | `e² = f`, `fe = e`, `ef = f² = 0` | `(ee)e = e`, `e(ee) = 0`; `ue = e` forces `u = f`, `ff = 0` | no associativity or unit implied | none |
| 6.2 universal-coefficient sequence | general `(M, f)` | `ker k / B_r = H^n/(fH^n + H^n[f^{r−1}]) ≅ f^{r−1}H^n/f^rH^n` (kernel of `x ↦ f^{r−1}x` mod `f^r` is `fH^n + H^n[f^{r−1}]`); `k(Z_r) = f^{r−1}H^{n+1} ∩ H^{n+1}[f]` | sequence exact | none |
| 6.2 stabilisation | torsion exponents `a` (degree `n`), `b` (degree `n + 1`) | `f^rH^{n+1} ∩ H^{n+1}[f] = 0` for `r ≥ b`: leaving `d_r = 0` for `r ≥ b + 1`; `B_{r+1}` constant for `r ≥ a`: entering `d_r = 0` for `r ≥ a + 1`. `ℤ →(×p^r) ℤ`: `a = 0`, `b = r`, last nonzero differential `d_r` | page `max(a, b) + 1` exact | none |
| 6.2 Checks | `⊕_k (ℤ →(×p^k) ℤ)`; `ℤ → ℤ[1/p]` | first: `k(e_k) = p^{k−1}`, in `p^{r−1}H^1` iff `k ≥ r`: `E_r^0 = ⊕_{k≥r} ℤ/p`, `E_∞^0 = 0`. Second: `M/p = (ℤ/p → 0)`, `E_∞^0 = ℤ/p`, `gr H^0[1/p] = 0`, `⋂ p^rH^1 ∩ H^1[p] = ℤ/p ≠ 0` | criterion discriminates both ways | none |
| gap:base-complete-convergence | `V[0]`, `β = id`, `β′ = σ` | `β′ ∘ E_∞(id) = σ`, `gr(id) ∘ β = id` | canonical clause missing | R01 |

Rows of round 7's table for passages no repair touched carry computed values and were relied on for
the remaining targets (2.2, 2.4, 2.6, 6.1 and the eighteen other contracts); of those I recomputed
2.6's index witness (`K° ` in degrees `0, 1`, `E^1_{0,0} = E^1_{1,0} = ℤ/2`) and 6.1's `d_1` signs
(`k(1) = [1]`, `j = 1` for `×p`; `k(1) = [p]`, `j = 0` for `×p²`).

### Library at the pins (declarations opened)

Mathlib: `CategoryTheory/Monoidal/Tor.lean:44, 50, 61` (`Tor` derives the second variable through
`tensoringLeft`, `Tor'` the first; hypotheses `MonoidalCategory`, `Abelian`, `MonoidalPreadditive`,
`HasProjectiveResolutions`, exactly those of 4.1; no balance isomorphism in the file);
`Algebra/Homology/SpectralSequence/Basic.lean:109` (`CohomologicalSpectralSequence`);
`CategoryTheory/Filtration/Basic.lean:73` (`FilteredObject`, no exhaustiveness or completeness field);
`CategoryTheory/Functor/Derived/RightDerived.lean:54` (`IsRightDerivedFunctor`);
`CategoryTheory/Abelian/RightDerived.lean:110` (`isoRightDerivedObj`);
`CategoryTheory/Abelian/LeftDerived.lean:359` (`leftDerivedZeroIsoSelf`);
`CategoryTheory/Preadditive/Injective/Basic.lean:196, 265, 280` (`injective_of_adjoint`, the instance
`EnoughInjectives Cᵒᵖ`, `Adjunction.map_injective`, which assumes the left adjoint preserves
monomorphisms); `Algebra/Homology/HomotopyCategory/KInjective.lean:134`;
`Algebra/Homology/DerivedCategory/KInjective.lean:42`;
`Algebra/Homology/DerivedCategory/DerivabilityStructureInjectives.lean:61`;
`Algebra/Category/ModuleCat/ChangeOfRings.lean:658` (any rings), `:878` (commutative rings);
`Algebra/Category/ModuleCat/Monoidal/Closed.lean:42`; `Algebra/Homology/Opposite.lean:300`.

Tau Ceti: `Algebra/Homology/SpectralSequence/Filtered/FirstPage.lean:89`
(`CochainComplex.spectralSequence_first_page_d_eq`); `Filtered/SpectralObject.lean:425`;
`Filtered/Convergence.lean:51` (`filtrationAbutmentIso`);
`Algebra/Homology/SpectralSequence/Comparison.lean:32`; `Algebra/Homology/SpectralSequence/Bicomplex.lean:446`;
`Algebra/Homology/TotalComplex.lean:580, 596`; `Algebra/Homology/SpectralObject/Stabilization.lean:45`
(`EInfty`); `CategoryTheory/Preadditive/TowerDifference.lean:77`;
`CategoryTheory/Exact/Abelian.lean:166`; `CategoryTheory/Exact/Injective.lean:165, 426`;
`CategoryTheory/Exact/Projective.lean:218`; `CategoryTheory/Exact/Resolution/Horseshoe.lean:235`
(`FiniteResolution.horseshoe`); `Algebra/Homology/Monoidal/KFlat/Basic.lean:222` (an instance), `:361`;
`Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:729`;
`Algebra/Homology/UniversalCoefficient/Basic.lean:180`.

A scan of the 190 single-identifier code spans of the README against both pinned trees left only
notation and the four SchemeAndStackFoundations target names; no cited declaration is missing.
Remark, no change needed: Tau Ceti's Künneth sequence assumes that the cycles `Z_q(L)` and the
quotients `L_q/Z_q(L)` are projective for one of the complexes; over a ring of global dimension at
most one with `L` degreewise projective this holds, so the Check of 4.3 is an instance as stated.

### Duplication, ownership and overlaps

Object searches over main and the open heads (the registry's grep): "Cartan–Eilenberg resolution"
(only ArithmeticGaloisDuality's proof sketch and one unrelated hit), "acyclic assembly" (none),
"Bockstein spectral sequence" (none), Massey's conditions (none), Tor balance (none), product
totalisation (RefinedTraceMethods and DerivedDeRhamCohomology, for mixed and cosimplicial complexes,
not the general double complex), horseshoe (GrothendieckEulerForms §3.5, the finite projective form
at the pin, cited here), Künneth and universal-coefficient spectral sequences (AlgebraicTopology §5.1
for singular chains; ArithmeticLocallySymmetricSpaces ALS.1.7 and TorsionCohomologyInfrastructure,
applications), hypercohomology spectral sequence (applications to sheaves only). No roadmap states
the general constructions this one owns.

Cross-roadmap citations resolved now: StableHomotopyKTheory §7.22 (main, README:2618);
DerivedModuleAlgebra §0.2 (main, README:794) and §S.1 (README:955, anticommuting differentials, as
the dictionary of 1.2 assumes); ArithmeticGaloisDuality §D7.1, *Derived composite spectral sequence*
(open head, README:4871, proof sketch by a Cartan–Eilenberg resolution at 4885, as the contract
assumes); AlgebraicTopology §5.1 (main, README:1888–1906); SchemeAndStackFoundations
`leray_spectral_sequence`, `cech_to_cohomology` (README:4186–4189), `localToGlobal` (4440),
`hochschildSerre_galois_covering` (4926); SchemeKTheoryOperations (open head, group hyperhomology at
README:2549); TopologicalSheafCohomology §1.4 (main, README:164). The base and CohomologyOfGroups are
packages on the board (read from the packages index and the board checkout); every base section
named by a gap exists in `packages/SpectralSequencesAndConvergence/design/README.md` (§§1.2–1.4, 2.1,
2.2, 3.1–3.6, 4.3, 5.1–5.4, 6.1–6.3, 7.1, 7.2, 7.4, 7.5).

The overlap record lists no other pull request changing this roadmap, no dropped id, no id defined
only by an open revision, no second copy on main; I confirmed that main has no folder of this name.

Overlap check: read SchemeKTheoryOperations, DerivedInfinityCategories, EnhancedDerivedSheaves, AlgebraicTopology (main and the two open heads), DerivedModuleAlgebra, GrothendieckEulerForms, TopologicalSheafCohomology; the third list is empty; shared objects and owners: group hyperhomology — SchemeKTheoryOperations §6.7; Künneth sequence of singular chains — AlgebraicTopology §5.1; derived tensor and the first-quadrant double-complex sequence — DerivedModuleAlgebra §§0.2, S.1; finite projective horseshoe — Tau Ceti at the pin (GrothendieckEulerForms §3.5 cites it); Čech hypercohomology sequences — TopologicalSheafCohomology §1.4; nothing shared with DerivedInfinityCategories or EnhancedDerivedSheaves.

### Supplier order and gaps

Dependency check, exact output:

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All 24 `*Needs:*` lines were read; internal edges point backwards (2.3
needs 1.5 and 2.1; 3.2 needs 2.5; 4.4 needs 3.1–3.4, 4.1, 4.2; 5.3 needs 5.2; 6.2 needs 5.2 for
multiplicativity only). The nineteen gap slugs of the README, of the plan's `gaps` and of the target
prerequisites are the same set; every gap names SpectralSequencesAndConvergence and a section that
exists; each `needs` states its hypotheses; none asks for something Mathlib, Tau Ceti or an earlier
roadmap has (checked at the pin: no stabilisation, limit page, convergence structure, induced
filtration presentation or exact-couple spectral sequence in Mathlib's carrier; Tau Ceti's `EInfty`
and `filtrationAbutmentIso` are consumed inside the contracts, not re-requested). R01 is the one
wording note.

### Shape, headlines, style

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six
layers each ending with Examples and Dependencies, Downstream consumers, References: present. Checks
per target in the plan: 1.1: 4, 1.2: 6, 1.3: 4, 1.4: 3, 1.5: 3, 2.1: 3, 2.2: 4, 2.3: 4, 2.4: 3,
2.5: 3, 2.6: 3, 3.1: 3, 3.2: 3, 3.3: 3, 3.4: 3, 4.1: 5, 4.2: 5, 4.3: 5, 4.4: 4, 5.1: 4, 5.2: 3,
5.3: 4, 6.1: 4, 6.2: 4 (90 in all); every target has a locator. No LaTeX delimiters, pull-request
numbers, dates, machine paths, round labels or "optional/deferred" wording in the README (pattern
scan, no hit). No algorithm, no route-specific shortcut, no re-planned roadmap. Layers are named by
their mathematics; none after a source chapter.

Headline theorems (from the Summary): convergence of the two double-complex sequences for both
totalisations, comparison of totals and acyclic assembly; horseshoe and Cartan–Eilenberg existence
and lifting; comparison of `rightDerivedFunctorPlus` with `rightDerived`; the two hypercohomology
sequences and their duals; the composition criterion and the composite-functor sequence with its
low-degree sequences; Tor balance; universal-coefficient, Künneth and change-of-rings sequences;
Leibniz rule for page pairings; Bockstein pages, higher Bocksteins and convergence. There is no
`Suggested.lean` at this stage: no padding probe, no `#check @name` comparison and no import check
were possible or needed. For the package stage: the Tor balance (4.1) and the comparison 2.2(i) are
statable at the pins on native carriers; the convergence statements depend on the base's carriers.

### Copyright, arrangement, reuse

Wording compared at the fifteen sampled locators and at seven further passages (the
Cartan–Eilenberg definition against stacks-05QI line 3621–3629; the conditions `μ_n` against
may-primer line 249–256; the limit-pairing bullet against may-primer line 317–324; the summand rules
against hatcher-at line 13330–13337; the 1.5 route against stacks-012K line 3361–3364; the product
total against stacks-012K line 3400–3409; the contract sentence against stacks-012K line 3131–3140).
What coincides is formulae, lists of hypotheses and statements of a dozen words; no sentence or proof
plan follows a source clause by clause. No table, figure, exercise list or data is taken over.

Locators before the References: stacks-05QI 15, grothendieck1957 14, stacks-012K 12, weibel1994 11,
may-primer 10, stacks-more-algebra 7, cartan-eilenberg1956 5, mccleary2001 2, hatcher-at 1,
massey1954 1; 78 in all. Contents of stacks-05QI (line 7–46) set beside the layers: 2.1 ↔ §18,
2.2 ↔ §16, 2.3–2.5 ↔ §21, 2.6 ↔ §19, 3.1–3.2 ↔ §22: not the source's order, and Layers 1, 4, 5, 6
draw on other texts. The order of the layers is forced by the Needs lines quoted above.

Source independence: 22 passages compared with 6 sources, none shared; largest share stacks-05QI, 15 of 78 locators; contents compared with stacks-05QI: independent; weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 could not be read (settled uncertified).

## Not verifiable

- weibel1994 (§§1.2, 2.2, 2.7, 5.6–5.8), mccleary2001 (Ch. 2, 10), cartan-eilenberg1956
  (Ch. XV–XVII), massey1954: settled uncertified; statements, numbering and wording not checked
  against the texts. Their statements here were checked mathematically (table) where sampled.
- Elaboration, the one-tactic probe and the binder comparison: no `Suggested.lean` at the design
  stage, and this lane does not elaborate.
- Round 7's source-issue entries for stacks-05QI Lemmas 18.4, 18.7 and 22.1 were not re-read this
  round and are not repeated below.

## Source issues

- **Misprint** in may-primer at Example 2.3, printed p. 4: the source says a summand ℤ of the homology gives pages equal to ℤ in its degree; it should be 𝔽_p; affects a stated result.
- **Gap** in may-primer at Proposition 4.1, printed p. 7: the source says the condition of index n for a pairing corresponds to index n − 1 for the derived pairing, with no restriction on n; it should require n ≥ 1; affects a stated result.
- **Misprint** in stacks-05QI at Lemma 21.3, proof, printed p. 74: the source says the differential comes from the horizontal cohomology complex of index p resolving the cohomology in degree p; it should be index q throughout; affects the proof.

## For the human reviewers

- Not tested: weibel1994, mccleary2001, cartan-eilenberg1956 and massey1954 are recorded as uncertified in `packages/SpectralSequencesAndConvergencePartII/sources.toml`; 19 of 78 locators point to them, and their wording and arrangement were not compared.
- Licence: the `grothendieck1957` entry of `packages/SpectralSequencesAndConvergencePartII/sources.toml` is `operator-local` (a file the operator holds); its redistribution status was not assessed, and nothing from it is copied.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "be95cd0147cc151e345885da0a27d736e6e567cd", "job": "REV-DESIGN-SpectralSequencesAndConvergencePartII~8", "model": "fable", "worker": "chris-x55"} -->
