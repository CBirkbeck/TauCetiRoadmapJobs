# GATE-BianchiModularForms~1: answers to human review

One comment, one point.

## H01 (mycaule) — answered

The comment is right: LeanPool's `LeanModularForms` (commit `f8b9b72`) has nothing on GL₂ over an imaginary quadratic field, so this roadmap gets no prior-work citation. Its one shared object, the abstract Hecke ring, already reaches the roadmap through the pins. Checking it showed that the supplier contract named the wrong home for the Hecke ring carrier, and that is now fixed. `TauCetiRoadmap/BianchiModularForms/README.md`:
- **Lines 203–205.** "From Mathlib" now lists `HeckeRing Δ H R` (notation `𝕋`) from `Mathlib/NumberTheory/HeckeRing/Defs.lean`.
- **Lines 236–239.** Old: "The abstract Hecke ring `𝕋 Δ H R` of `TauCeti/NumberTheory/HeckeRing/` with its convolution product, degree and commutativity criterion". New: Tau Ceti supplies the convolution product that makes Mathlib's `𝕋 Δ H R` a semiring (a ring when `R` is one) for a Hecke pair `IsHeckeTriple Δ H H`, together with the degree and the commutativity criterion.

### Evidence

- **What `LeanModularForms` contains.** Read on GitHub at `f8b9b721d616a2cc0b22fc226e4a9e3dd6cea2d0`:
  - Top-level folders: `ContourIntegral`, `ForMathlib`, `GeneralizedResidueTheory`, `HeckeRIngs` (`AbstractHeckeRing`, `GL2`, `GLn`), `Modularforms`, `SpherePacking`, `ValenceFormula`.
  - `HeckeRIngs/GL2/Basic.lean` works in `GL (Fin 2) ℚ` relative to `SL₂(ℤ)` (`TAd`, `TPp`, `TSum`).
  - `HeckeRIngs/GL2/HeckeModularForm.lean` makes the Hecke operators act on `ModularForm 𝒮ℒ k`, which is level one only. `Γ₀(N)` does not appear.
  - `Modularforms/` holds Eisenstein series, `E2`, `Delta`, `Eta`, q-expansions, Jacobi theta and the dimension formulas for `SL₂(ℤ)`.
  - No file mentions number fields, Dedekind domains, Bianchi groups or `ℍ³`.
- **Where this roadmap uses classical forms.** Only base change and the elliptic-curve comparison (§§7.2–7.5, 8.3) use classical forms. There they are weight-2 newforms of level `N` with nebentypus `χ_f ∈ {1, χ_K}`, taken from Tau Ceti's `HeckeRing.GL2.Newform N k` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` line 104). Weight 2 at level one has no cusp forms, so nothing level-one is used. The Eisenstein series, `Δ`, `η`, the valence formula and the `SL₂(ℤ)` dimension formulas appear nowhere in the README.
- **The shared object.**
  - The roadmap's Hecke-ring input is §4.3's ring `𝕋 Δ₀(𝔫,𝔞) Γ₀(𝔫,𝔞) ℤ`.
  - At the Mathlib pin `1b1ccf4b`, its carrier is Mathlib's: `HeckeRing` (`Mathlib/NumberTheory/HeckeRing/Defs.lean` line 189, notation `𝕋`), with `IsHeckeTriple` at line 75.
  - The product and its laws are Tau Ceti's at the pin `2fd255d9`: `HeckeCosetModule.mul` (`NumberTheory/HeckeRing/Multiplication.lean` line 97), the `Semiring`/`Ring` instances (`Associativity.lean` lines 477 and 484, both under `[IsHeckeTriple Δ H H]`), `degree` (`Basic.lean` line 902) and `mul_comm_of_antiInvolution` (`Commutativity.lean` line 459).
  - Tau Ceti records that parts of this material were ported from the same project, for example `NumberTheory/HeckeRing/Degree.lean` line 22 and `Commutativity.lean` line 35.
  - The suppliers allowed here are Mathlib, Tau Ceti and Tau Ceti roadmaps, so the overlap calls for no supplier entry or dependency.

