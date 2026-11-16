# Review of LocalLanglandsCorrespondenceForG2 (pull request #2458 at 0d0914b)

**Verdict:** accepted

No finding at this head.

## Deferred findings

- D01 — stands
- D02 — stands

## Previous findings

- R01 — repaired: §10.8 (README lines 1237–1241) now defines "A Xu packet over φ♭" for φ♭ not bounded as Langlands quotients from the Levi image of GL × GSp_(2n₀), with the partition and transitivity targets and the trivial-representation Check (line 1250).
- R02 — repaired: §9.1 (line 1103) reads "φ_τ … is rec(τ) (… §10.30), respectively the inner-form parameter of τ (… §10.31)"; §10.4 twists it "block by block"; §10.31 is in the *Needs* of §§9.1, 9.2, 10.4, 10.7 and both Dependencies.
- R03 — not repaired: deferred (D02)

## Verified sound

| Statement | Instances tried | Values computed | Other side | Result |
| --- | --- | --- | --- | --- |
| §10.8, definition of a Xu packet over an unbounded φ♭ | centre of GSp₆ on the inducing datum: g_i = z, h = z, sim = z² | ∏ω_i(z)·\|z\|^(Σn_iν_i) · ω_τ̃₀(z)·\|z²\|^(−Σn_iν_i/2) = ∏ω_i(z)·ω_τ̃₀(z): absolute values cancel, so ω_τ̃₀ is unitary and τ̃₀ tempered | Langlands data of §2.0 (ν₁ > ⋯ > ν_r > 0, tempered blocks); supplier §3.19 takes n ≥ 1 and the central extension ζ̃ as input | holds |
| §10.8, partition and transitivity | n₀ = 1 (GSp₂ = GL₂); n₀ = 0; a φ♭ whose packet has central value −1 | χ ∘ sim on M̃ is χ(sim h): twists τ̃₀ only. Packets over φ₀ with fixed centre: torsor under {ω : ω² = 1} modulo α(S_φ₀). Central value −1: no τ̃₀ (required character not ω₀·square), both sides empty | supplier §3.19: C = ⨆ Π_φ̃ ⊗ ω, singleton packets for GL₂; GS §7(a), p. 22 | holds |
| §10.8, Check on the trivial representation (line 1250) | r = 3, n_i = 1, ν = (3, 2, 1), n₀ = 0 | Twist \|λ\|^(−6/2) = \|λ\|⁻³; at the centre \|z\|⁶·τ̃₀(z²)·\|z\|⁻⁶ = τ̃₀(z²), so τ̃₀² = 1. δ_B exponents (t₁, t₂, t₃, λ) = (6, 4, 2, −6), half = (3, 2, 1, −3) | Spin weights (±3 ± 2 ± 1)/2 = 3, 2, 1, 0, 0, −1, −2, −3; χ\|·\|³ occurs once, so χ·L_w(1) ≠ χ′·L_w(1) for χ ≠ χ′ | holds; excludes "all χ ∘ sim in one packet" |
| §10.8, agreement with the supplier on Φ⁺_unit minus bounded | exponents 0 < ν_i < 1/2 | Supplier: full normalized induction with positive exponents, irreducible there, equal to its Langlands quotient | §10.9 uses §3.19 over bounded parameters only and §10.8 over all others | consistent; scope line 7 states the difference |
| §9.1, lower-tower parameter | Ind(χ₁ ∘ Nrd ⊗ χ₂ ∘ Nrd) on GL₂(D), χ_i unitary, (χ₁χ₂)² = 1; τ on PGL₄ | Centre: χ₁(z²)χ₂(z²) = 1. Parameter χ₁ ⊠ S₂ ⊕ χ₂ ⊠ S₂: dimension 4, det χ₁²χ₂² = 1, two blocks of dimension 2 (divisible by d = 2). Split side: rec(τ), det = central character = 1 | EndoscopicTransferAndUnitaryTraceComparison §10.31 (sum over standard blocks, image criterion), §4.7a (square-integrable only) | holds; values in SL₄(ℂ) on both towers |
| §9.2 (sampled) | φ_τ = χ₁ ⊠ S₂ ⊕ χ₂ ⊠ S₂; Sym³ | dim(1 ⊕ Λ²φ_τ) = 1 + 6 = 7; dim(φ_τ ⊕ φ_τ∨) = 8; Λ² Sym³ = Sym⁴ ⊕ Sym⁰ (5 + 1 = 6) | GS §12.3(b), pp. 35–36 (GS lines 1490–1506); proof of Theorem 12.3, first bullet, p. 36 (GS lines 1521–1528) | holds; locator on the stated pages |
| §10.4 | the GL₂(D) instance twisted by χ ∘ Nrd | Blocks (χχ₁) ∘ Nrd, (χχ₂) ∘ Nrd; parameter χχ₁ ⊠ S₂ ⊕ χχ₂ ⊠ S₂ = φ_τ ⊗ χ; Λ² unchanged (χ² = 1); (φ_τ ⊗ χ)∨ = φ_τ∨ ⊗ χ | §4.7a twist Check (χ ∘ Nrd ↔ χ ∘ det); pgsp6-similitude-twist-rule contract (line 92) | holds |
| §10.7, route clause | τ discrete on PGL₄, JL(τ ⊗ χ ∘ det) on PGL₂(D) | One standard block, so inner-form parameter = rec(JL image back on GL₄) = φ_τ ⊗ χ | §10.31 with t = 1; pgsp6-lower-tower-xu-packets contract (line 80) | holds |
| §10.9 | trivial representation; bounded φ♭ | Unbounded: packets {χ ∘ sim} of §10.8, each in one fibre. Bounded: §3.19 | GS Theorem 12.7(ii), p. 39 (GS line 1634), with §7, p. 22 (GS line 925: any parameter of Sp₆) | holds; every σ now lies in a defined packet |
| Scope line 7 and supplier line 72 | supplier §3.19 at its open head | "n ≥ 1", bounded φ, extension to Φ⁺_unit by Levi induction with positive exponents; central extension ζ̃ free | README: "extends them only to Arthur's set Φ⁺_unit"; "at n = 1, 2 … with the central character that §10.8 prescribes" | accurate |

