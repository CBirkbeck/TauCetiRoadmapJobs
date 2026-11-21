# Review of HodgeTateLatticesAndLubinTateLogarithms (pull request #2904 at 31c6a26)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HodgeTateLatticesAndLubinTateLogarithms/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 22 lines changed since `dd1edbb`, and no finding remains. The false Check "Ordinary case: `S = 0`" of 0.5d is replaced by a true one (`S = 0` exactly when `r(τ∘c) = 0` at every `τ` over `w`; `S = 1/(p − 1)` for an ordinary elliptic curve), and the four small corrections of the previous review are repaired without new problems. One format note is carried over, not blocking. The locators into [FormalProof] and Hazewinkel's book are still unread, and the questions of scope and licence remain for the human reviewers.

## N01 — The numbering is borrowed from another roadmap

Unchanged from the previous review: the items of Layer 0 carry the section numbers of HodgeTateAndCanonicalSubgroups (0.5a–0.5h, 0.17a, 0.17b, 0.18a, and an item 2.4 inside Layer 0), and the second layer is "Layer 3" with no Layers 1 and 2. A reader looking for "2.4" finds it in Layer 0. Numbers of the roadmap's own would avoid this.

## Questions for the author

- 3.2 (a) is stated for the single type `p^{−1}σ²` with `q = p²`. Does the cited lemma (Hazewinkel, I.2 and II.10) give the several-variable statement for every type `Σ s_iσ^i` and every `q`? If so, would 3.2 state that form, with the type `p^{−1}σ²` as the case used? I could not read the book from a legal copy, so I could check neither the locators nor the generality. (Asked in the previous review; the text is unchanged.)

## Previous findings

- R01 — repaired: "It vanishes exactly when `r(τ∘c) = 0` for every `τ` at `w` … For an ordinary elliptic curve with `𝒪 = ℤ` and `c = 1`, `r = 1` and `S = … = 1/(p − 1)` … the bound of (a) is not sharp there."
- C01 — repaired: the Check of 0.5c now derives independence of the order from (c), and restricts the isomorphism over `ℓ₁` to "If the order is étale over `ℤ` at `ℓ₁`".
- C02 — repaired: "`(a + pb)^{p^{2k}} ≡ a^{p^{2k}} (mod p^{2k+1})` (`a`, `b` integral, `k ≥ 0`; modulo `p³` for `k = 1`)".
- C03 — repaired: "integral iff the quotient `F^σ(X^p)/F^p` of its Frobenius twist by its `p`-th power is `≡ 1 (mod p)`".
- C04 — repaired: the routes of 0.5d (b) and 0.5e say `deg` ("the degree of 0.5h") throughout; no bare "length" is left in the README.
- N01 — not repaired: written again above as a format note.
- Second question (normality of `T` in 0.5h (6) against 0.5d) — answered: 0.5d now says the degeneration data are those of ShimuraCompactifications §6.4, "which take `T` normal", and that for an abelian scheme `T` need not be normal.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 0.5d, second Check (rewritten) | ordinary elliptic curve, `𝒪 = ℤ`, `c = 1`; all `r(τ∘c) = 0` at `w` | `S = Σ_{i≥0} p^{−(i+1)}·1 = 1/(p − 1)`; colength `0`; (b): `x(τ) − x(τ∘c) = 1/(p−1) − 1/(p−1) = 0`. `S = 0` ⇒ `∏\|c_i\| ≥ 1`, all `c_i` units | holds |
| 0.5d, same Check, multiplicative-type clause | dual of the `w`-part under `λa = c(a)^∨λ` | dual is the `c(w)`-part, dimension `Σ_{τ at c(w)} r(τ) = Σ_{τ at w} r(τ∘c)`; zero iff dual étale iff `w`-part multiplicative | holds |
| 0.5c, second Check (rewritten) | `X₁₂` (first `ℓ₁`, then `ℓ₂`) against a normal dominant `X″` with all lattices locally free | `X″ → X₁` unique by (c) for `{ℓ₁}`; then `X″ → X₁₂` unique by (c) for `{ℓ₂}` over `X₁`; pulled-back locally free image stays the image (kernel torsion in a torsion-free sheaf) | holds |
| 0.5d, statement and supplier contract (parenthesis on §6.4) | ShimuraCompactifications on main, lines 1522, 1621, 1648, 1673 | (6-a): noetherian normal domain complete for a radical ideal; §6.4 "Assume (6-a)"; a complete normal local `T` with `I = 𝔪` satisfies it | agrees |
| 3.2 (a), route congruence | `p = 2, k = 1, a = b = 1`; `p = 3, k = 1, a = b = 1` | `3⁴ − 1 = 80 = 2⁴·5`, divisible by `2³`; `4⁹ − 1 = 262143 = 27·9709` | holds |
| 3.3, route criterion | `F = 1 + X`; `F = exp(X)` | `(1 + X^p)/(1 + X)^p ≡ 1 (mod p)`; `exp(X^p − pX)`: coefficient of `X` is `−p`, of `X^p` is `1 + (−p)^p/p!`, not `≡ 0`, and `exp(X)` is not integral | holds in both directions |
| 0.5d (b), 0.5e routes (`length` → `deg`) | `ω_{B[p]_w} = (O/p)^{d_w}`; `Õ/O[α]` | `deg = d_w`; `deg(Õ/O[α]) = v(D)/2 = n·vd/2` (Vandermonde determinant is a square root of `D`) | holds; wording only |

