# Review of SatoTateGroups (pull request #1725 at 1cfaaba)

**Verdict:** accepted

Incremental re-review of the 50 lines changed in `TauCetiRoadmap/SatoTateGroups/README.md` since `434744b`, and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: "is defined over a finite Galois extension `L'/L` … compatible with the canonical descent datum, so it descends to `A_L`: Milne, *Abelian Varieties*, III, Proposition 1.13(a), p. 90" (`README.md:1924-1927`); the References entry (`:3034`) agrees.
- R02 — repaired: 9.2 "`ρ(Frob_𝔭)` acts on `V_ℓ` as the Frobenius endomorphism of the reduction … (§5.0b), which acts semisimply (A6.21)" (`:2221-2224`); 9.6 "for abelian varieties it is" (`:2394-2397`); both in the contracts and `*Needs:*`.
- R03 — repaired: "on the absolute Galois group of the component field of ArithmeticGaloisRepresentations §7.6 (the finite Galois extension of `k` over which `ρ` takes values in `(G_ℓ^{Zar})⁰`)" (`:2247-2249`); no reference to 9.5 remains.
- R04 — repaired: the description now reads "fifty-seven groups: the fifty-five of Fité–Kedlaya–Rotger–Sutherland, embedded U(2) and its normalizer … 433 cases over the fourteen arithmetic identity components, 410 of them realizable".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| 9.2 homotheties (changed) | Jordan block `[[α,1],[0,α]]`; semisimple `diag(α₁,…,α_{2g})`; supersingular `α = √q·i` | Jordan block now excluded by A6.21. Semisimple: closure has character group `ℤ^{2g}/R`; `χ_m(w(x)) = x^{Σmᵢ}`; `∏αᵢ^{mᵢ} = 1` gives `q^{Σmᵢ/2} = 1`, so `Σmᵢ = 0`. `α²(q/α)^{−2} = 1`, sum `0` | pass |
| 9.2 supplier inputs (changed) | A6.21 and §5.0b at the open heads | A6.21: `π` acts semisimply on `V_ℓA` for `ℓ ≠ p`; §5.0b: arithmetic `Frob_w` acts as `T_ℓπ_v` at good `v`, `ℓ ≠ p`. 9.2 assumes `𝔭` good, not above `ℓ` | hypotheses match |
| 9.2 component groups (changed) | `w(x) = x·id`; AGR §7.6 | `N(w(x)) = x²`, `w(𝔾_m) ∩ ker N = {±1}`; §7.6: `Γ⁰ = ρ⁻¹(G_ρ⁰)`, `Gal(F_ρ⁰/F) ≅ π₀(G_ρ)`, so `ν ∘ ρ` is defined on `G_{F_ρ⁰}`; `2i = 1` has no integer solution | pass |
| 9.6 normalized Frobenius class (changed remark) | FKRS Definition 2.9, Remark 2.10; elliptic curve, `a_𝔭 = 0` | Source takes the semisimple component of `q^{−1/2}g_𝔭` and expects semisimplicity; with A6.21 the class is that of `q^{−1/2}g_𝔭`. `a_𝔭 = 0`: eigenvalues `±i`, `θ = π/2` | pass |
| 8.1 Galois descent (changed) | `k` of characteristic `0`; Milne III 1.13(a) | `L'/L` finite Galois exists (separable); 1.13(a) is an equivalence on quasi-projective varieties with descent data, hence full on morphisms; abelian varieties are projective | pass |
| Description vs head | counts at the head | `## Layer` headings `11`; `### k.n` headings `76`; `Fin 57`; `55 + 2 = 57`; `57 − 5 = 52`; `433 − 23 = 410`; `metadata.toml` topic `math.NT`; the two suppliers of the new citations are already in the depends-on block | pass |

The rows for the untouched statements stand as in the previous review, of `434744b`.