The rows for the untouched statements stand as in the previous review, of `88decde`.

- Incremental re-review of the 31 lines changed since `88decde` (README lines 7, 72, 1103, 1115, 1119, 1125, 1154, 1196, 1227, 1237–1243, 1250, 1254, 1269); `Suggested.lean` is unchanged.
- Source locators checked against the text: 4 (GS §7, p. 22, GS lines 919–940; GS §§12.2–12.3, pp. 34–36, GS lines 1454–1509; GS proof of Theorem 12.3, p. 36, GS lines 1520–1528; GS Theorem 12.7(ii) and its proof, p. 39, GS lines 1634–1648). All on the stated pages. Of the seeded sample only §9.2 has changed text.
- Cross-roadmap citations resolved at the open heads: ModularityAndLanglandsExtensions §3.19; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30, 10.31; on main SmoothRepresentationsOfLocalGroups SR.3.3 (its README line 2875). Each states what is cited. No phrase of the removed wording ("PGL₄-datum", "tempered induced packets", "through Jacquet–Langlands") remains.
- Gate at 0d0914b: every check passes (build included). Nothing is changed outside the folder. Dependency check: `depcheck: 260 roadmaps, 2594 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings (lines 124, 143, 158), no error.
- Pull request text against the head: no sentence is contradicted; the change adds no supplier (§10.31 and SR.3.3 were already cited, lines 14 and 113), removes no section and no declaration; "fibres that are unions of Xu packets" is now defined on all of Irr(PGSp₆(F)).
- Declared gaps: 29 contracts in the README, 27 slugs in `design/plan.json`; the difference is D01 and D02. The change adds no contract.
- Remark: the README's notes on the sources do not list the two places where §§9.1 and 10.8 depart from GS (see Source issues); no change is asked.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups, SpinRepresentations; nothing shared (as in the previous review; the one new object, Xu's packets over the unbounded parameters of Sp₆, is stated by no other roadmap: ModularityAndLanglandsExtensions §3.19 stops at Φ⁺_unit, where the two constructions give the same sets).

Source independence: changed passages only; 5 passages compared with 1 source (GS, at GS lines 925–940, 1475, 1490–1506, 1521–1528, 1644–1647), none shared; largest share GS, about 119 of 189 locators; no layer added, removed or reordered, so the contents comparison with GS stands: independent.

Research link: The roadmap formalizes the local Langlands correspondence for G₂ of Gan–Savin (2023), with the gamma-factor characterization of Gan–Savin (2023), the exceptional theta correspondences of Gan–Savin (2021), Chenevier–Gan's unacceptability of Spin₇ (2023), Kret–Shin (2023) and Harris–Khare–Thorne (2019); README summary and sources GS, GF, HD, CG, KS, HKT.

## Not verifiable

- Griess, Theorem 1 (§0.0 and `griess_conjugacy`): recorded as uncertified (paywalled); the text was not read.
- SpV, Theorems 1.7.1 and 1.8.1 and §1.5 (§1.1(i)–(iii)): recorded as uncertified (Springer monograph); the text was not read.

## Source issues

- **Gap** in GS at §12.2, display defining the lower-tower lift, printed page 35: the source says every irreducible representation of PGL₂(D) is carried to one of PGL₄ by Jacquet–Langlands; it should be the parameter built from the standard data of GL₂(D), the correspondence of irreducibles covering essentially square-integrable representations only; affects a stated result.
- **Gap** in GS at §7, printed page 22: the source says Xu's partition into packets exists over every parameter of Sp₆; it should define the packets over unbounded parameters, Xu's results being for tempered packets, for instance by Langlands quotients; affects a stated result.

## For the human reviewers

- Griess (Theorem 1) and SpV (Theorems 1.7.1, 1.8.1, §1.5) are cited by locator only (manifest: uncertified). `griess_conjugacy` (`Suggested.lean` line 124) and README §1.1(i) rest on texts this review did not read.