The rows for the statements the change does not touch stand as in the previous review, of `dd1edbb`.

- Source locators checked against the text: 0 new (no changed passage adds a locator into a readable source); the new citation of ShimuraCompactifications §6.4 and its hypothesis (6-a) was read on main.
- Library declarations opened at the pin: none new; the Lean file did not change.
- Cross-roadmap citations resolved: 2 in the changed passages (ShimuraCompactifications §6.4 and §§6.3–6.5 with (6-a), on main); the in-roadmap references of the changed Checks (0.5b first Check, 0.5c (b) and (c), 0.5h degree) were read at this head.
- Automatic checks: all passed. Dependency check: `depcheck: 170 roadmaps, 1992 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings and nothing else.
- No file changed outside the folder since `dd1edbb`; against the base, only the family index besides the folder.
- The pull request's title and description agree with this head: the change adds no supplier (ShimuraCompactifications was already listed), removes no section and touches no Lean declaration.

Overlap check: read TaylorBoundsAndDepthsOnHeightTwoFormalGroups, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ShimuraCompactifications, ArakelovGeometryAndAbelianHeights, FiniteFlatGroupsAndIntegralPadicHodgeTheory; nothing shared (as in the previous review; the change adds or moves no object, and no open pull request changes this roadmap or drops an id it cites).

Source independence: changed passages only: 7 changed passages read, none shared with a source (the two readable sources, SchneiderTeitelbaum2001 and Announcement, are not cited in them); largest share FormalProof, 29 of 32 locators; contents not compared with FormalProof, whose text and table of contents could not be read; no layer added, removed or reordered.

Research link: Layer 0 extends Fargues' cokernel bound (2010–2011) and the modified Hodge bundle of Pilloni–Stroh to `p = 2` and to eigen-lattices; Layer 3 uses Hazewinkel's functional-equation lemma (1978) and the Schneider–Teitelbaum period (2001). Both feed the family built on Alpöge's announced formalization (2026). Rests on the README and its suppliers.

## Not verifiable

- The 29 file and declaration locators into [FormalProof]: the repository named in the References is not on a host I may read from, and no local copy is held.
- The sentences on what [FormalProof] states (factor `4` at `p = 2`, modulus `2^{R−2}`, `q = p²` in 3.1, sign `s = 1` in 3.4, odd `p` in 3.2): same reason.
- 3.2: Hazewinkel, *Formal groups and applications*, I.2, II.10 and §2.2 (the locator of the congruence repaired here): no legal copy found; the congruence itself was computed, its locator was not checked.
- Katz–Mazur (Checks of 0.17a and 0.5c): cited without chapter or theorem number; not opened.

## Source issues

- none

## For the human reviewers

- Scope: the source of 29 of 32 locators is [FormalProof], an unrefereed Lean formalization announced on 20 November 2026 with no written account (Announcement lines 45–49). The bound at `p = 2` and 0.5d–0.5h, 0.17b, 3.4–3.6 have no refereed source.
- Licence: the README gives [FormalProof] as a GitHub repository; the announcement's footnote (Announcement line 53) gives archives on the author's page instead. I could read neither, and found no licence statement.
- Licence: the docstrings of `smul_mem_span_cotangentMap_groupLike` and `twistedLog` name the [FormalProof] declarations they follow (`smul_dUnit_mem`, `genLog`); whether the Lean is adapted from them could not be checked.
- Not tested: wording and arrangement were not compared with [FormalProof], the source with the largest share of the locators; nor with Hazewinkel's book.
