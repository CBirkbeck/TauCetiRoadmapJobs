# Review of FourierDeligneTransform (pull request #2132 at ec08a18)

**Verdict:** needs changes

## R01 (P3) — Restore the base hypotheses in the description

**Location:** PR description, prose paragraph beginning “Builds”, sentence beginning “On a vector bundle over any `𝔽_p`-scheme”.
**Claim:** This sentence gives the transform and its listed theorems a broader base scope than the head specifies; its duality and perverse clauses also omit their additional restrictions.
**Witness:** `TauCetiRoadmap/FourierDeligneTransform/README.md:353` assumes qcqs; :410 assumes a Noetherian base and bounded constructible finite-Tor input for duality; :473 states perverse exactness over a field. The infinite disjoint union of points fails quasi-compactness.
**Repair:** Replace that sentence with: “For constant-rank vector bundles over qcqs 𝔽_p-schemes, it constructs FT_ψ and proves equality of the two transforms, inversion and functoriality, with the stated Tor bounds for tensor identities. Duality is stated over Noetherian bases for bounded constructible inputs of finite Tor amplitude; trace and Frobenius identities are over finite fields; perverse t-exactness and the equivalence of hearts are over fields.” In `roadmap-summary`, qualify “duality” by the same Noetherian and finite-Tor restrictions.

## R02 (P3) — Restrict the advertised Euler–Poincaré coefficients

**Location:** PR description, prose paragraph beginning “Builds”: “the Euler–Poincaré formula on affine curves for every coefficient ring the roadmap uses”.
**Claim:** Section 2.7 does not state this formula for every coefficient ring allowed elsewhere in the roadmap.
**Witness:** `TauCetiRoadmap/FourierDeligneTransform/README.md:320` specifies finite local rings, finite extensions of ℚ_ℓ and ℚ̄_ℓ. At :24, finite rings need not be local; ℤ/7 × ℤ/7 has two maximal ideals and admits ψ(1) = (2,2) for p = 3.
**Repair:** Replace the quoted phrase with “the Euler–Poincaré formula on smooth connected affine curves over algebraically closed fields for lisse sheaves free over finite local coefficient rings, or with coefficients in finite extensions of ℚ_ℓ or ℚ̄_ℓ, with ℓ ≠ p”.

## R03 (P3) — State that this adds a new roadmap

**Location:** PR description, paragraph beginning “Roadmap folder `TauCetiRoadmap/FourierDeligneTransform`”.
**Claim:** The description names the folder but does not say whether this adds a roadmap or revises one on main.
**Witness:** The base has no `TauCetiRoadmap/FourierDeligneTransform` entry. The diff adds 639 README lines, 57 Suggested.lean lines and one metadata line, with no deletions or Lean declarations.
**Repair:** Replace that paragraph with: “Adds the new roadmap folder TauCetiRoadmap/FourierDeligneTransform: README.md (639 lines), Suggested.lean (57 lines, no declarations), and metadata.toml (one line). All targets are specified in the README.”

## Previous findings

- R01 — repaired: `TauCetiRoadmap/FourierDeligneTransform/README.md:320` still cites EtaleCohomologyFoundations §0.8 for derived scalar extension, explicitly using F's Λ-flatness; :321 retains that dependency.
- R02 — repaired: `TauCetiRoadmap/FourierDeligneTransform/README.md:583` still derives vanishing on A × s′ from generic local acyclicity over Spec k, base change and lisse tensor stability; :584 retains §§F.2.3 and F.3.

## Verified sound

| Statement or scope | Instances | Computed values: claim versus target | Result | Change |
|---|---|---|---|---|
| §3.2 base scope; R01 | S = disjoint union over ℕ of Spec 𝔽₃; rank zero | 𝔽₃-scheme: true; qcqs: false. Any N components leave component N uncovered. On one component FT(M) = M. | “Any” exceeds target scope | Qualify description |
| §3.5 duality scope; R01 | Spec 𝔽₃[x₁,x₂,…]; control Spec 𝔽₃, rank zero, K = M = Λ | Infinite polynomial ring: qcqs = true, Noetherian = false since (x₁,…,xₙ) ⊊ (x₁,…,xₙ₊₁). Control: RHom(Λ,Λ) = Λ on both sides. | Noetherian restriction needed in description | Qualify description |
| §4.1 perverse exactness; R01 | Spec 𝔽₃, rank one, Λ = 𝔽₇, ψ(1) = 2, K = i₀*Λ | FT(K) = Λ[1]; input and output perverse degree = 0. Base dimension = 0, as required by the field-base target. | Target is over fields | Qualify description |
| §2.7 coefficient scope; R02 | Λ = 𝔽₇ × 𝔽₇, ψ(1) = (2,2); local control Λ = 𝔽₇, constant sheaf on 𝔸¹ | Product: ψ(1)³ = (1,1), ψ(1)−1 = (1,1) unit; two maximal ideals. Local control: χ_c = 1 = 1·(2−0−1)−0. | Product allowed elsewhere, absent from §2.7 target | Qualify description |
| Added-folder claim; R03 | Base versus head | Folder absent versus present; +697/−0 lines; 0 removed headings; 0 Lean declarations | New roadmap addition | State change kind |

Other adversarial rows stand as in the previous review, of ec08a18.

- Increment: 0 changed folder lines, 0 changed Lean statements, 0 outside-folder paths; exact head ec08a189e7a128e8e08d1ee90528e18042b183ce confirmed.
- PR text: title, all quoted prose and `roadmap-summary` compared with the head and base diff; three description findings above.
- Seeded source sample: 0 targets changed; 0 source locators reopened; previous verification stands. No new library declarations or cross-roadmap citations require resolution.
- Gate rerun: all reported counters 0, `OK`; separate targeted build: `Build completed successfully (18239 jobs).`
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Direct `lake env lean` elaboration: exit 0, no output; 0 declarations, so signature-binder checks and one-tactic probes have no instances.

Overlap check: 0 changed ownership claims or supplier citations; the supplied overlap snapshot reports no conflicting heads, dropped cited ids or revision-only cited ids; the previous ownership audit stands.

Source independence: changed passages only; 0 changed roadmap passages compared with 0 sources. LAU87 remains the most cited source (151 of 202 source-key occurrences before References); no layer was added, removed or reordered, so arrangement was not rechecked.

## Not verifiable

- SGA45-ST and KW01 remain settled as uncertified, cited by locator only; no changed passage requires them.
- Previous extraction uncertainties at LAU87 line 971 and KL85 line 446 remain outside the changed-text check.

## Source issues

- none

## For the human reviewers

- none
