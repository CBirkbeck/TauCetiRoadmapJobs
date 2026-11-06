# Review of SpringerResolutionAndCharacteristicCycles (pull request #1828 at 943f769)

**Verdict:** needs changes

Incremental re-review of the 67 lines changed since ff27628. One finding remains, carried from the previous review: the README side of R01 is done, but the package's plan still registers only the old compound gap, so the three new ReductiveGroups contracts are not declared where the intake reads them. R02 is repaired. The gate, the dependency check and the elaboration pass; every locator of a changed passage resolves in BHS19; the four split contracts are precise, minimal against ReductiveGroups on main, and consumed by the targets they name.

## R01 (P2) — The three new ReductiveGroups contracts are not registered in the plan's gaps, whose `lie-invariants` entry is still the compound sentence

Location: `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md` lines 64, 66 and 68, "What ReductiveGroups must provide (gap:regular-borel-torsor): …", "(gap:lie-isogeny-forms): …", "(gap:root-wall-regularity): …"; and `packages/SpringerResolutionAndCharacteristicCycles/design/plan.json`, top-level `gaps`.

Claim: a contract stated under `## Exact supplier contracts` counts as declared only when the plan's `gaps` list carries the same slug, since the intake announces gaps to the supplier from the plan. The README now states seven slugs; the plan lists four (`lie-invariants`, `associated-bundle-descent`, `local-geometric-comparisons`, `derived-bimodule-sheaves`), and its `lie-invariants` entry still carries the four-clause `needs` the previous review found compound ("…the arbitrary-field Lie Jordan and centralizer-dimension comparisons needed in §§2.2–2.3, the regular-semisimple Borel W-torsor and quasi-finiteness …; supply invariant symmetric forms … the rank-one centralizer/root-vector regularity …") with `section` "Layers 2, 3, 7–9 (Part II extension)", whereas the README line 70 now assigns the Jordan and centralizer comparisons to Layers 2 and 7 only.

Witness: the slugs in the README (`grep -o 'gap:[a-z0-9-]*'`, unique) are seven; the plan's `gaps` has four entries, and `regular-borel-torsor`, `lie-isogeny-forms`, `root-wall-regularity` occur in no plan entry. Checked on the board package at its current head and on the jobs repository's main branch; the pull request's own diff touches only README.md and Suggested.lean, and the repair reply to the previous review (H01, "applied differently") does not mention the plan.

Carried from R01 of the previous review: the README half of its repair is done; the plan half is not.

