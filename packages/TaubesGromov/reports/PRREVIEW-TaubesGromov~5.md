# Review of TaubesGromov (pull request #2699 at d94315a)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the Example of Layer 6 now says that the limit cycle for `E = K` on a Kähler surface is an effective divisor in the class `PD(κ)`, a canonical divisor when `b₁(X) = 0`, which is true. The five small corrections and the format note of that review are repaired as well, and the repairs introduce no new problem: the Needs lines of Layer 7 are now acyclic once §7.25, §7.26 and §7.27 are read in the two parts the layer's introduction names. There are no small corrections and no format notes. One fact remains for the human reviewers: Taubes's three J. Differential Geom. papers have no legal open copy and are cited by title only.

## Previous findings

- R01 — repaired: line 1104 reads "the limit cycle of large-`r` solutions is an effective divisor in the class `PD(κ)`, a canonical divisor when `b₁(X) = 0`".
- C01 — repaired: the Layer 7 introduction says "in build order, with two exceptions" and names them; §7.6 needs "the ladder and rates of §7.26; the normalized leading equation and covering by leading zeros with which §7.27 opens".
- C02 — repaired: the contract reads "`Ω = ds ∧ dt + ω_v` (Tau Ceti's `σ_v`), block structures with `J∂_s = R`, the suspension field (Tau Ceti's `T = ∂_t`)".
- C03 — repaired: the description reads "each with a Needs line listing its inputs, and with a locator at the claim wherever a readable source states the result".
- C04 — repaired: the Check of §0.1 reads "in the oriented frame `(ω_u, ρ₁, ρ₂)`, `J′ρ₁ = ω_u × ρ₁ = ρ₂` matches `Je₃ = e₄`".
- C05 — repaired: the docstring of `IsFramedVortex` says "The finite-energy clause follows from the others … it is kept to match the definition of README §4.1".
- N01 — repaired: §7.10 has `Ω = Kπ*ω_C + dϑ`; §7.36 has `ω_N = π*ω_C + d((|y|²/2)(dθ + A_N))`, with `|y|` the fibre norm and `A_N` the flat connection form.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Source / library side (computed) | Result |
| --- | --- | --- | --- | --- |
| Layer 6 Example (R01) | `C₁ × C₂`, `g_i ≥ 2`, `L = p₁*L₁`; `b₁ = 0` | divisor of a section of `K ⊗ L`: class `PD(κ)`, effective, not canonical; allowed by the new wording | `b₁ = 0` gives `h^(0,1) = 0`, `Pic⁰ = 0`, so `c₁ = κ` forces the line `K` | true |
| Layer 7 build order (C01; sample §7.5, §7.26, §7.27) | Needs graph of §7.1–§7.42 with §7.25, §7.26, §7.27 split in two | forward Needs only in §7.6 and §7.25; order 7.25a, 7.26a, 7.27a, 7.6, 7.26b, 7.25b, 7.27b has no cycle; §7.5, §7.21–§7.24 never reach §7.6 | *Gr ⇒ SW* unread | "two exceptions" is exact |
| Dependencies of Layers 2, 4, 9 | Needs of §3.1, §5.1, §10.1 | §3.1 needs §1.2–§1.3; §5.1 needs Layer 0; §10.1 needs no section of this roadmap | suppliers on main as before | "uses nothing from this layer" holds three times |
| §0.1 Check (C04) | frame `(ω_u, ρ₁, ρ₂)` | `J′(0, ρ₁) = (0, ω_u × ρ₁) = (0, ρ₂)`; symbol sends `e₃, e₄` to `ρ₁, ρ₂` | definition of `J′`, line 108 | holds |
| §7.10 taming form (N01) | `ϑ` supported in the disc bundle | `T(dϑ) = 0`, `T(Kπ*ω_C) = Km area(C)` for `[T] = m[C]` | none cited | consistent |
| §7.36 model form (N01) | flat `A_N` | `d((|y|²/2)(dθ + A_N)) = |y| d|y| ∧ (dθ + A_N)` since `dA_N = 0`: the fibre area form | none cited | holds |
| Suspension contract (C02) | `J∂_s` | §10.1 line 2160: `J∂_s = R`, `Ω = ds ∧ dt + ω_v` | Tau Ceti `Suspension/AlmostComplex.lean:221`: `∂_s ↦ T = ∂_t`; `:18`: `σ_v` | agree |
| `IsFramedVortex` docstring (C05) | modulus of `α · (z/|z|)^(−m)` | equals `|α|` off `0`, so `|α|² → 1` | Tau Ceti `Vortex/Energy.lean:153`: hypothesis `4(p² + q²) → 1`; `:179`: `‖sectionValue‖² = 4(p² + q²)` | the clause is implied, as the docstring says |

The rows for the statements the change does not touch stand as in the previous review, of `bf96c5c`.

- Source locators checked against the text: none new; no changed passage carries a locator into a readable source (Layer 7 and §0.1 rest on *Gr ⇒ SW* and *GR = SW*).
- Library declarations opened at the pin: Tau Ceti `Analysis/PDE/Vortex/Energy.lean:153, 179`, `Geometry/Symplectic/Manifold/Suspension/AlmostComplex.lean:18, 221`.
- Cross-roadmap citations: the change adds none; the automatic resolution of the README's citations and Lean names finds none missing.
- Dependency check: "depcheck: 182 roadmaps, 2073 edges, 0 problem(s)"; no UPWARD or CYCLE line. No file outside the folder is changed.
- Automatic checks: all passed. `Suggested.lean` elaborates with three `sorry` warnings only; its statements are unchanged (one docstring gained two sentences), so the five elaborated signatures and the one-tactic probes stand as before.
- The pull request's description was read against this head: the sentence C03 quoted is corrected, and the repairs change nothing else that it describes.

Overlap check: read SeibergWittenTheory (main and its open revision), SymplecticGeometry (open revision), HeegaardFloer, DGFloer and InstantonFloerTheory, as in the previous review; nothing shared. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 9 changed passages searched for in 2 sources (Tau96SWGr, McD96), none shared; the change adds, removes or reorders no layer, so the arrangement stands as compared before (largest share Tau96SWGr, 16 of 54 source citations; contents independent). *Counting*, *Gr ⇒ SW* and *GR = SW* (25 of 54 citations) could not be read.

Research link: the roadmap plans Taubes's theorem SW = Gr for closed symplectic four-manifolds (Taubes, *SW ⇒ Gr*, 1996; *Counting*, 1996; *Gr ⇒ SW* and *GR = SW*, 1999) and its mapping-torus application, the Gromov series as a Lefschetz zeta function (Ionel–Parker, 1999). It rests on the README's References, Tau96SWGr §1 and IP97 Theorem 0.1.

## Not verifiable

- Taubes, *Gr ⇒ SW* (1999) and *GR = SW* (1999): no legal open copy; the sampled §7.5, §7.26 and §7.27 and the Check of §0.1 were checked for internal consistency and by computation only.
- Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4* (1996), and the notes in Math. Res. Lett. 1 (1994) and 2 (1995): no legal open copy; untouched by this change.
- Taubes, Comm. Math. Phys. 72 (1980): paywalled and recorded as uncertified; untouched by this change.

## Source issues

- none

## For the human reviewers

- Not tested: Taubes's three J. Differential Geom. papers (*Counting*, *Gr ⇒ SW*, *GR = SW*) hold 25 of 54 source citations, including the SW = Gr headline (§9.1); no legal open copy exists, so wording and arrangement were not compared with them.
