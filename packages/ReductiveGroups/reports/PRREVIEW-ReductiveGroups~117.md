# Review of ReductiveGroups (pull request #2530 at 7e741b5)

**Verdict:** accepted

**Summary.** Accepted. Both findings of the previous round are repaired, and so are its three corrections and two notes:
- §9B.6 now states the quotient `O(q)/SO(q) ≅ ℤ/2ℤ` only for even rank `l ≥ 2`;
- §9B.5 now builds `GSp₂ₘ` itself, so ArithmeticGaloisRepresentations is only a consumer.

The repairs add no false statement. Each new piece was checked by computation: the `GSp₂ₘ` Hopf ideal, the similitude Dickson invariant with `GSO = {det g = cⁿ}` over `R[1/2]`, the fppf splitting through LefschetzPencilsAndVanishingCycles' normal form, and the spinor norm defined through lifts to `GSpin`. There is one small correction (the Downstream consumers list lacks ArithmeticGaloisRepresentations §7.3) and one format note (a locator for the similitude Dickson invariant), neither blocking. Nothing is left for a human to decide.

## C01 — ArithmeticGaloisRepresentations §7.3 is not in the Downstream consumers list that the scope points to

Whoever next revises §7.3 or its consumers would look in Downstream consumers for what must now cite §9B.5, and would not find §7.3 there.
- The scope paragraph names ArithmeticGaloisRepresentations §7.3 as a consumer of §9B.5 (line 23).
- Seven lines later (line 30) it says that the roadmaps that plan objects of §§9B.5–9B.7 are "listed under Downstream consumers below".
- The Downstream consumers paragraph on §§9B.5–9B.8 (lines 6666–6684) does not name ArithmeticGaloisRepresentations.

The omission matters because §7.3 on main still constructs *SimilitudeGroup.GSp* itself (`TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`, lines 4616–4619). Two open roadmaps take `GSp` from it: ClassicalGroupsPartII (README line 75) and ArithmeticStatisticsPartVIII (the *Needs* line at README line 899).

Adding "ArithmeticGaloisRepresentations §7.3 (*SimilitudeGroup.GSp*, the similitude group of `−Matrix.J`, from §9B.5)" to the sentence listing the roadmaps that plan objects of §§9B.5–9B.7 would close the gap.

## N01 — The similitude Dickson invariant and `GSO(q) = {det g = cⁿ}` over `R[1/2]` (lines 4943–4947) carry no locator

Conrad, *Reductive Group Schemes*, (C.3.1) and Remark C.3.11, pp. 327–328, gives the same homomorphism `GO(q) → ℤ/2ℤ` extending `D_q` and identifies its kernel with `GSO(q)`. Conrad builds it through `C(V, q) ≃ C(V, uq)` and descent rather than through `even.lift`, so that locator could follow the construction.

## Previous findings

