# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at 44c2b15)

**Verdict:** needs changes

This is an incremental re-review of the 44 lines changed since `48c3eb7`. All of them are in `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md`: Out of scope, the *Needs* line and the valuation-ring Check of 5.4, and Research context. `Suggested.lean` is unchanged.

Source ids used below:

- `GFM10`: González-Férez–Marín, *Glasg. Math. J.* 52A, the publisher's PDF, 9 pages, from the sources cache.
- `BV09`: Böhm–Vercruysse, arXiv:0710.1017v2, from the sources cache.
- `Zbl 1137.16010` and `Zbl 0928.16007`: the zbMATH Open reviews of González-Férez–Marín 2007 and Marín 1998, read this round through the zbMATH Open API.

All three previous findings are repaired. One new P3 finding is in the rewritten Research context.

## R01 (P3) — In Research context, "loc. cit., p. 83" follows the 2007 paper, which has no p. 83

**Location.** `README.md`, Research context, lines 1031–1032: "González-Férez and Marín (2007) answered no, by a ring with a monomorphism of firm modules that is not a kernel (loc. cit., p. 83)".

**Claim.** The work named just before "loc. cit." is González-Férez–Marín 2007, so the locator reads as p. 83 of that paper. The passage it means is in the 2010 paper.

**Witness.**

- References, lines 1088–1089: the 2007 paper is *J. Algebra* 318, pp. 377–392, so it has no p. 83.
- The statement is on p. 83 of the 2010 paper. At `GFM10` lines 37–39, its reference [3] (the 2007 paper, `GFM10` lines 404–405) gives a ring and a monomorphism of firm modules that is the kernel of no morphism.

**Repair.** Replace "(loc. cit., p. 83)" with "(González-Férez–Marín 2010, p. 83)". Tested: `GFM10` page 1, which is printed p. 83, carries that sentence at lines 37–39.

## Previous findings

- R01 — repaired: Out of scope now names "Marín's equivalence of closed modules and his characterisation of the Morita contexts that induce equivalences of firm modules (left acceptable contexts) (Marín 1998), left xst rings and the abelian category of their firm modules, and the González-Férez–Marín ring …". 5.4 *Needs* is "5.1 (left local units); Mathlib `Unitization`". The repair introduced R01 above.
- R02 — repaired: "Let `k` be a field and `V = ⋃_n k[x^(1/2ⁿ)]` localised at the maximal ideal `(x^(1/2ⁿ))` of each term, a union of discrete valuation rings each dominated by the next … value group `ℤ[1/2]`."
- R03 — repaired: the description's Layer 5 now reads "firm and unitary modules, which coincide over rings with local units; Morita contexts with surjective pairings, which give equivalences of firm modules (Kato–Ohtake)". Its Sources paragraph names Böhm–Vercruysse 2009 and González-Férez–Marín 2010.

## Verified sound

**Gate, dependency check, build.**

- My run of the gate at `44c2b15` with the candidate merge order gives: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  - Against the configured public order, the only extra line is `depcheck: NOT IN ORDER … (insert it after its last supplier)`. The candidate order lists the roadmap at line 331. The brief rules out "not in the merge order" as a finding.
  - The worker's gate on this head also reports `build=0`.
