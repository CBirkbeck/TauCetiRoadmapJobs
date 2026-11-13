# FIX-PKG-AmenableTracesOnCStarAlgebras~5

Findings of `REV-PKG-AmenableTracesOnCStarAlgebras~4`: one finding, P3. I checked it against the
README and against the cited suppliers on the content repository's main branch, then applied it.

## F01 (P3) — applied

**Verification.** I wrote a script that, for each layer, takes the supplier tokens of the body (`C*.*`,
`V*`, `CL*`, `D*`, `B*`, and every roadmap name on main or in the open-PR list) and subtracts the
tokens in that layer's `### Dependencies`. Before the edit, the leftovers were exactly what the
review reported:
`{C8.4}`, `{C8.3}`, `∅`, `∅`, `∅`, `∅`, `{FactorRigidity, V13b}`, `∅` for Layers 1–8. In the
other direction (in Dependencies but not in the body) every layer gave `∅`. The citations
behind them:
- the §1.2 Check on the Toeplitz algebra (CStarAlgebras C8.4);
- the §2.2 Check on `C(𝕋)` compressions (CStarAlgebras C8.3);
- the §7.3 remark on condition (v) (FactorRigidity §2.2, VonNeumannAlgebras V13b).

All three suppliers are on main:
- CStarAlgebras §8.3 is at line 1645. Its Check gives `φ_n(z)φ_n(z̄) − φ_n(1) = −e₀e₀*`. That
  matches our `d₂(φ_n, z̄) = tr_n(e₀e₀*) = 1/n` and `d_∞ = ‖e₀e₀*‖ = 1`.
- CStarAlgebras §8.4 (the Toeplitz extension) is at line 1676.
- FactorRigidity §2.2 is at line 217. At `p = 1`, `P = M`, `Q = ℂ` it is injectivity of `M`.
  For `Λ = {1}` it is an invariant mean on `ℓ∞(Γ)`. So at the trivial subgroup, `L(Γ)` is
  injective iff `Γ` is amenable, as §7.3 says.
- VonNeumannAlgebras V13b is at line 4692.

No statement depends on the §7.3 remark. The route (i) ⇒ (ii) ⇒ (v) ⇒ (iv) ⇒ (iii) ⇒ (i)
closes without it.

**Change** (`packages/AmenableTracesOnCStarAlgebras/README.md`, Dependencies only):
- Layer 1: "CStarAlgebras C5.1" → "CStarAlgebras C5.1, C8.4 (a Check)".
- Layer 2: "…, C5.2" → "…, C5.2, C8.3 (a Check)".
- Layer 7: "VonNeumannAlgebras V0" → "VonNeumannAlgebras V0, V13b (the remark on condition (v)
  of §7.3); FactorRigidity §2.2 (the same remark; no statement depends on it)".

The Layer 7 wording follows the README's own "(a Check)" convention (Layer 6, C9.7). It also
matches the FactorRigidity contract bullet ("no statement here depends on it").

**Same pattern elsewhere.** I re-ran the same token check after the edit: the leftover set is `∅`
in both directions for all eight layers. A sweep of every roadmap name on main and in the
open-PR list found no other roadmap cited in a layer body but missing from its Dependencies.
Mathlib and Tau Ceti names in bodies were not part of the finding, and I did not audit them.

### Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 1 Dependencies now names C8.4 | §1.2 Toeplitz Check; CStarAlgebras §8.4 | `T/K(ℓ²) ≅ C(𝕋)`, `1 − SS* = e₀e₀* ∈ K`; a tracial functional on `K(ℓ²)` gives every `e_ii` the same value, and the sum of these values is bounded, so `0`; every trace of `T` factors through `C(𝕋)`, so it kills `e₀e₀* ≠ 0` and is not faithful | the citation is the object the Check uses | C8.4 added |
| Layer 2 Dependencies now names C8.3 | §2.2 `C(𝕋)` Check against CStarAlgebras §8.3 Check | `φ_n(z̄)*φ_n(z̄) = φ_n(z)φ_n(z̄) = P_n − e₀e₀*`; `φ_n(z̄*z̄) = P_n`; difference `e₀e₀*`: normalized trace `1/n`, norm `1` | our `d₂ = 1/n`, `d_∞ = 1` agree with the supplier's `−e₀e₀*` | C8.3 added |
| Layer 7 Dependencies now names V13b, FactorRigidity §2.2 | `Γ = ℤ`; `Γ = F₂`; trivial `Γ` | `L(ℤ) ≅ L∞(𝕋)` injective, `ℤ` amenable; `L(F₂)` not injective, `F₂` not amenable; `L({e}) = ℂ` injective; FactorRigidity §2.2 at `P = M`, `Q = ℂ`, `Λ = {1}` gives the same three answers | the remark is consistent with (i) ⇔ (v) of §7.3 | V13b, FactorRigidity §2.2 added |
| "no statement depends on it" | §7.3 route | (ii) ⇒ (v) via §3.3; (v) ⇒ (iv) as `UAT ⊆ AT`; (iv) ⇒ (iii) because `τ_Γ` exists; (iii) ⇒ (i) via hypertrace and `TauCeti.Amenable.of_lpTop`; (i) ⇒ (ii) via D2 and §5.3: neither FactorRigidity nor V13b is used | accurate | none |
| Merge direction | FactorRigidity, CStarAlgebras, VonNeumannAlgebras | all three folders are in `TauCetiRoadmap/` on main (`8f0def6a`) | on main, earlier than every open roadmap | none |

## Checks

- **Elaboration.** I ran `lake env lean packages/AmenableTracesOnCStarAlgebras/Suggested.lean`
  from the content checkout: exit 0 in 17 s, with 21 warnings, all "declaration uses `sorry`"
  (one per theorem), and nothing else. `Suggested.lean` is unchanged this round. No `TauCeti.*`
  module needed building.
- **Signatures.** I made a scratch copy of `Suggested.lean` with `#check @name` for all 44
  declarations (fully qualified names) and elaborated it once: exit 0. After whitespace
  normalisation, all 44 elaborated types are identical, in order, to those in `signatures.md`.
  Four declarations are flagged there:
  - `IsFaithfulTrace`, `IsHypertrace` and `IsFoelnerTrace` drop `[StarOrderedRing A]`;
  - `IsAF` drops both order classes.

  Their bodies do not use what they drop: `A →P[ℂ] ℂ` needs only `[PartialOrder A]`, and
  `IsAF`'s body mentions no order. Every theorem that uses them keeps the instances. Nothing
  changed.
- **Dependency check** (output):

      depcheck: 207 roadmaps, 1918 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README reports "Cross-roadmap citations found nowhere:
  None" and "Lean names found nowhere: None".
- **Gate failures.** None were listed for this round.

## Notes for the maintainer

- Only three `### Dependencies` paragraphs of the README changed. Nothing else changed: no
  statement, Check, Lean declaration, layer, `sources.toml` or `metadata.toml` entry. No supplier
  gap was added and `design/plan.json` is unchanged.
- No names that other roadmaps cite were changed, and no section or target id was renumbered.
- Ownership: no new object was stated. The added citations are all on main (CStarAlgebras §8.3,
  §8.4; VonNeumannAlgebras V13b; FactorRigidity §2.2), and the README's supplier contracts already
  list all three roadmaps. No notion moved from a later roadmap.
- No suspicious instructions were found in the review text.