- R01 — repaired: "for even `l ≥ 2`, `O(q)/SO(q) ≅ ℤ/2ℤ`" (§9B.6, line 4951).
- R02 — repaired: "Define `GSp₂ₘ` as the closed subgroup scheme of `GL₂ₘ × 𝔾_m` of pairs `(h, r)` with `hᵀ J h = r J`" (line 4867). ArithmeticGaloisRepresentations is now named only as a consumer (line 23), and its supplier contract and *Needs* entries are gone.
- C01 — repaired: "For `l ≥ 3`, `Spin(q)` is the derived group of `GSpin(q)` and is semisimple and simply connected" (line 5066).
- C02 — repaired: "étale locally it is `Σ_{i ≤ n} x_i x_{i+n}`, plus `λx²` … (the normal form of LefschetzPencilsAndVanishingCycles §2.1), and adjoining `√λ`" (lines 4962–4965). The *Needs* line (line 4997) and the supplier contract (line 1210) now carry the normal form too.
- C03 — repaired: "kernel of the spinor norm `SO(q)(F) → F^×/F^{×2}`, `g ↦ ν(h)` for any lift `h ∈ GSpin(q)(F)`" (line 5061).
- N01 — repaired: "the equivalence that roadmap proposes as *VanishingCycles.lisseMonodromyEquiv*" (line 5491).
- N02 — repaired: "a similitude `(g, c)` induces the automorphism `vw ↦ c⁻¹ g(v) g(w)` of `C₀(q)`" (lines 4944–4945).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §9B.6 `O(q)/SO(q) ≅ ℤ/2ℤ` for even `l ≥ 2` (line 4951) | `q = xy` over `ℤ`; over `𝔽₂`; `l = 0` | `O₂ = 𝔾_m ⋊ ⟨swap⟩`, `SO₂ = 𝔾_m`, quotient `ℤ/2`; over `𝔽₂` the swap has `D_q = 1`; `l = 0` excluded | holds (R01 repaired) | none |
| §9B.5 `GSp₂ₘ` Hopf ideal (lines 4867–4870) | comultiplication, antipode, counit; `m = 0, 1` | `Δ = h₂ᵀ(h₁ᵀJh₁ − r₁J)h₂ + r₁(h₂ᵀJh₂ − r₂J)`; `S = −r⁻¹h⁻ᵀ(hᵀJh − rJ)h⁻¹`; `ε = 0`; `GSp₀ = 𝔾_m`; `m = 1`: `r = det h` | holds | none |
| §9B.5 group = AGR §7.3 *SimilitudeGroup.GSp* (line 23) | conventions; Mathlib `Matrix.J` | AGR `gᵀJg = νJ`, `J = −Matrix.J`; Mathlib `J = fromBlocks 0 (−1) 1 0`; `hᵀJh = rJ ⇔ hJhᵀ = rJ` as `J⁻¹ = −J`; AGR needs rank `> 0` | holds for `m ≥ 1` | none |
| Supply direction (previous R02) | AGR mentions in README; dependency check | AGR only at line 23, as consumer; `depcheck: 200 roadmaps, 2230 edges, 0 problem(s)` | repaired | C01 (consumer list) |
| §9B.6 similitude Dickson invariant (lines 4943–4947) | `EvenHom` laws; `q = xy` over `ℚ`: `diag(a,b)`, `antidiag(a,b)`; scalar `(s, s²)` | `f(v,v) = c⁻¹q(gv) = q(v)`; `f(m₁,m₂)f(m₂,m₃) = q(m₂)f(m₁,m₃)`; `ef ↦ ef`, `det = c`; `ef ↦ fe`, `det = −c`; scalar trivial | holds | N01 |
| `GSO(q) = {det g = cⁿ}` over `R[1/2]` | fppf-local `c = s²`; `q = xy` over `𝔽₂` | `det(s⁻¹g) = c⁻ⁿ det g`, then `det = (−1)^{D_q}`; over `𝔽₂` the swap has `det = 1 = c`, `D = 1`, so `R[1/2]` is needed | holds | none |
| §9B.6 fppf splitting (lines 4962–4966) | `l = 1`; `l = 3` over `𝔽₂(s)`, `λ = s` | `λx² ↦ x²` by `x ↦ x/√λ`; `𝔽₂(s)(√s)` purely inseparable: fppf, not étale; LPVC lines 1535–1538; conrad-rgs line 12685 | holds (C02 repaired) | none |
| §9B.7 spinor norm (lines 5058–5063) | `x² + y²` over `ℚ`, rotation by 90°; `xy` in characteristic 2 | lift `1 + i`, `ν = 2` nonsquare, no `w ∈ ℚ(i)` with `w² = i`; `h = t·ef + fe`, `ν = t`, `Spin → SO` is squaring | holds (C03 repaired) | none |
| §9B.7 agreement with OrthogonalSpinGroups' `θ` | `g = s_v s_w` | lift `h = vw`; `τ(h)h = wvvw = q(v)q(w)`; their `θ(τ_vτ_w) = [Q(v)Q(w)]` (their line 158) | holds | none |
| §9B.7 `Spin` derived group for `l ≥ 3` (line 5066) | `l = 3`; `l = 2` | `GSpin₃ ≅ GL₂`, derived `SL₂ = Spin₃`; `l = 2` excluded: derived group 1, `Spin₂ = 𝔾_m` | holds (C01 repaired) | none |
| LPVC supplier contract (lines 1206–1215) | even and odd rank; rank 0 | `Σ_{i≤m} x_i x_{i+m}` (`+ λx²`) as in LPVC lines 1535–1538; zero form excluded (their line 1531) | holds | none |

The rows for untouched statements, including the seeded sample (§1.1, §8.1, §8.2, none of which the change touches), stand as in the previous review, of `339f91a`.

- Source locators checked against the text:
  - conrad-rgs Lemma C.2.1 and its proof (lines 12685–12695, p. 309);
  - conrad-rgs (C.3.1) and Remark C.3.11 (lines 13442–13473, pp. 327–328).