- The dependency check (`--movable`, candidate order, `--pr 2037`) prints `depcheck: 234 roadmaps, 2267 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/Suggested.lean` gives no errors. It gives exactly five warnings, `declaration uses 'sorry'`, at lines 80, 106, 119, 130 and 135.
- `git diff --quiet 48c3eb7 HEAD -- …/Suggested.lean` succeeds, so the Lean file is unchanged.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`, as the description says.

**Lean.** The eight entries of `signatures.md` match report ~5:

- `glAction` over `CommRing k`;
- the 2.2 headline over `[Field K] [CharZero K]`;
- `IsQuasiFree`;
- the nilpotent lift over `CommRing k`;
- the projective-dimension form over `[Field K]`;
- `isQuasiFree_freeAlgebra`;
- `not_isQuasiFree_mvPolynomial_fin_two`.

The eighth entry, `on` (structure, line 42), and "Unknown identifier `on`" are artifacts of the signature tool, because the file elaborates cleanly. No section binder is lost. The padding probe and the headline audit of the earlier reports stand. The docstring entry for 5.4–5.5 (line 50: tensor products over noncommutative, nonunital rings) still names the missing carrier of the changed targets.

**Changed passages, computed.**

- *5.4 valuation-ring Check.* For a field `k`, I recomputed the construction:
  - `k[t]_(t) ⊂ k[s]_(s)` with `t = s²`, and the second dominates the first. The union `V` is therefore a valuation ring with value group `⋃ 2⁻ⁿℤ = ℤ[1/2]`.
  - Every element of `m` is a unit times `x^q` with `q > 0`, so `m = m²`, and `m` is not principal.
  - `AM = (m² + xV)/xV = M`.
  - `a ⊗ vy = Σ bᵢ ⊗ (vcᵢ)y = va ⊗ y` for `a = Σ bᵢcᵢ`, so `A ⊗_A M = m ⊗_V M`.
  - Tensoring `0 → xV → m → M → 0` with the flat module `m` gives `m/xm`.
  - The multiplication map is the quotient `m/xm → m/xV`, whose kernel `xV/xm ≅ V/m = k` is nonzero.
  - For `k = ℤ/6`, the quotient by the `x^(1/2ⁿ)` is `ℤ/6`, and `2·3 = 0` shows that the ideal is not prime.
- *5.4 Needs.* The three bullets use `A ⊗_A M` through `Unitization` (Convention 8), `AM`, and local units from 5.1. None needs a two-sided-ideal carrier now that the monomial ring has left.
- *Out of scope.* It agrees with `Zbl 0928.16007`:
  - pairings that are epimorphisms give equivalences of closed modules (`M ≅ Hom_R(R, M)`) and of firm modules;
  - firm-module equivalence holds if and only if the context is left acceptable.

  It also agrees with `Zbl 1137.16010`:
  - "left xst" is the authors' term: the unitary modules are closed under submodules;
  - left xst holds if and only if every unitary module is firm, and the firm modules are then abelian;
  - for `k⟨x, y, z₁, z₂, …⟩/(xz₁, xz_n − z_(n−1)y)` the firm left modules are not abelian, and the firm right modules are.

  It is consistent with the targets:
  - 5.4's local-units bullet makes such rings left xst, by the 2007 criterion. 5.4 does not state it.
  - 5.5's last Check (`εℤ[ε]`, `φ = ψ = 0`, `a₁a₂ = 0 ∈ im φ`) fits Marín's criterion. 5.5 claims only the implication.
- *Research context.* `GFM10` supports each claim:
  - lines 30–31, p. 83: Quillen's question;
  - lines 37–39, p. 83: the 2007 negative answer, by a monomorphism that is not a kernel;
  - lines 147–160, Theorem 3, (1) ⟺ (4), page 4 of the PDF, printed p. 86: abelian if and only if the composite of two kernels is a kernel.

  Only the "loc. cit." of R01 is wrong.

**Sample and locators (5.4, 5.5).**

- `GFM10` lines 64–67, Definition 1, p. 84: firm and unitary modules.
- `BV09`:
  - lines 175–186, §1.1, p. 4: firm modules; unital rings, where firm means unital; Quillen's terminology; rings with local units are firm;
  - lines 421–423, Lemma 1.10, p. 9;
  - lines 522–528, Theorem 1.12, p. 11;
  - lines 556–561, Remark 1.13, p. 12.

  They match 5.4 and 5.5 as in report ~5.
- The other sampled targets (1.1–1.3, 2.1, 2.3, 2.6, 3.2, 4.1, 4.3, 4.4, 4.6, 5.1, 5.3, 5.6) are untouched. They were verified in the earlier rounds.
- The README flags no locator as unverified.

**Citations and ownership.**

- The changed passages cite no roadmap section. `overlaps.md` reports none. The one lead in `citations.md`, `IsQuasiFree.exists_lift_of_nilpotent`, is declared at `Suggested.lean` line 106.
- I ran `roadmaps grep` for "firm modules | left xst | acceptable context | González-Férez | Kato–Ohtake" over main and the open heads. Besides this roadmap, it finds:
  - PerfectoidSpaces P0.4 (almost mathematics; Scope already relates it);
  - ExoticMonoidalStructuresAndAbstractAutomorphicity (firm modules over the Bernstein centre, as a gap on SmoothRepresentationsOfLocalGroups);
  - SmoothRepresentationsOfLocalGroups.

  No roadmap owns Marín's criteria, the xst criterion or the 2007 ring, so naming them as out of scope leaves no second owner.
- The SmoothRepresentationsOfLocalGroups README at the head of #1688 (lines 81–84) still says that left xst rings "belong to the later roadmap CyclicHomologyLieHomologyAndQuasiFreeAlgebras §5.4". Report ~5 allowed this roadmap to decline xst, with the deferral corrected in that pull request. It is not a finding here, but that sentence needs changing there.

**Remarks on untouched text (no change requested).**

- The Mathlib contract (line 173) still lists `TwoSidedIdeal`, and no *Needs* line names it any more. The two-sided ideals of 3.2, 4.4–4.6 and 5.6 are its natural consumers.
- In 5.4's valuation-ring Check, `x` is both the indeterminate and "a nonzero `x ∈ m`". The argument is valid for either reading.

**Adversarial table.** The first five rows are for the changed statements, with values computed this round. The other rows are carried from report ~5, and through it from reports ~1–~4, for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 5.4 Check: unitary, not firm (field `k`) | `V = ⋃ k[x^(1/2ⁿ)]_(x^(1/2ⁿ))`, `A = m`, `M = m/xV`, `v(x) = 1`; `k = ℤ/6`; `k = ℤ` | value group `ℤ[1/2]`; `x^q = x^(q/2)·x^(q/2)` gives `m = m²`; `AM = M`; `A ⊗_A M = m/xm`; `x^(1/2) ⊗ x^(1/2) ↦ [x] = 0` in `M`, `[x] ≠ 0` in `m/xm` (values in `xm` are `> 1`); kernel `≅ V/m = k`; over `ℤ/6` the quotient is `ℤ/6` and `2·3 = 0`; over `ℤ`, `(t)` is prime and not maximal | holds; the field hypothesis is sufficient | — |
| 5.4 *Needs* | the three bullets | `A ⊗_A M` via `Unitization ℤ A`, `AM`, `e aᵢ = aᵢ` from 5.1; no quotient by a two-sided ideal | holds | — |
| Out of scope (Marín) | `Zbl 0928.16007`; 5.5's Checks | epimorphic pairings ⇒ CMOD and DMOD equivalences; DMOD equivalence ⟺ left acceptable; `(ℤ, 0, …)`: `1·1·⋯ = 1 ∉ im φ = 0`, not acceptable; `εℤ[ε]`: `a₁a₂ = 0 ∈ im φ`, acceptable | agrees; 5.5 is the surjective case | — |
| Out of scope (2007) | `Zbl 1137.16010`; `⊕_(n∈ℕ) ℤ` | xst ⟺ unitary modules hereditary ⟺ unitary is firm, then abelian; `k⟨x, y, z_n⟩/(xz₁, xz_n − z_(n−1)y)`: left not abelian, right abelian; `⊕ℤ` has local units, so it is xst | agrees with 5.4 | — |
| Research context | `GFM10` lines 30–31, 37–39, 156–160, 404–405 | question p. 83; [3] = *J. Algebra* 318, 377–392; mono not a kernel, p. 83; Theorem 3 on PDF page 4 = p. 86, (1) ⟺ (4) | content holds; "loc. cit., p. 83" points at the 2007 paper | R01 |
| 3.1 (coefficient complex) | `W = k[u, u⁻¹]/uk[u]`; `𝔽_p[x]`, `D = x d/dx` | `u·u⁻ʲc = u⁻ʲ⁺¹c`, `u·c = 0`; `L_D = m = 0` on `x^(m−1)dx` with `p ∣ m` | holds (report ~5) | — |
| 5.4 definitions | `A = 2ℤ`, `M = ℤ/2`; unital `A` | `A ⊗_A M = ℤ/2`, `AM = 0`, multiplication `0`; firm ⟺ unital (`BV09` line 180) | holds (report ~5) | — |
| 5.4: local units ⇒ firm | `A = ⊕ℤ`, `M = A/⊕_(n≥1)ℤ` | `e₀·1 = 1`; `Σ aᵢ ⊗ mᵢ = e ⊗ Σ aᵢmᵢ = 0` | holds (report ~5) | — |
| 5.5 statement and Checks | `(Ã, B̃, P, Q)`; `(ℤ, M₂(ℤ), ℤ², ℤ²)`; `(ℤ, 0, 0, 0)`; `εℤ[ε]` | restricted context `(A, B, P, Q, φ, ψ)`; `φ(e₁ ⊗ e₁) = 1`, `ψ(eᵢ ⊗ eⱼ) = Eᵢⱼ`; `0` against all abelian groups; both categories `0` | holds (report ~5) | — |
| 1.1 | `X = k♮`; `k → M₂(k)` | `Tor_n = k` for even `n`, `0` for odd; `1 ↦ tr I₂ = 2` | holds (report ~5) | — |
| 1.2 | `Ext⁰`; ground ring ℤ | `Hom(k♮, k♮) = k`; `ℤ[σ]`, `|σ| = 2` | holds (report ~5) | — |
| 1.3 | Δ against Λ | `|Λ([n], [0])| = n + 1`; `BΛ ≃ K(ℤ, 2)` | holds (report ~5) | — |
| 2.1 | `𝔰𝔩₂(ℚ)` | `d(e∧f∧h) = 0`; the unsigned formula gives `4h` | holds (report ~5) | — |
| 2.2 headline | `r = p = 2`; `p = 0` | `[gA E₁₂, gA E₂₁] = gA(E₁₁ − E₂₂)`; range all of `End K` | holds (report ~5) | — |
| 2.3 | `[x, y] = y` | coinvariant `H₂ = k`, `H₂(𝔤′) = 0` | holds (report ~5) | — |
| 2.4 | `k`; `k × k`; `k[ε]` | exterior algebra on degrees 1, 3, 5, …; primitives double; `dim HC₀(k[ε]) = 2 = dim H₁` | holds (report ~5) | — |
| 2.5 | `𝔽_p[x]`; `M₂(k)` | `[x^(p−1)dx] ≠ 0`; `tr[E₁₂, E₂₁] = 0` in `A/[A, A]` | holds (report ~5) | — |
| 2.6 | `A = k`, `n = 2`, `i = 0, 1, 2` | `H₁(𝔤𝔩₁) = k → H₁(𝔤𝔩₂) = k`; `H₂ = 0` on both sides | holds (report ~5) | — |
| 4.1 headlines | `n = 0, 1`; `A = 0, K, K[x], K[ε], K[x, y]` | `[].prod = 1` forces `R = 0`; projective dimensions `−∞, 0, 1, ∞, 2` against quasi-free yes, yes, yes, no, no | holds (report ~5) | — |
| 4.2 headlines | `FreeAlgebra k Empty`; `ℤ/2` over ℤ | `π 1 = 1`; `g(1 + 1) = 2 ≠ 0` in `ℤ/4` | holds (report ~5) | — |
| 4.4 | `k[x]`; `k[x, y]` | `H_*(X) = (k, 0)`; `[x dy] ≠ 0` against `HP₁ = 0` | holds (report ~5) | — |
| 4.6 | `J = A`; `k[x, y]/(xy) ⊃ (x)` | identity; `[x dy] ≠ 0` in bidegree `(1, 1)` | holds (report ~5) | — |
| 5.6 | `A = R`; `[[1,1],[0,0]]` against `diag(1,0)` | Euler characteristic onto `K₀(R)`; `(P − Q)³ = 0`, trace `0` | holds (report ~5) | — |
| 1.4, 3.2, 4.3, 4.5, 5.1–5.3, Conventions | as in reports ~3 and ~4 | e.g. `H_n(ℤ/2, 𝔽₂) = 𝔽₂`; `a ∘ 1 = a`; `A/A² = k` for zero multiplication | holds (report ~5) | — |

## Not verifiable

- Marín 1998 (*J. Pure Appl. Algebra* 133) and González-Férez–Marín 2007 (*J. Algebra* 318) are on ScienceDirect. The sources service treats DOI prefix 10.1016 as paywalled, and no arXiv or HAL copy was found. The README now names their results in Out of scope only, with no theorem number. I checked those names against `Zbl 0928.16007` and `Zbl 1137.16010` (zbMATH Open API). The direct zbMATH pages answer 403 to this client.
- The Wodzicki 1989 pages are unchanged text, as in the previous reviews.

## Source issues

- none