- Folder diff since `434744b`: 50 lines, `README.md` only (30 insertions, 20 deletions); no Lean statement changed; `git diff --stat origin/main...HEAD` outside the folder: empty.
- Source locators checked against the text: 2 (Milne f5ca4e63 lines 3646–3676: Proposition 1.13(a) on printed p. 90; FKRS d5e70f9e lines 443–449: Definition 2.9 and Remark 2.10).
- Cross-roadmap citations resolved at the open heads: 3 (AbelianSchemesAndArithmeticModuli A6.21; NeronModelsAndSemistableAbelianVarieties §5.0b; ArithmeticGaloisRepresentations §7.6). All three are earlier in the merge order. Library declarations opened: 0 (no statement changed).
- Gate: the worker's gate at this head passes every check (`build=0`, `depcheck=0`). Run without the candidate order it prints `depcheck: NOT IN ORDER: SatoTateGroups (insert it after its last supplier)`; the roadmap is not in the merge order yet, which is not a finding.
- Dependency check with `--movable`: `depcheck: 234 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` exited 0 with 37 `declaration uses sorry` warnings and no other diagnostic.
- Overlaps: `scratch/overlaps.md` lists no dropped id, no second copy and no other pull request changing this roadmap.
- Source independence: changed passages only: 2 passages compared with 2 sources (Milne f5ca4e63, FKRS d5e70f9e), none shared beyond standard terms; the arrangement was not compared again (no layer added, removed or reordered).
- Remark: 9.6's `*Needs:*` line does not list A6.21; the definition takes the semisimple part, so only the parenthetical remark uses it.
- Remark (untouched text): `README.md:1960-1961` and `:1978-1979` identify `endField A` with the field of EllipticCurveModularityPartIIGL2TypeAbelianVarieties §1.4, which is `E_A = End⁰_ℚ(A)`; for `J₀(23)` the first is `ℚ`, the second `ℚ(√5)`.

Overlap check: read AbelianSurfacesModularity, AbelianVarietiesOverFiniteFields, EllipticCurveModularityPartIIGL2TypeAbelianVarieties, AdelicImagesAndModularCurves, ArtinRepresentations, CompactGroups, ProbabilisticAndMetricNumberTheory, LieGroups; no object has two owners. Galois endomorphism types, `ST(A)` and the 52/34 lists: SatoTateGroups §8.7, §§9.1–9.10 (AbelianSurfacesModularity consumes them). Endomorphism field and geometric simplicity: SatoTateGroups 8.2–8.3 in characteristic zero, AbelianVarietiesOverFiniteFields 2.8 and 5.3 over finite fields, each leaving the other case to the other, both from AbelianSchemesAndArithmeticModuli A6.4. Rational endomorphism field `E_A`, Ribet `GL₂`-type and ℚ-curves: EllipticCurveModularityPartIIGL2TypeAbelianVarieties §§1.2–1.5, §5.1 (cited at 8.2, 8.3, 8.6). Galois images: AdelicImagesAndModularCurves. Image group of an Artin representation: ArtinRepresentations 7.4; `μ(n)` and the ambient groups: SatoTateGroups Layers 0–5. Peter–Weyl and characters: CompactGroups. General Weyl integration and the closed-subgroup theorem: LieGroups Layers 2 and 6 (Layer 4 here specialises to `USp(2g)`). `AsympEquidistributed` and the torus Weyl criterion: ProbabilisticAndMetricNumberTheory §§2.1, 2.4; the criterion on `Conj(G)`: SatoTateGroups 10.1.

## Not verifiable

- Ribet 1985, Theorem 3.1 (9.9): no legal copy; cited by locator through ModularityAndLanglandsExtensions §4.39.
- Silverberg 1992, Theorem 2.4 (8.2): settled `uncertified` in the manifest.
- "One of 23 roadmaps for the mathematics behind the LMFDB" (description): the count of sibling pull requests was not checked.

## Source issues

- none

## For the human reviewers

- **Not tested.** No review of this folder carries a full-roadmap `Source independence:` line; this round compared only the two changed passages, so wording and arrangement against FKRS12 (the most cited source) remain unrecorded.
- **Licence.** `README.md:1432` and `:3063` cite the LMFDB source file `lmfdb/sato_tate_groups/main.py` and its knowls for the generator and moment conventions of 5.5; the licence of that code and data was not read.
