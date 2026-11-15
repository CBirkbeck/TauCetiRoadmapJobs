# FIX-DESIGN-SchrodingerOperatorsAndSpectralTypes~8

Findings of `REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~7` (three, all P3). Files edited:
`packages/SchrodingerOperatorsAndSpectralTypes/design/README.md`, `design/plan.json`,
`sources.toml`. This is the design stage, so the package has no `Suggested.lean`: no Lean was
elaborated and no `#check` scratch file applies.

## F01 (P3) — applied

The finding is right. teschl line 4326–4332 is Lemma 3.15 (p. 104), a statement about one Borel
measure. Line 4424–4425 passes to operators only through a maximal spectral measure. The root
cause is teschl line 1780 (§1.2, p. 42): the book assumes every Hilbert space is separable, and
there a maximal vector always exists (Lemma 3.16, line 4354–4366). The witness `M_x ⊕` coordinate
operator on `L²[0,1] ⊕ ℓ²(ℝ)` has no maximal vector (1.4's Check), yet 1.4(1) with `f = (1, 0)`
gives `[0,1] ⊆ σ_ac`.

- 1.4: "(teschl line 4315–4332 and 4420–4427)." → the same locator, followed by "; the source
  states (3) through a maximal spectral measure, and (1) and (2), which assume none, are deduced
  here."
- 1.5: "prove (teschl line 4326–4332):" → "prove the following. They are deduced here from 1.4 by
  the route below, with no maximal spectral vector; for one Borel measure the underlying fact is
  teschl line 4326–4332 (Lemma 3.15, p. 104):".

Where this departs from the suggested wording: the review proposed "deduced here from 1.4(1)". The
route of 1.5 also uses 1.4's closedness of `σ_ac` (for the endpoints) and 1.3 with UO-A06 (for the
last item), so the text now says "from 1.4 by the route below".

The same pattern elsewhere:
- The plan's 1.4d and 1.5 locators carry the same two notes. For 1.5: "deduced here from 1.4a
  (closedness) and 1.4d".
- teschl's separability convention affects every `teschl` locator for a statement made here on
  arbitrary `ℋ`, for example 1.1 (line 4399–4411) and 1.2 (line 4388–4419). One Conventions
  sentence now covers all of them: "`teschl` assumes every Hilbert space separable (teschl line
  1780, §1.2, p. 42), so where a statement here drops separability its `teschl` locator gives the
  separable case, and the general case is deduced here from the inputs of its *Needs:* line."
- 1.3 already had this form ("is deduced here").

## F02 (P3) — applied

The finding is right. At the pinned Tau Ceti, `TauCeti.Manifold.integral_mul_laplaceBeltrami`
(`TauCeti/Geometry/Manifold/Riemannian/DivergenceTheorem.lean:312`) requires `hfc : HasCompactSupport f`
on the `C¹` factor only. The case where `u` has compact support is line 289,
`TauCeti.Manifold.integral_mul_divergence_of_hasCompactSupport_right`: `f` is `C¹` and the field
`X` is a compactly supported `C¹` field.

Two more pinned inputs are needed to take `X = grad u`, and they are now named as well:
- `TauCeti.Manifold.contMDiff_mgradient` (`.../Riemannian/Gradient/Basic.lean:254`): a `C²`
  function has a `C¹` gradient, for a `C¹` metric;
- `HasCompactSupport.mgradient` (same file, line 116).

Edits:
- Contract, after the `integral_mul_laplaceBeltrami` entry: added the companion theorem with its
  hypotheses, the `X = grad u` reduction, and the two gradient lemmas.
- 3.1 *Needs:*: lists all four names, each tagged with its support case.
- Same pattern elsewhere: the Scope line "Green identity (…)" now reads "Green identities (…)" and
  names both theorems. Layer 3 Dependencies "Green identity" → "Green identities". The plan's 3.1b
  prerequisites gain the three new names. 3.5's density extension pairs with a compactly supported
  `H¹` factor, which is the first case, so it needs no change.

## F03 (P3) — applied

The finding is right. The three places it names are real:

| README cites | Source text at that line | Was it in References? |
|---|---|---|
| teschl line 3043–3046 | (2.68), the resolvent `(A − z)⁻¹` | no |
| teschl line 5056–5057 | Corollary 4.11 | no |
| teschl line 6358–6360 | the remark after Lemma 6.21 and before Lemma 6.22 (line 6368) | no |