## Adversarial pass on the changed statements

`Suggested.lean` did not change. The only changes are the two supplier-contract bullets.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `HeckeRing Δ H R` is the finitely supported `R`-combinations of double cosets `H\Δ/H`, in Mathlib | Mathlib `Defs.lean` lines 183–190 at `1b1ccf4b` | `HeckeCosetModule Δ H H Z := HeckeCoset Δ H H →₀ Z`, `[Zero Z]` only; `HeckeRing` is its diagonal abbrev | holds | none |
| Tau Ceti makes `𝕋 Δ H R` a semiring, and a ring when `R` is one, for a Hecke pair | `Associativity.lean` lines 477 and 484 | `Semiring (𝕋 Δ H R)` and `Ring (𝕋 Δ H R')` for `[Ring R']`, both under `[IsHeckeTriple Δ H H]` | holds. The first wording ("a ring", with no hypothesis) over-claimed: it left out `IsHeckeTriple` and the ring condition on the coefficients | the hypothesis and the semiring/ring split were added |
| The hypothesis holds where §4.3 uses it: `(Γ₀(𝔫,𝔞), Δ₀(𝔫,𝔞))` | `IsHeckeTriple`'s four fields (`Defs.lean` line 75) | `Γ₀ ≤ Δ₀`: an element of `Γ₀` preserves the pair, and so does its inverse. Commensurability of `Γ₀` with itself is trivial. `Δ₀ ≤ commensurator Γ₀`: for `g ∈ GL₂(K)`, `gΓ₀g⁻¹ ∩ Γ₀` stabilizes two lattice pairs and has finite index in both | §4.3's ring is defined | none |
| Coefficient cases | `R = ℤ` (§4.3's use), `R = ℕ`, and the zero ring | `ℤ`: `Ring` instance (line 484). `ℕ`: only `Semiring`, since `ℕ` has no additive inverses, which is why the bullet separates the two cases. Zero ring: `HeckeCoset Δ H H →₀ 0` is the zero ring | the bullet holds in all three cases | none |
| The degree and the commutativity criterion are in Tau Ceti | `Basic.lean` line 902 `degree`; `Commutativity.lean` line 459 `mul_comm_of_antiInvolution` | both present at `2fd255d9` | holds | none |

## Other checks

- **Elaborated signatures.** `Suggested.lean` did not change, so the 10 elaborated types in the worker's signature list still describe the file, and no scratch `#check` file was elaborated. The list flags four declarations with no `[NumberField K]` binder: `cusps`, `cuspidalHom`, `cuspidalH1` and `sl2Image`. That is by design, and README lines 44–46 say so: the first three are defined over any field, and `sl2Image` needs only `𝓞 K`, which Mathlib defines for any `[Field K]`. Both theorems carry `[NumberField K] [IsTotallyComplex K] [Fact (finrank ℚ K = 2)]` explicitly.
- **Ownership.** No construction was added, so ownership against open pull requests is unaffected.
- **Citations.** `roadmaps resolve` on the edited README lists no cross-roadmap citation and no Lean name as found nowhere. `HeckeRing` and `IsHeckeTriple` exist at the Mathlib pin, as cited above.
- **Sources.** No literature source was fetched or added, and no `needs-references.toml` was written. The LeanPool pages were read as data on the public GitHub repository at the commit the comment links.
- **Untrusted text.** The review contains no instructions, and the fetched pages contained nothing suspicious.

## Build

`lake build TauCetiRoadmap.BianchiModularForms.Suggested`: `Build completed successfully (18239 jobs).` The only warnings are `declaration uses 'sorry'` at lines 140 and 160.

## Gate

Committed as `32c8accd` ("BianchiModularForms: review repairs (Hecke ring carrier attributed to Mathlib, ring structure to Tau Ceti)"); not pushed.

`gate BianchiModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`gate --depcheck … --movable --pr 1719`): `depcheck: 248 roadmaps, 2377 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