Repair (an edit of the package's plan on the board, not of this pull request; no README or Lean change is needed): in `plan.json`'s top-level `gaps`, (a) replace the `needs` of `lie-invariants` by the README line 62 sentence and its `section` by "Layers 2 and 7 (Part II extension)"; (b) add three entries, each with `supplier` "ReductiveGroups" and `needs` equal to the README sentence of its slug: `regular-borel-torsor` with `section` "Layer 7 (Part II extension)", `lie-isogeny-forms` with `section` "Layers 8–9 (Part II extension)", `root-wall-regularity` with `section` "Layer 7 (Part II extension)". After that the seven README slugs and the plan's slugs coincide and nothing else in the plan changes.

## Previous findings

- R01 — partly repaired: README lines 62–70 now state four one-sentence contracts, each naming its consumers (§§2.2–2.3; §2.3; §§4.2, 4.3, 6.1, 6.3; §5.3), and the `*Needs:*` lines of §§2.2, 2.3, 4.2, 4.3, 5.3, 6.1, 6.3 and the Layer 2, 4, 5, 6 Dependencies name the slug each uses; the plan's `gaps` still has the single compound `lie-invariants` entry (see R01 above).
- R02 — repaired: §6.5 "Scheme comparison for the Steinberg fibre product" is deleted; §6.4 now says "Whether the scheme fibre product 𝒩̃×_𝒩𝒩̃ is itself reduced is not asserted; every cycle statement below is about the reduced Z, and the Steinberg display of BHS19 is read in the reduced-variety convention"; old §6.6 is §6.5, and its five citations (§§7.1, 9.9, 11.2, 11.4, 14.2 `*Needs:*`) and the Lean docstring ("§§6.1–6.5") follow; no "§6.6" remains.

## Verified sound

**Gate, dependency check, build.** The gate rerun on this head from the pull-request worktree: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the worker's gate at 943f769 also has `build=0`). The dependency check with `--movable` printed `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`: no UPWARD or CYCLE line; the roadmap is line 249 of the merge order, after ShimuraData (107) and FormalConnectionsOpers (40). `lake env lean` on `Suggested.lean` exited 0 with no output in 4.5 s: the file still declares nothing (one `import Mathlib`, the module docstring, an empty namespace), so there is no `sorry` warning and no `#check` comparison to make. `git diff --stat origin/main...HEAD` outside the folder is empty.

**The changed passages against their sources.** BHS19 line 458–459 states the characteristic range (0 or p > h) the four contracts repeat; Proposition 2.1.1 and the definitions (2.1)–(2.2) at lines 465–482 (§§2.2–2.3); Proposition 2.3.3 at line 645 with `A = ℤ_(p)` at lines 685–690 (§4.3); Lemma 2.3.4 at lines 711–716, `κ₂,w = Ad(w⁻¹)∘κ₁,w` (§6.1's locator); Theorem 2.3.6 at lines 763–772 (§5.3's root-wall step is inside its proof, as the previous report checked); the reduced definition (2.11) of `Z` at lines 826–832 followed by the display `Z ≃ Ñ ×_N Ñ` at line 834 and `G ×ᴮ u ≅ Ñ` at line 838 (§6.4's new sentence reads that display in the reduced-variety convention, which is exactly how the source defines `Z`); Proposition 2.4.1 at lines 844–847 (§6.5) and Remark 2.4.2 at 848–850 (no CM claim for `Z_w`, as §6.5 says). The 15 seeded targets fall outside the diff except §6.1, whose only change is its `*Needs:*` slug; its locators (Lemma 2.3.4, beginning of §2.4) resolve as above.

**The four contracts against ReductiveGroups on main.** Layer 2 (line 227) is the Lie algebra and adjoint representation; Layer 7 (line 627) structure theory with the split root data; Layer 8 (line 1023) classification and central isogenies; Layer 9 (line 1092) Chevalley–Demazure models over ℤ. Layer 11C (lines 2057–2075) proves, over ℂ only, that the Lie regular-semisimple locus is the set of conjugates of `𝔱_reg` with torus centralizer and `W`-orbit intersections, and says the Killing form of a reductive `𝔤` need not be nondegenerate; Layer 11F (line 2150) transports Lie algebras and flags under central isogenies, again over ℂ. Nothing on main states these over an arbitrary field of characteristic 0 or p > h, the Borel-finiteness of a regular element, or the root-wall regularity; so none of the four gaps asks for what is provided, and each names one supplier layer group consistent with the README line 70. The README cites Layers 11C–11D for the complex case separately (line 60), so the contracts do not duplicate them.

**Consistency of the split.** Each `*Needs:*` line names only the contract its route uses: §2.2 (Jordan decomposition and centralizer dimensions) and §2.3 (both the centralizer comparisons and the Borel finiteness/W-torsor, with the route sentence saying which contract gives which) cite `lie-invariants` and, for §2.3, `regular-borel-torsor`; §4.2 (invariant form to pass from BR's coadjoint `𝔤*` to `𝔤`), §4.3 (replacing `G` by `G_der^sc × Z(G)°`), §6.1 (the form and the central-isogeny comparison of quotient ideals) and §6.3 (matching the form with NilpotentOrbits N7) cite `lie-isogeny-forms`; §5.3 cites `root-wall-regularity`. §6.3's added "§6.1" is a downward citation (the form is fixed there). The Scope paragraph (line 21) counts four contracts.

**Adversarial table.** New rows for the changed statements, then the previous report's rows for the untouched statements.

| Statement | Instances | Values each side | Result |
|---|---|---|---|
| `gap:lie-invariants`: Jordan decomposition over every field in the range, centralizer-dimension comparisons | `GL_n`, p > n = h, any k; negative control p = h: `GL₂` over `𝔽₂(t)`; SL₂ `E₁₂` | an irreducible factor of a minimal polynomial is inseparable only if its degree is a multiple of p, and every factor has degree ≤ n < p, so `x_s` is a polynomial in `x` over `k`; at p = 2 = h the companion matrix of `T² − t` has `x_s = √t·I ∉ 𝔤𝔩₂(𝔽₂(t))`, so the characteristic bound is needed; `dim Z(E₁₂) = 1 < dim Z((E₁₂)_s) = dim Z(0) = 3`; the README's loci are geometric (Conventions line 27), so the decomposition is used after extension | sound |
| `gap:regular-borel-torsor`: finitely many Borels through a regular element; Borels containing the centralizer torus of a regular semisimple element form a W-torsor | SL₂: `E₁₂`, `diag(1,−1)`, 0 | Borels through `E₁₂`: 1 (stabilizer of `ke₁`); through `diag(1,−1)`: 2 = |W|; through 0: all of `P¹` (0 is not regular, dim Z = 3), so regularity is needed for finiteness | sound |
| `gap:lie-isogeny-forms`: nondegenerate invariant form with a chosen central form; isogeny comparisons of degree invertible in k, including `G_der^sc × Z(G)° → G` | `GL₂`; `SL_n`-type centre | trace form on `𝔤𝔩₂` nondegenerate, Killing form `κ(I,I) = 0`; `SL₂ × G_m → GL₂` has degree 2, invertible for p > h = 2; the kernel of `G_der^sc × Z(G)° → G` projects injectively to `Z(G_der^sc)`, whose order (`n` for `SL_n`, ≤ 4 in the other types) is < p when p > h | sound |
| `gap:root-wall-regularity`: `z + c·e_β` regular for z on exactly one wall α, c ≠ 0, β = ±α | GL₃ `diag(a,a,c) + E₁₂`, `+ E₂₁`, a ≠ c; `aI + E₁₂` (every wall); SL₂ `cE₁₂` | centralizer of `aI₂ + E₁₂` in `𝔤𝔩₂` has dim 2, plus `𝔤𝔩₁`: 3 = r; transposed root vector the same; on all walls, `Z(aI + E₁₂) = Z(E₁₂)` in `𝔤𝔩₃` has dim 5 > 3, not regular, so "exactly one wall" is needed; SL₂ `z = 0`, `Z(cE₁₂)` dim 1 = r | sound |
| §2.3 route: which contract supplies which input | SL₂ | centralizer comparison (lie-invariants): `dim Z(diag(1,−1)) = 1`; Borel count (regular-borel-torsor): 2 = |W| over regular semisimple, 1 over `E₁₂` (ramified, generic degree 2 not birational) | sound |
| §6.4 new sentence: `Z ≅ (Ñ ×_𝒩 Ñ)_red`, no reducedness of the scheme fibre product asserted | SL₂; BHS19 (2.11) and line 834 | `Z = Z_e ∪ Z_s`, dims 2 and 2, meeting in the diagonal `P¹`; source defines `Z` reduced before the display; the README asserts nothing about `Q = Ñ ×_𝒩 Ñ` itself and no later target cites reducedness of `Q` | sound |
| §6.3 citing §6.1 for the form | SL₂ trace pairing | `E₂₁` pairs with `E₁₂` to 1; with twice the form the functional is `E₁₂/2`; §6.1 fixes "a chosen form on the centre" | sound |
| Renumbering §6.6 → §6.5 | the README and Lean docstring | 5 `*Needs:*` citations now "§6.5", 0 occurrences of "§6.6"; docstring "§§6.1–6.5" | sound |
| Conventions: `L_B(ρ)` for SL₂ (previous report) | `[g,x] ↦ x·g e₁` on `G ×ᴮ k_ρ` | tautological `O(−1)`; opposite relation gives `O(1)` | sound |
| Conventions: `κ₂ = w⁻¹κ₁` (previous report) | GL₃ 3-cycle, `z = diag(1,2,4)` | `Ad(w⁻¹)z = diag(2,4,1)`, `Ad(w)z = diag(4,1,2)` | sound |
| Conventions: KL matrix (previous report) | SL₂ rows `e, s` | `m_{s,e} = P_{e,s}(1) = 1`, `m_{e,s} = P_{s,e}(1) = 0` | sound |
| Conventions: `Li*δ[−1]` (previous report) | `i : {0} → A¹` | `Tor₀ = 0`, `Tor₁ = kδ`, `H⁰(K[−1]) = k` | sound |
| §1.3–1.4 orbit dimension (previous report) | SL₂ `e, s`; torus | 1, 2; torus 0 | sound |
| §1.5 intersection of subbundles (previous report) | `k[ε]/ε²` | intersection `(ε)(1,0)`, not a summand | sound |
| §2.1–2.3 dimensions and degrees (previous report) | SL₂ | `g̃` dim 3; fibres 2, 1, `P¹`; `|W| = 2` | sound |
| §2.2 regularity (previous report) | SL₂ `E₁₂`, 0, `diag(1,−1)` | centralizer dims 1, 3, 1 | sound |
| §3.4 bundle rank (previous report) | SL₂ | fibre dims 2, 1; totals 3 = D | sound |
| §3.7 lci count (previous report) | SL₂ | ambient dim 5, 2 equations, components dim 3 | sound |
| §4.2 dualizing sheaf of `X_s` (previous report) | SL₂ | `ω_{X_s} = O(−1,−1)`; twist `(ρ,ρ)` gives `O(−1,−1)`, untransported gives `O(1,1)` | sound |
| §4.2 product order (previous report) | BR12 line 233 | `K ⋆ L` here is BR's `L ⋆ K`; `X_u = Z_{u⁻¹}` | sound |
| §4.2 regular weights (previous report) | A₁, p = 3 | `ν = 0, 2ρ` regular; `ρ, 4ρ` singular | sound |
| §4.3 flatness insufficient (previous report) | `Spec ℤ_(p) ⊔ Spec ℚ[x,y]/(x²,xy)` | flat, CM special fibre, generic depth 0 | sound |
| §4.4 miracle flatness (previous report) | `Spec k ⊔ A¹ → A¹` | `0 ≠ 1 + 0` at the isolated point | sound |
| §5.3 root-wall regularity (previous report) | GL₃ `diag(a,a,c) + E₁₂` | centralizer dim 2 + 1 = 3 | sound |
| §5.4 / §13.4 fixed space (previous report) | `w⁻¹z = v⁻¹z` | `z ∈ ker(wv⁻¹ − 1)` | sound |
| §6.1 nilpotent fibre (previous report) | PGL₂, GL₂ | cone `a² + bc = 0`; Killing form kills scalars | sound |
| §6.3 sign (previous report) | conormal to the diagonal orbit | zero locus `ψ₂ = −ψ₁` | sound |
| §6.4/6.5 Steinberg components (previous report) | SL₂ | `Z_e`, `Z_s` dim 2, meet in `P¹` | sound |
| §7.3 zero-fibre cycle (previous report) | SL₂ | `[X̄_s] = [Z_e] + [Z_s]` | sound |
| §8.4 graded exactness (previous report) | `0 → D/Dx → D/Dx² → D/Dx → 0` | lengths 1, 2, 1 | sound |
| §8.6 all-component additivity fails (previous report) | `D_{A¹} ⊕ O_{A¹}` | `CC = [A²]` vs `[A²] + [ξ=0]` | sound |
| §9.1 right structure on `ω` (previous report) | `A¹` | `dx·∂ = 0`; `𝔻(O) = O` | sound |
| §9.7 irregularity (previous report) | `∂e = e` at ∞ | pole order 2 | sound |
| §9.9 non-connected H (previous report) | `ℤ/2` on two points | `O_Y` simple equivariant, not `D_Y`-simple | sound |
| §10.1 global operators (previous report) | torus; reductive centre | `χ₀` kills `𝔷`; torus gives `k` | sound |
| §10.4 / §11.1 labels (previous report) | SL₂ | `CC(M_e) = [Z_e]`, `CC(M_s) = [Z_e] + [Z_s]` | sound |
| §11.1 top Borel–Moore (previous report) | `T*P¹` | `H₄ = 0`, `H₄^BM = ℚ` | sound |
| §11.3 inversion (previous report) | unitriangular `Q` | `m_{w,v} = P_{w₀w,w₀v}(1)` | sound |
| §11.3 DR stalks (previous report) | SL₂ fixed point | χ = 1, −1, 0 ⟹ `m_{s,s} = m_{s,e} = 1` | sound |
| §11.3 A₃ example (previous report) | `w = s₂s₁s₃s₂`, `y = s₂` | `P = 1 + q` | sound |
| §12.1 converse string (previous report) | `⟨λ,α∨⟩ = −m < 0` | `e f^{k+1} v ≠ 0` for all k | sound |
| §12.1 SL₃ weight (previous report) | `w = s₁` | pairings 0, −3 | sound |
| §12.2 refutation of first-flag translation (previous report) | SL₂ `w = e` | `(ke₂,ke₂,0) ↦ (k(e₁+e₂),ke₂,0) ∉ Z_e` | sound |
| §12.2 saturation and fibres of `f_w` (previous report) | SL₂, SL₃ | `Z_{s₁}` dim 6 = 2N, depends on the plane only | sound |
| §13.1–13.2 Cartan fibre product (previous report) | SL₂; char 2 aside | `k[x,y]/(x²−y²)`, two graphs | sound |
| §13.3 detection (previous report) | completed normal domain | faithful flatness descends `I_w = I_{w′}` | sound |
| §13.4–13.5 tangent bound (previous report) | SL₂, torus | sums 3 = D; torus r | sound |
| §14.1–14.4 completion (previous report) | node `y² = x²(1+x)` | `2 = 1 + 1` on two branches | sound |
| Degenerate cases (previous report) | trivial group, torus | `F = pt`, `g̃ = t`, `X = t`, `Z = pt`; §5.3 has no instance | sound |

**Shape.** Unchanged from the previous report except the deletion of §6.5: Layer 6 still ends with `### Examples` and `### Dependencies`; §6.4 keeps four Checks and its API list; the contracts are stated in the supplier's subsection in the `What <Supplier> must provide (gap:<slug>)` form; no process words, pull-request numbers or LaTeX in the diff. `Suggested.lean` is unchanged apart from the docstring range.

## Not verifiable

- G86 (Ginzburg 1986) and KT84 (Kashiwara–Tanisaki 1984): settled as uncertified, cited by locator in §11.1; untouched by the diff.
- Hum08 §8.4 and KL80: paywalled, cited by bibliographic data; untouched.
- Whether the scheme fibre product `Ñ ×_𝒩 Ñ` is reduced: no cached text states it; after the repair the README asserts nothing about it (§6.4), so nothing depends on it.
- Rationality over an imperfect field of the Jordan decomposition requested by `gap:lie-invariants` was verified only for the classical groups by the degree argument in the table; for the exceptional types it is the supplier's statement to prove, and this roadmap uses the decomposition geometrically.

## Source issues

No new source mistake was found at the locators re-checked this round (BHS19 lines 458–482, 642–650, 683–690, 708–716, 758–772, 822–850); the seven items of the previous report stand.

- none