The References entry now lists:
- "§2.3 (Theorems 2.12–2.13, (2.68))";
- "Corollary 4.11", after Theorem 4.10;
- "the remark before Lemma 6.22", after Lemma 6.17.

Two related corrections to the same entry:
- **Separability convention.** The entry and the manifest `locator` now add "§1.2 (the standing
  separability assumption)", which the F01 Conventions sentence cites. The manifest's `cited_for`
  gains "Conventions".
- **Wrong section for Lemma 3.15.** Lemmas 3.14 and 3.15 and the essential closure (3.79) are in
  §3.2: they come before the "3.3. Spectral types" heading at line 4346. The README cites no line
  of Lemma 3.14 (line 4302). Both the README entry and the manifest `locator` said "§3.3 (Lemmas
  3.14–3.16, 3.19, (3.83)–(3.85))"; they now say "§3.2 ((3.79), Lemma 3.15), §3.3 (Lemmas 3.16,
  3.19, (3.83)–(3.85))".

The References entry and the manifest `locator` now agree item by item.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: teschl assumes separability | teschl line 1780 (page marker line 1753, printed p. 42, §1.2 heading line 1715); 1.4(4) states separability itself; 1.4(1) on `L²[0,1] ⊕ ℓ²(ℝ)` | its *Needs:* (1.1–1.3, UO-C01, UO-C03, SA-B85, SA-D12) assume no separability | holds | new sentence |
| 1.4(3) attributed to the source | `A = M_x` on `L²[0,1]`, `ψ = 1`, `h = 1_{[0,1]}`; `diag(1,2)`, `ψ = (1,1)`, `h = 0` | `{h>0}^ess = [0,1] = σ_ac`; `{h>0}^ess = ∅ = σ_ac` | matches line 4424 and Lemma 3.15 | wording only |
| 1.4(1), (2) deduced with no maximal vector | witness `M_x ⊕` coordinate operator, `λ = 1/2`, `f = (1,0)` | ac mass of `(1/2−ε, 1/2+ε)` is `2ε > 0` for `ε ≤ 1/2`; `σ_ac = [0,1]` has no isolated point | holds | wording only |
| 1.5 deduced from 1.4 | same witness, `[a,b] = [0,1]`; `(a,b) = (1,2)` | density `1 > 0` a.e. on `[0,1]` gives `[0,1] ⊆ σ_ac`; ac mass of `(1,2)` is `0` for every `f` (the `ℓ²(ℝ)` part is pure point) | holds | wording only |
| 3.1, `u` compactly supported (pinned line 289 with `X = grad u`) | on `ℝ`: `v = 1`, `u` a bump; `v = x²`, `u = φ` a bump with `∫φ ≠ 0` | `∫ 1·(−u″) = 0 = ∫ 0·u′`; `∫ x²(−φ″) = ∫ 2xφ′ = −2∫φ`, and `∫ ⟨d(x²), dφ⟩ = ∫ 2xφ′ = −2∫φ` | both sides agree; the line-312 theorem does not apply (`v` has no compact support) | contract and *Needs:* |
| `grad u` is a compactly supported `C¹` field | `u` of class `C²` with compact support | `contMDiff_mgradient` at `n = 1` needs `IsManifold I 2 M` and a `C¹` metric (smooth by the Conventions); `HasCompactSupport.mgradient` gives `tsupport (grad u) ⊆ tsupport u` | hypotheses met | named |
| References = manifest for `teschl` | item-by-item comparison | 19 items on each side, same set | agree | entry and manifest |

## Checks run

**Dependency gate** (prescribed command), output:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Citations.** `roadmaps resolve` on the edited README finds no cross-roadmap citation and no Lean
name missing. The four Tau Ceti names added were each opened at the pinned Tau Ceti (lines cited
above).

**Files.** `design/plan.json` parses as JSON and `sources.toml` as TOML. No machine path or
process wording was added.

There were no gate failures to repair in this round.

## For the maintainer

- No name that another roadmap cites has changed. No id was renumbered, and no supplier,
  dependency edge or gap was added or removed.
- Ownership: no new object was introduced, so there was no ownership question to settle against
  open work.
- No source was fetched and no `needs-references.toml` was written. Every locator added is in the
  cached `teschl` text or the pinned Tau Ceti.
- teschl line 1780 makes the whole book a separable-space text. Any future locator into `teschl`
  for a statement on arbitrary `ℋ` is covered by the new Conventions sentence.