- Library declarations opened at the pins:
  - Mathlib: `LinearAlgebra/CliffordAlgebra/Even.lean:65, 243` (`EvenHom`, `even.lift`) and `LinearAlgebra/SymplecticGroup.lean:59` (`Matrix.J`);
  - Tau Ceti: `Algebra/AlgebraicGroup/ConstantForm/Basic.lean:103–451` (the closure conditions at lines 164–247), `LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Basic.lean:245` (`JFin`), and `RepresentationTheory/Spin/Polarization/Split/Even.lean:52` and `Odd.lean:55`.
- Cross-roadmap citations resolved, all on main:
  - LefschetzPencilsAndVanishingCycles §2.1 normal form (lines 1535–1538);
  - ArithmeticGaloisRepresentations §7.3 (lines 4614–4633);
  - Completed/OrthogonalSpinGroups spinor norm (line 158);
  - EtaleCohomologyFoundations, *VanishingCycles.lisseMonodromyEquiv* (line 349);
  - SchemeAndStackFoundations §2.11, through this README's contract (line 1182).
- Automatic checks: all pass. The dependency check printed `depcheck: 200 roadmaps, 2230 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Only `TauCetiRoadmap/ReductiveGroups/README.md` changes, and nothing outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0 with exactly 11 `sorry` warnings. The file is unchanged since `339f91a` and against main, so the previous `#check @` comparison of all 22 signatures stands.
- Pull request text: it agrees with the head. It describes the `GSp₂ₘ` construction, the similitude Dickson invariant, the spinor norm through lifts in every characteristic, the supplier list without ArithmeticGaloisRepresentations, no renumbering and an unchanged `Suggested.lean`.
- Recorded move: `GSp₂ₘ` moved down from ArithmeticGaloisRepresentations §7.3 into §9B.5, the earlier roadmap. §7.3 on main still builds it as a specialisation of its general similitude group scheme, and should cite §9B.5 when next revised.
- Overlap check:
  - The closest-roadmap lists are those of the previous review, and their reading then stands: ClassicalGroupsPartII, OrthogonalTamagawaAndLatticeMass, QuadraticFormsOverABase, SurfaceGroupCharacterVarieties and PadicHodgeTheoryPartII (open), and ChevalleyGroups, GroupSchemesOverABase and ReductiveGroupsPartII (main).
  - This round re-read, for the object the change moves, ArithmeticGaloisRepresentations §7.3 (main), ClassicalGroupsPartII (open, line 75) and ArithmeticStatisticsPartVIII (open, line 899).
  - The `GSp₂ₘ` group scheme is owned by ReductiveGroups §9B.5. ArithmeticGaloisRepresentations §7.3 is a consumer, and ClassicalGroupsPartII and ArithmeticStatisticsPartVIII consume it through §7.3.
  - The other shared objects keep the owners the previous review gave: integral `O`, `SO` and `Spin` with §§9B.6–9B.7; ordinarity and `Z(q)` with LefschetzPencilsAndVanishingCycles §§2.1–2.2.

Source independence: changed passages only. 3 passages were compared with 1 source, conrad-rgs (Lemma C.2.1 with its proof; Remark C.3.11 with (C.3.1)), and none is shared beyond forced terms. The longest common run is 2 words ("Dickson invariant"), and the README's construction of the similitude invariant differs from Conrad's. No layer was added, removed or reordered, so the arrangement was not compared again (previously: largest share milne, about 110 of about 200 locators; contents independent).

Research link: §§9B.5–9B.8 build the split classical and general spin group schemes and based root data on which Cai, Friedberg and Kaplan (2024) state the doubling method, and on which Asgari and Shahidi (2006) state generic transfer for GSpin. The roadmap as a whole develops Conrad's relative theory of reductive group schemes and Jantzen's rational representations. This rests on README §§9B.7–9B.8, cai-friedberg-kaplan §1 and asgari-shahidi §2.

## Not verifiable

- Asgari, *Local L-functions for split spinor groups*, Canad. J. Math. 54 (2002), §2, marked † at line 5075: the sources service found only a publisher landing page on a host it could not classify as open.
- Knus–Merkurjev–Rost–Tignol, *The Book of Involutions*, §§12, 13, 23, marked †: the AMS book is behind a paywall, and the reference list is the only place it is cited.

## Source issues

- none

## For the human reviewers

- none
